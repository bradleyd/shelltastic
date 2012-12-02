require "shelltastic/version"
require "shelltastic/command_io"

module ShellTastic
  module Command
    class << self
      def run command
        ShellTastic::IO.popen(command)
      end
    end
  end
end
