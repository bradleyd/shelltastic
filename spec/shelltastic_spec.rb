require 'spec_helper'

describe ShellTastic do

  context "blocking call" do

    it "should run a shell command" do
      result = ShellTastic.run("ls -l").first
      result[:exitstatus].should eq(0)
    end

    it "should run multiple commands" do
      result = ShellTastic.run("ls -l", "date")
      result.size.should eq(2) 
    end

    it "should run take an array of commands to run" do
      result = ShellTastic.run(["ls -l", "date"])
      result.size.should eq(2) 
    end


    it "should raise a command exception" do
      expect {
        result = ShellTastic.run("lss -l")
      }.to raise_error(ShellTastic::CommandException)
    end

    it "should alert if command is empty or nil" do
      expect {
        ShellTastic.run("")
      }.to raise_error(ShellTastic::CommandException)
    end

    it "should return `false` for error if there is not any errors" do
      result = ShellTastic.run("date").first
      result[:error].should eq(false)
    end

    it "should return error" do
      result = ShellTastic.run("stat /tmp/foosfdsfdsfsdfsd").first
      result[:exitstatus].should_not eq(0)
    end
  end

  context "non-blocking" do

    # fire and forget
    it "should fire a command in the background and have a pid" do
      result = ShellTastic.run("ls -al /", block: false).first
      result[:pid].should_not be_nil
    end

    it "should fire a command in the background and have a command" do
      result = ShellTastic.run("ls -al /", block: false).first
      result[:command].should eq("ls -al /")
    end

    it "should fire a command in the background and have no ouput" do
      result = ShellTastic.run("ls -al /", block: false).first
      result[:output].should be_nil
    end

    it "should fire a command in the background and raise an error" do
      expect {
        ShellTastic.run("foobar", block: false)
      }.to raise_error(ShellTastic::CommandException)
    end

  end
end
