require "prawn"
module Report
   
    def self.pdfMaker
        Prawn::Document.generate("public/myfile.pdf") do #mudar ref myfile
            text "Hello"
        end
    end 

end