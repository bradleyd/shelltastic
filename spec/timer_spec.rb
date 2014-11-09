require 'spec_helper'

describe ShellTastic::Timer do
  it "should report start time" do
    timer = ShellTastic::Timer.new
    timer.start
    timer.start_time.class.should eq(Time)
  end

  it "should report stop time" do
    timer = ShellTastic::Timer.new
    timer.stop
    timer.stop_time.class.should eq(Time)
  end

  it "should report total time" do
    timer = ShellTastic::Timer.new
    start = timer.start
    sleep 2
    stop  = timer.stop
    total = timer.total_time
    total.round.should eq(2)
  end

end
