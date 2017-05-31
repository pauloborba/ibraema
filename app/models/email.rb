class Email < ApplicationRecord
    before_save :check_blank_subject
    after_save :check_mark

    def check_mark
        self.mark = true
    end
    
    def check_blank_subject
        return false if self.subject.blank? == true
    end
end
