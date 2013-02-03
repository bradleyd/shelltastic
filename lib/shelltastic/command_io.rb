# encoding: utf-8

require 'open4'

module ShellTastic
  module IO
    extend ShellTastic::Utils
    class << self
      # A wrapper around popen4
      #
      # @see #Command.run
      # @param [String] command the command to run in the shell
      # @return [Hash] command_results the command results from shell
      # { :output, :pid, :error, :start, :stop, :total_time, :exitstatus }
      def popen(command, timer=ShellTastic::Timer)
        string_nil_or_blank?(command)
        command_results = {}
        begin
          start = timer.start
          return_code = Open4::spawn(command) do |pid, stdin, stdout, stderr|
            command_results.store(:output,stdout.read.strip)
            command_results.store(:pid,pid)
            command_results.store(:error,stderr.read.strip)
            stdin.close
          end
          stop = timer.stop
          total_time = timer.total_time
          command_results.merge!(start: start, stop: stop, 
                                 total_time: total_time, 
                                 exitstatus: return_code.exitstatus)
        rescue Errno::ENOENT => e
          raise ShellTastic::CommandException.new("Shell command #{command} failed with status #{$?}")
        end
        command_results
      end
    end
  end


end
