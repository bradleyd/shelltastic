require_relative "shelltastic/version"
require_relative "shelltastic/utils"
require_relative "shelltastic/command_io"
require_relative "shelltastic/timer"
require_relative "shelltastic/exceptions"

# @! ShellTastic 
module ShellTastic
  # Command is the namespace for the actual meat of the gem
  class Command
    # set verbosity
    @verbose ||= true
    class << self
      # encapsualtes the popen call 
      # @param [String] command the command that wants to be run
      # @param [Object] timer timer object, @see ShellTastic::Timer
      # @param [Array] args an array of other arguments
      # @return [Hash] from #::IO::popen
      def run(command)
        ShellTastic::IO.popen(command, ShellTastic::Timer)
      end
    end
  end
end
