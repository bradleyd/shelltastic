require "shelltastic/version"
require "shelltastic/exceptions"
require "shelltastic/timer"
require "shelltastic/io"
require 'open4'

module ShellTastic

  class Command
    attr_accessor :pid, :exitstatus, :verbose
    def initialize options={}
      @cmd ||= options.fetch(:cmd, nil)
      @verbose ||= options.fetch(:verbose, true)
    end
    
    def run
      raise ShellTastic::CommandException.new("No command was given!") if @cmd.nil?
      ShellTastic::IO.popen(@cmd).each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
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
