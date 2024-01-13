require 'spec_helper'

describe ShellTastic do
  it "runs a shell command"do
    result = ShellTastic::Command.run("ls -l").first
    expect(result.fetch(:exitstatus)).to eq(0)
  end

  it "runs multiple commands"do
    result = ShellTastic::Command.run("ls -l", "date")
    expect(result.size).to eq(2)
  end

  it "takes an array of commands to run"do
    result = ShellTastic::Command.run(["ls -l", "date"])
    expect(result.size).to eq(2)
  end


  it "raises a command exception"do
    expect {
      result = ShellTastic::Command.run("lss -l")
    }.to raise_error(ShellTastic::CommandException)
  end

  it "alerts if command is empty or nil"do
    expect {
      ShellTastic::Command.run("")
    }.to raise_error(ShellTastic::CommandException)
  end

  it "returns `false` for error if there is not any errors"do
    result = ShellTastic::Command.run("date").first
    expect(result[:error]).to eq(false)
  end

  it "returns an error and exit status"do
    result = ShellTastic::Command.run("du -sh /tmp/inotexist").first
    expect(result[:error]).not_to be_nil
    expect(result[:exitstatus]).to eq(1)
  end

  # fire and forget
  it "fires a command in the background and has a pid"do
    result = ShellTastic::Command.start("ls -al /").first
    expect(result[:pid]).not_to be_nil
  end

  it "fires a command in the background and has a command populated"do
    result = ShellTastic::Command.start("ls -al /").first
    expect(result[:command]).to eq("ls -al /")
  end

  it "fires a command in the background and has no ouput"do
    result = ShellTastic::Command.start("ls -al /").first
    expect(result[:output]).to be_nil
  end

  it "fires a command in the background and raises an error"do
    expect {
      ShellTastic::Command.start("foobar").first
    }.to raise_error(ShellTastic::CommandException)
  end
end
