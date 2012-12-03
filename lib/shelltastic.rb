require "shelltastic/version"
require "shelltastic/command_io"
require "shelltastic/timer"
require "shelltastic/exceptions"
require 'open4'

module ShellTastic
  class Command
    @verbose ||= true
    class << self
      def run(command, *args)
        ShellTastic::IO.popen(command)
      end
    end
  end
end
