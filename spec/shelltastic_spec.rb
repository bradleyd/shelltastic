require 'spec_helper'

describe ShellTastic do
  it "should run a shell command" do
    result = ShellTastic::Command.run("ls -l").first
    result.fetch(:exitstatus).should eq(0)
  end

  it "should run multiple commands" do
    result = ShellTastic::Command.run("ls -l", "date")
    result.size.should eq(2) 
  end

  it "should run take an array of commands to run" do
    result = ShellTastic::Command.run(["ls -l", "date"])
    result.size.should eq(2) 
  end


  it "should raise a command exception" do
    expect {
    result = ShellTastic::Command.run("lss -l")
    }.to raise_error(ShellTastic::CommandException)
  end

  it "should alert if command is empty or nil" do
    expect {
      ShellTastic::Command.run("")
    }.to raise_error(ShellTastic::CommandException)
  end

  it "should return `false` for error if there is not any errors" do
    result = ShellTastic::Command.run("date").first
    result[:error].should eq(false)
  end

  it "should return error" do
    result = ShellTastic::Command.run("du -sh /tmp/foos").first
    result[:error].should_not eq(false)
  end

  # fire and forget
  it "should fire a command in the background and have a pid" do
    result = ShellTastic::Command.start("ls -al /").first
    result[:pid].should_not be_nil
  end

  it "should fire a command in the background and have a command" do
    result = ShellTastic::Command.start("ls -al /").first
    result[:command].should eq("ls -al /")
  end

  it "should fire a command in the background and have no ouput" do
    result = ShellTastic::Command.start("ls -al /").first
    result[:output].should be_nil
  end

  it "should fire a command in the background and not raise an error" do
    expect {
      ShellTastic::Command.start("foobar").first
    }.to raise_error(ShellTastic::CommandException)
  end


end
