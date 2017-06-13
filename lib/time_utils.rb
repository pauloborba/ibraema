require 'time'
module TimeUtils
    
    def self.getStartDate(date)
        Time.strptime(date, '%B %Y')
    end
    
    def self.getEndDate(date)
        Time.strptime(date, '%B %Y').next_month - 1
    end
    
    def self.fullDateToTimestamp(date)
        Time.strptime(date, '%H:%M %d/%m/%Y')
    end
    
    def self.toTimestamp(date)
        Time.strptime(date, '%d/%m/%Y')
    end

end
