require 'spec_helper'

describe ShellTastic::OutputFormatter do
  before :each do
    @result = ShellTastic::OutputFormatter.new
    @result.build(output: "Fri Feb 14 20:54:59 MST 2014",
                  pid: "10000000",
                  error: "No such file or directory")
  end
  it "should return a hash" do
    @result.inspect.should be_kind_of(Hash)
  end

  it "should allow to add key value pairs" do
    @result.command = "date"
    @result.inspect[:command].should eq("date")
  end

  it "should have total time" do
    timer = ShellTastic::Timer.new
    @result.start = timer.start
    @result.stop  = timer.stop
    @result.total_time = timer.total_time
    @result.total_time.should_not be_nil
  end
end
