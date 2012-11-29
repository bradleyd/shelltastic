require "shelltastic/version"
require "shelltastic/exceptions"
require 'open4'

module ShellTastic

  class Command
    attr_accessor :pid, :exitstatus, :verbose
    def initialize options={}
      #yield self if block_given?
      @cmd ||= options[:cmd]
      @verbose ||= options[:verbose]
    end
    
    def run

      begin
      return_code = Open4::popen4(@cmd) do |pid, stdin, stdout, stderr|
        @output = stdout.read
        @pid = pid
        @error = stderr
        stdin.close
      end
      rescue Errno::ENOENT => e
        raise ShellTastic::CommandException.new("Shell command #{@cmd} failed with status #{$?}")
      end
      @exitstatus = return_code.exitstatus
    end

    def output=(command_output)
      @output = command_output
    end

    def output
      @output.to_s if @verbose
    end

    def error=(command_error)
      @error=command_error
    end

    def error
      @error.to_s if @verbose
    end

    def to_s
      puts @output.to_s if @verbose
    end
  end
end
