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

Then(/^I recieve a Accounting report with data from "([^"]*)" to "([^"]*)"$/) do |start_date, end_date|
  start_date = TimeUtils.getStartDate(start_date)
  end_date = TimeUtils.getEndDate(end_date)
  
  systemDonations = Donation.all.select { |donation| (donation.donation_date >= start_date && donation.donation_date <= end_date) }
  pdfDonations = Report.pdfReader
  
  expect(pdfDonations.count).to be systemDonations.count
  
  c = 0
  systemDonations.each do |donation|
    expect(donation.amount.to_f).to be pdfDonations[c][0]
    expect(donation.donation_date.to_i).to be pdfDonations[c][1].to_i
    c = c + 1
  end
end