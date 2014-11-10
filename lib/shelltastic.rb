require_relative "shelltastic/version"
require_relative "shelltastic/exceptions"
require_relative "shelltastic/command_io"

# ShellTastic namespace
module ShellTastic
    class << self
      # run is the entry point to api 
      # @param command [String] command or multiple commands to be executed
      # @param command [Array] multiple commands to be executed
      # @param opts [Hash] opts to block or not block
      # @return [Array] Array of hashes for each command executed @see IO::popen
      # @example
      #   ShellTastic::Command.run "whoami"
      #   ShellTastic::Command.run "whoami", "date"
      #   ShellTastic::Command.run("whoami", "date", block: false)
      def run(*command, **opts)
        command.flatten.map { |cmd| ShellTastic::IO.popen(cmd, opts) }
      end
    end
end
