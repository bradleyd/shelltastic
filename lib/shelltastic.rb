require_relative "shelltastic/version"
require_relative "shelltastic/utils"
require_relative "shelltastic/command_io"
require_relative "shelltastic/timer"
require_relative "shelltastic/exceptions"

# @! ShellTastic 
module ShellTastic
  # Command is the namespace for the actual meat of the gem
  class Command
    class << self
      # encapsualtes the popen call 
      # @param command [String] command or multiple commands to be executed
      # @param timer [Object] timer object, @see ShellTastic::Timer
      # @return [Array] Array of hashes for each command executed @see IO::popen
      # @example
      # ShellTastic::Command.run "whoami"
      # ShellTastic::Command.run "whoami", "date"
      def run(*command)
        command.flatten.map { |cmd| ShellTastic::IO.popen(cmd, ShellTastic::Timer) }
      end
    end
  end
end
