Given /^a Distributed Ruby connection to my Adhearsion server$/ do
  @telephony_tester = TelephonySystemTests.new
end

When /^a test process connects, and transmits a ping to Adhearsion$/ do
  @result = @telephony_tester.ping_adhearsion_ami
end

Then /^a pong of that ping should be received by the test process back from Adhearsion$/ do
  @result.should == 'blue'
end
