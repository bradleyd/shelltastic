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
      def popen(command, timer)
        string_nil_or_blank?(command)
        command_results = {}
        begin
          start = timer.start
          return_code = Open4::popen4(command) do |pid, stdin, stdout, stderr|
                          command_results.store(:output,stdout.read.strip)
                          command_results.store(:pid,pid)
                          command_results.store(:error,stderr.read.strip)
                          stdin.close
                        end
          stop = timer.stop
          total_time = timer.total_time
          command_results.merge!(start: start, 
                                 stop: stop,
                                 command: command,
                                 total_time: total_time, 
                                 exitstatus: return_code.exitstatus)
        rescue Errno::ENOENT => e
          raise ShellTastic::CommandException.new("Shell command #{command} failed with status #{$?} and ERROR: #{e.message}")
        end
        command_results
      end
    end
  end


end
