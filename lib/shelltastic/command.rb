require 'open4'
require_relative 'timer'
require 'forwardable'

module ShellTastic
  class Command
    extend Forwardable

    attr_accessor :command, :pid, :status, :stdout, :stderr, :stdin

    alias_method :output, :stdout

    def initialize(command, opts={})
      @opts    = { block: true }.merge(opts)
      @timer   = ShellTastic::Timer.new
      @command = command
    end

    def_delegators :@timer, :start_time, :stop_time, :total_time

    def run
      @timer.start
      @pid, stdin, out, err = popen
      stdin.close
      if @opts[:block]
        wait(out, err)
      else
        no_wait(out, err)
      end
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

    def wait(out, err)
      _, @status = Process::waitpid2(@pid)
      @stdout = out.read.strip
      @stderr = err.read.strip
    end

    def no_wait(out, err)
      Process.detach(@pid)
      out.close
      err.close
    end

  end
end
