module ShellTastic

  module IO
    class << self
      def popen command
        command_results = {}
        begin
          return_code = Open4::popen4(command) do |pid, stdin, stdout, stderr|
            command_results.store(:output,stdout.read.strip)
            command_results.store(:pid,pid)
            command_results.store(:error,stderr.read.strip)
            stdin.close
          end
        rescue Errno::ENOENT => e
          raise ShellTastic::CommandException.new("Shell command #{command} failed with status #{$?}")
        end
        command_results.store(:exitstatus,return_code.exitstatus)
        command_results
      end
    end
  end


end
