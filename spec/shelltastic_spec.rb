require 'spec_helper'

describe ShellTastic do

  it "should have a version" do
    ShellTastic::VERSION.should_not be_nil
  end

  it "should run shell command and exit 0" do
    status = ShellTastic::Command.new(cmd: "ls -l")
    status.run
    status.exitstatus.should eq(0)
  end

  it "should run shell command and NOT exit 0" do
    status = ShellTastic::Command.new(cmd: "lss -l")
    expect {
    status.run
    status.exitstatus
    }.to raise_error(ShellTastic::CommandException)
  end

  it "should print commad output to stdout" do
    status = ShellTastic::Command.new(cmd: "echo 'foo'", verbose: true)
    status.run
    status.output.should eq("foo\n")
  end
  
  it "should NOT print commad output to stdout" do
    status = ShellTastic::Command.new(cmd: "echo 'foo'", verbose: false)
    status.run
    status.output.should eq(nil)
  end

end

