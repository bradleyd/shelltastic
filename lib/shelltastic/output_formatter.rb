require_relative 'utils'

module ShellTastic
  class OutputFormatter
    include ShellTastic::Utils

    def initialize(command_object)
      @command = command_object
    end

    def to_h
      { 
        output: @command.output,
        pid: @command.pid,
        error: string_nil_or_blank?(@command.stderr) ? false : @command.stderr,
        command: @command.command,
        start: @command.start_time,
        stop: @command.stop_time,
        total_time: @command.total_time,
        exitstatus: @command.exitstatus
      }
    end
  end
end
