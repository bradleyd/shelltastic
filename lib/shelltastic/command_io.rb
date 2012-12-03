module ShellTastic
  module IO
    class << self
      def popen command
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
