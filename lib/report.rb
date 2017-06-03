require "prawn"
module Report
   
  def self.pdfMaker(list)
   Prawn::Document.generate("public/myfile.pdf") do #mudar ref myfile
    list.each do |donation|
     text 'Doação de ' + donation.amount.to_s + ' as ' + donation.last_execution.to_s
    end
   end
  end
  
end