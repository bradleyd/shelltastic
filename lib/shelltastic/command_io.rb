module ShellTastic
  module IO
    class << self
      # A dirty string check for nil empty or just whitespace
      # @param [String] str the string the needs to be checked
      # @return [Boolean, nil] true if str is empty, nil, or just whitespace
      def string_nil_or_blank? str
        # raise if command is empty or nil
        if str !~ /[^[:space:]]/ || str.nil? || str.empty?
          raise ShellTastic::CommandException.new("Command is emtpy or nil")
        end
      end

      # A wrapper around popen4
      # This is called from the run method
      # @see #run
      # @param [String] command the command to run in the shell
      # @return [Hash] command_results the command results from shell
      # { :output, :pid, :error, :start, :stop, :total_time, :exitstatus }
      def popen command
        string_nil_or_blank? command
        command_results = {}
        begin
          start = ShellTastic::Timer.start
          return_code = Open4::popen4(command) do |pid, stdin, stdout, stderr|
            command_results.store(:output,stdout.read.strip)
            command_results.store(:pid,pid)
            command_results.store(:error,stderr.read.strip)
            stdin.close
          end
          stop = ShellTastic::Timer.stop
          total_time = ShellTastic::Timer.total_time
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
