require 'spec_helper'

describe ShellTastic::Command do
  #=> [:command, :command=, :pid, :pid=, :status, :status=, :stdout, :stdout=, :stderr, :stderr=, :stdin, :stdin=, :output, :start_time, :stop_time, :total_time, :run, :exitstatus]
  context "not run yet" do 
    it "should not have any stdout" do
      cmd = ShellTastic::Command.new("echo hi")
      cmd.stdout.should be_nil
    end


    it "should not have a status" do
      cmd = ShellTastic::Command.new("echo hi")
      cmd.status.should be_nil
    end

    it "should not have a pid" do
      cmd = ShellTastic::Command.new("echo hi")
      cmd.pid.should be_nil
    end

  end

  context "run command" do
    it "should have stdout" do
      cmd = ShellTastic::Command.new("echo hi").run
      cmd.stdout.should eq("hi")
    end
    it "should have a status" do
      cmd = ShellTastic::Command.new("echo hi").run
      cmd.status.should_not be_nil
    end

    it "should have a pid" do
      cmd = ShellTastic::Command.new("echo hi").run
      cmd.pid.should_not be_nil
    end

    it "should have a output" do
      cmd = ShellTastic::Command.new("echo hi").run
      cmd.output.should eq("hi")
    end

    it "should have a exitstatus" do
      cmd = ShellTastic::Command.new("echo hi").run
      cmd.exitstatus.should_not be_nil
    end

    it "should have a error" do
      cmd = ShellTastic::Command.new("stat /tmp/fooo").run
      cmd.stderr.should_not be_false
    end

    it "should have a start time" do
      cmd = ShellTastic::Command.new("echo hi").run
      cmd.start_time.should_not be_nil
    end

    it "should have a stop time" do
      cmd = ShellTastic::Command.new("echo hi").run
      cmd.stop_time.should_not be_nil
    end

    it "should have a total time" do
      cmd = ShellTastic::Command.new("echo hi").run
      cmd.total_time.should_not be_nil
    end



  end


end

