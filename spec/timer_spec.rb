require 'spec_helper'

describe ShellTastic::Timer do
  it "should report start time" do
    start = ShellTastic::Timer.start
    start.class.should eq(Time)
  end

  it "should report stop time" do
    stop = ShellTastic::Timer.stop
    stop.class.should eq(Time)
  end

  it "should report total time" do
    start = ShellTastic::Timer.start
    sleep 2
    stop  = ShellTastic::Timer.stop
    total = ShellTastic::Timer.total_time
    total.round.should eq(2)
  end

end
