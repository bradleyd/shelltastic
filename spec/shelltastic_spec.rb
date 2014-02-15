require 'spec_helper'

describe ShellTastic do
  it "should run a shell command" do
    result = ShellTastic::Command.run("ls -l")
    result.first.fetch(:exitstatus).should eq(0)
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
    }.to raise_error("The command is emtpy or nil")
  end

  it "should return `false` for error if there is not any errors" do
    result = ShellTastic::Command.run("date")
    result[:error].should eq(false)
  end

  it "should return error" do
    result = ShellTastic::Command.run("du -sh /tmp/foos")
    result[:error].should_not eq(false)
  end


end
