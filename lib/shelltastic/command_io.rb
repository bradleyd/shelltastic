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
      # @param command [Formatter] formatter object to build output
      # @return [Hash] hash meta-data for the command executed
      # @example
      #   { :output, :pid, :error, :start, :stop, :total_time, :exitstatus }
      def popen(command, timer, formatter)
        string_nil_or_blank! command
        begin
          formatter.start = timer.start
          pid, stdin, stdout, stderr = Open4::popen4(command)
          stdin.close
          _, status = Process::waitpid2 pid
          error = stderr.read.strip
          formatter.build({command: command,
                            output: stdout.read.strip,
                            pid: pid,
                            error: string_nil_or_blank?(error) ? false : error,
                            stop: timer.stop,
                            exitstatus: status.exitstatus,
                            total_time: timer.total_time})
        rescue Errno::ENOENT => e
          raise ShellTastic::CommandException.new("Shell command #{command} failed with status #{$?} and ERROR: #{e.message}")
        end
        formatter.inspect
      end
    end
  end
end
