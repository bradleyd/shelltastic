# encoding: utf-8

require_relative 'output_formatter'
require_relative 'utils'
require_relative 'command'

module ShellTastic
  class IO
    extend ShellTastic::Utils
    class << self
      # A wrapper around Command
      #
      # @see #run
      # @param command [String] command(s) to execute
      # @param command [Array] command(s) to execute
      # @param opts    [Hash] opts hash
      # @example
      #   { block: false}
      # @return [Hash] hash meta-data for the command executed
      # @example
      #   { :output, :pid, :error, :start, :stop, :total_time, :exitstatus }
      def popen(command, opts={})
        string_nil_or_blank! command
        begin
          cmd = ShellTastic::Command.new(command, opts)
          cmd.run
          formatter = ShellTastic::OutputFormatter.new(cmd)
        rescue Errno::ENOENT => e
          raise ShellTastic::CommandException.new("Shell command #{command} failed with status #{$?} and ERROR: #{e.message}")
        end
        formatter.to_h
      end
    end
  end
end
