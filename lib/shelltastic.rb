require_relative "shelltastic/version"
require_relative "shelltastic/utils"
require_relative "shelltastic/command_io"
require_relative "shelltastic/timer"
require_relative "shelltastic/exceptions"

# ShellTastic namespace
module ShellTastic
  class Command
    class << self
      # run is the entry point to api 
      # @param command [String] command or multiple commands to be executed
      # @param command [Array] multiple commands to be executed
      # @param timer [Object] timer object, @see ShellTastic::Timer
      # @return [Array] Array of hashes for each command executed @see IO::popen
      # @example
      #   ShellTastic::Command.run "whoami"
      #   ShellTastic::Command.run "whoami", "date"
      def run(*command)
        command.flatten.map { |cmd| ShellTastic::IO.popen(cmd, ShellTastic::Timer.new) }
      end
    end
  end
end
