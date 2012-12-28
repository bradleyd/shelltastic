require_relative "shelltastic/version"
require_relative "shelltastic/command_io"
require_relative "shelltastic/timer"
require_relative "shelltastic/exceptions"
require 'open4'

# @! ShellTastic 
module ShellTastic
  # Command is the namespace for the actual meat of the gem
  class Command
    # set verbosity
    @verbose ||= true
    class << self
      # encapsualtes the popen call 
      # @param [String, ...] command the command that wants to be run
      # @return [Hash] from #::IO::popen
      def run(command, *args)
        ShellTastic::IO.popen(command)
      end
    end
  end
end
