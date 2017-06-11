require "prawn"
module Report
   
  def self.pdfMaker(list)
   Prawn::Document.generate('public/myfile.pdf') do #mudar ref myfile
    list.each do |donation|
     text 'Doação de ' + donation.amount.to_s + ' as ' + donation.donation_date.to_s
    end
   end
  end
  
  def self.pdfReader
   reader = PDF::Reader.new("public/myfile.pdf")
   reader.pages.each do |page|
     page.text.lines.each do |line|
      p DateTime.parse(line.split.slice(4, 3).join(" "))
     end
   end
  end
end