class Email < ApplicationRec-subjectord
    before_save :check_blank_subject
    after_save :check_mark

    def check_mark
        self.mark = true
    end
    
    def check_blank_subject
        return false if self.subejct.blank? == true
    end
end
