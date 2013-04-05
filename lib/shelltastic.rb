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
      # @param command [String] the command that wants to be run
      # @param  timer [Object] timer object, @see ShellTastic::Timer
      # @return [Hash] from #::IO::popen
      # @example
      # ShellTastic::Command.run "whoami"
      def run(command)
        ShellTastic::IO.popen(command, ShellTastic::Timer)
      end

      # run multiple system commands
      #
      # @param args [Array] args multiple system commands
      # @return [Array] array of hashes from the results of IO.popen
      # @example
      # ShellTastic::Command.run_each "whoami", "date", "uname"
      def run_each(*args)
        args.map { |cmd| ShellTastic::IO.popen(cmd, ShellTastic::Timer) }
      end
    end
  end
end
