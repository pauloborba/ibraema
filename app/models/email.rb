class Email < ApplicationRecord
    before_save :check_blank_subject, :check_mark
    validates :subject, presence: true
    validates :message, presence: true
    
    def check_mark
        self.mark = true
    end

    def check_blank_subject
        return false if self.subject.blank? == true
    end
end
