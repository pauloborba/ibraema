require_relative '/home/ubuntu/workspace/lib/report.rb'
require_relative '/home/ubuntu/workspace/lib/time_utils.rb'

#Scenario 1
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
  @fileName = "accounting-" + DateTime.now().to_s
  @systemDonations = Donation.all.select { |donation| (donation.donation_date >= start_date && donation.donation_date <= end_date) } 
  Report.accountingPdfMaker(@fileName, @systemDonations)
end

Then(/^I recieve a Accounting report with data from "([^"]*)" to "([^"]*)"$/) do |start_date, end_date|
  start_date = TimeUtils.getStartDate(start_date)
  end_date = TimeUtils.getEndDate(end_date)
  pdfDonations = Report.accountingPdfReader(@fileName)
  expect(pdfDonations.count).to be @systemDonations.count
  c = 0
  @systemDonations.each do |donation|
    expect(donation.amount.to_f).to be pdfDonations[c][0]
    expect(donation.donation_date.to_i).to be pdfDonations[c][1].to_i
    c = c + 1
  end
end

#Scenario 2
Given(/^a Person with name "([^"]*)", cpf "([^"]*)" and email "([^"]*)" is registered$/) do |name, cpf, email|
  user = User.create(name: name, identifier: cpf, email: email, type: 'Person')
  user.save
end

Given(/^a Company with name "([^"]*)", cnpj "([^"]*)" and email "([^"]*)" is registered$/) do |name, cnpj, email|
  user = User.create(name: name, identifier: cnpj, email: email, type: 'Company')
  user.save
end

When(/^I request the Donor report$/) do
  @fileName = "donors-" + DateTime.now().to_s
  @donorCheck = User.all.select { |user| (user.isDonor) }
  Report.donorPdfMaker(@fileName, @donorCheck)
end

Then(/^I receive a Donor report with all donors$/) do
  pdfUser = Report.donorPdfReader(@fileName)
  expect(pdfUser.count).to be @donorCheck.count
  c = 0
  @donorCheck.each do |user|
    expect(user.identifier.to_s).to eq(pdfUser[c].to_s)
    c = c + 1
  end
end

Then(/^the User "([^"]*)" is not in it$/) do |name|
  pdfUser = Report.donorPdfReader(@fileName)
  c = 0
  @donorCheck.each do |user|
    expect(User.find_by(name: name).identifier.to_s).not_to eq(pdfUser[c].to_s)
    c = c + 1
  end
end

#Scenario 3
When(/^I request the Coaching Activity report from "([^"]*)"$/) do |date|
  @fileName = "coaching_activity-" + DateTime.now().to_s
  @systemCoachings = Institution.all 
  Report.coachingPdfMaker(@fileName, @systemCoachings, date)
end

Then(/^I recieve a Coaching Activity report with data from "([^"]*)"$/) do |date|
  pdfCoaching = Report.coachingPdfReader(@fileName)
  c = 0
  @systemCoachings.each do |institution|
    expect(institution.cnpj.to_s).to eq(pdfCoaching[c].to_s)
    coaching_activities = institution.coaching_activities.select{ |coaching_activity| (TimeUtils.getStartDateNumber(date) >= coaching_activity.date_start && TimeUtils.getEndDateNumber(date) <= coaching_activity.date_finish) }
    coaching_activities.each do |facilitator|
      expect(facilitator.cpf.to_s).to eq(pdfCoaching[c].to_s)
      c = c + 1
    end  
  end
end