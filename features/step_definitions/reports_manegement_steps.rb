require_relative '/home/ubuntu/workspace/lib/report.rb'
require_relative '/home/ubuntu/workspace/lib/time_utils.rb'

Given(/^The user "([^"]*)" is registered in the system$/) do |name|
  user = User.create(name: name, email: name + "@gmail.com")
  user.save
end

Given(/^User "([^"]*)" made a donation of "([^"]*)" at "([^"]*)"$/) do |name, amount, date|
  user = User.find_by name: name
  donation = Donation.create(amount: amount, last_excution: TimeUtils.fullDateToTimestamp(date), user_id: user.id)
  donation.save
  
  puts Donation.count
end

When(/^I request the Accounting report from "([^"]*)" to "([^"]*)"$/) do |start_date, end_date|
  TimeUtils.getStartDate(start_date)
  TimeUtils.getEndDate(end_date)
end

Then(/^I recieve a report with all data from Accounting with name "([^"]*)"$/) do |date|
  pending # Write code here that turns the phrase above into concrete actions
end