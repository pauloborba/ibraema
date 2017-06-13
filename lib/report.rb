require "prawn"
require "time_utils"
module Report
   
  def self.accountingPdfMaker(name, list)
    Prawn::Document.generate('public/' + name + '.pdf') do 
      list.each do |donation|
        text 'Doação de ' + donation.amount.to_s + ' as ' + donation.donation_date.to_s
      end
    end
  end
  
  def self.accountingPdfReader(name)
    data = []
    reader = PDF::Reader.new('public/' + name + '.pdf')
    reader.pages.each do |page|
      page.text.lines.each do |line|
        arr = [2]
        arr[0] = line.split[2].to_f
        arr[1] = DateTime.parse(line.split.slice(4, 3).join(" "))
        data.push(arr)
      end
    end
    return data
  end
  
  def self.donorPdfMaker(name, list)
    Prawn::Document.generate('public/' + name + '.pdf') do
      list.each do |user|
        if(user.type == 'Person') then
          text "Cpf: " + user.cpf.to_s + " da pessoa: " + user.name  + " no valor de: R$" + user.donations.last.amount.to_s
        else
          text "Cnpf: " + user.cnpj.to_s + " da empresa: " + user.name + " no valor de: R$" + user.donations.last.amount.to_s 
        end
      end
    end
  end
  
  def self.donorPdfReader(name)
    data = []
    reader = PDF::Reader.new('public/' + name + '.pdf')
    reader.pages.each do |page|
      page.text.lines.each do |line|
        data.push(line.split[1].to_s) 
      end
    end
    return data
  end
  
  def self.coachingPdfMaker(name, list, date)
    Prawn::Document.generate('public/' + name + '.pdf') do 
      list.each do |institution|
      text 'CNPJ: ' + institution.cnpj.to_s + ' Nome: ' + institution.name.to_s
      coaching_activities = institution.coaching_activities.select{ |coaching_activity| (TimeUtils.getDate(date) >= coaching_activity.date_start && TimeUtils.getEndDate2(date) <= coaching_activity.date_finish) }
      coaching_activities.each do |coaching_activity|
        text 'Data: ' + coaching_activity.date_start + ' - ' + coaching_activity.date_finish 
          coaching_activity.facilitators.each do |facilitator|
            text 'Cpf: ' + facilitator.cpf.to_s + ' de nome: ' + facilitator.name.to_s
          end
        end
      end 
    end
  end
  
  def self.coachingPdfReader(name)
    data = []
    reader = PDF::Reader.new('public/' + name + '.pdf')
    reader.pages.each do |page|
      page.text.lines.each do |line|
        data.push(line.split[1].to_s)
      end
    end
    return data
  end
  
end