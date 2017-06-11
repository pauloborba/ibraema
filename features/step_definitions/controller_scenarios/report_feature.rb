require_relative '/home/ubuntu/workspace/lib/report.rb'
require_relative '/home/ubuntu/workspace/lib/time_utils.rb'

Given(/^The user "([^"]*)" is registered in the system$/) do |name|
  user = User.create(name: name, email: name + "@gmail.com")
  user.save
end

Given(/^User "([^"]*)" made a donation of "([^"]*)" at "([^"]*)"$/) do |name, amount, date|
  user = User.find_by name: name
  donation = Donation.create(amount: amount, donation_date: TimeUtils.fullDateToTimestamp(date), user_id: user.id)
  donation.save
end

When(/^I request the Accounting report from "([^"]*)" to "([^"]*)"$/) do |start_date, end_date|
  start_date = TimeUtils.getStartDate(start_date)
  end_date = TimeUtils.getEndDate(end_date)
 
  Report.pdfMaker(Donation.all.select { |donation| (donation.donation_date >= start_date && donation.donation_date <= end_date) })
end

Then(/^I recieve a report with all data from Accounting$/) do
   Report.pdfReader
end