# encoding: utf-8

require 'open4'

module ShellTastic
  class IO
    extend ShellTastic::Utils
    class << self
      # A wrapper around popen4
      #
      # @see #run
      # @param command [String] command(s) to execute
      # @param command [Array] command(s) to execute
      # @param command [Time] time object for run time
      # @return [Array] array of hash meta-data for the command(s) executed
      # { :output, :pid, :error, :start, :stop, :total_time, :exitstatus }
      def popen command
        string_nil_or_blank! command
        command_results = {}
        begin
          start = timer.start
          command_results.store(:output,stdout.read.strip)
          command_results.store(:pid,pid)
          error = stderr.read.strip
          command_results.store(:error, 
                                string_nil_or_blank?(error) ? false : error)
          stdin.close
        end
        stop = ShellTastic::Timer.stop
        total_time = ShellTastic::Timer.total_time
        command_results.merge!(start: start, stop: stop, 
                               total_time: total_time, 
                               exitstatus: return_code.exitstatus)
      rescue Errno::ENOENT => e
        raise ShellTastic::CommandException.new("Shell command #{command} failed with status #{$?} and ERROR: #{e.message}")
      end
      command_results
    end
  end
end
