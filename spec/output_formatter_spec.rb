require 'spec_helper'

describe ShellTastic::OutputFormatter do
  before :each do
    @command = ShellTastic::Command.new("echo hi")
    @command.run
    @result = ShellTastic::OutputFormatter.new(@command)
  end

  it "should return a hash" do
    @result.to_h.should be_kind_of(Hash)
  end

  it "should have total time" do
    @result.to_h.should have_key(:total_time)
  end

  it "should have pid" do
    @result.to_h.should have_key(:pid)
  end

  it "should have output" do
    @result.to_h.should have_key(:output)
  end

  it "should have command" do
    @result.to_h.should have_key(:command)
  end

  it "should have error" do
    @result.to_h.should have_key(:error)
  end

  it "should have exitstatus" do
    @result.to_h.should have_key(:exitstatus)
  end


end

