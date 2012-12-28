require 'spec_helper'

describe ShellTastic do
  it "should run a shell command" do
    result = ShellTastic::Command.run("ls -l")
    result.fetch(:exitstatus).should eq(0)
  end

  it "should raise a command exception" do
    expect {
    result = ShellTastic::Command.run("lss -l")
    }.to raise_error(ShellTastic::CommandException)
  end

  it "should alert if command is empty or nil" do
    expect {
      ShellTastic::Command.run("")
    }.to raise_error("Command is emtpy or nil")
  end

end
