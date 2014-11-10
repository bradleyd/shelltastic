require 'open4'
require_relative 'timer'
require 'forwardable'

module ShellTastic
  class Command
    extend Forwardable

    attr_accessor :command, :pid, :status, :stdout, :stderr, :stdin

    alias_method :output, :stdout

    # @param command [String] command to run
    # @param opts    [Hash] opts 
    def initialize(command, opts={})
      @opts    = { block: true }.merge(opts)
      @timer   = ShellTastic::Timer.new
      @command = command
    end

    def_delegators :@timer, :start_time, :stop_time, :total_time

    # run the command
    # Start a timer when command is run
    # Stop the timer when command finishes
    def run
      @timer.start
      @pid, stdin, out, err = popen
      stdin.close
      @opts[:block] ? wait(out, err) : no_wait(out, err)
      @timer.stop
      self
    end

    def exitstatus
      @status.exitstatus if @status
    end

    private

    def popen
      Open4::popen4(@command)
    end

    # wait for command to finish
    def wait(out, err)
      _, @status = Process::waitpid2(@pid)
      @stdout = out.read.strip
      @stderr = err.read.strip
    end

    # dont wait for command to finish
    def no_wait(out, err)
      Process.detach(@pid)
      out.close
      err.close
    end
  end
end
