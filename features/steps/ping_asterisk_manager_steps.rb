Given /^a set of login details for my Asterisk Manager Interface$/ do
  @telephony_tester = TelephonySystemTests.new
end

When /^a test process connects, logins in and transmits a ping$/ do
  @result = @telephony_tester.ping_asterisk_manager
end

Then /^a pong of that ping should be received by the test process$/ do
  @result.should == "Response: Pong"
end