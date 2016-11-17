class Project < ApplicationRecord
  has_many :time_entries

  def self.clean_old(date = Date.today.beginning_of_day)
    where('created_at < ?', date)
    
  end
end
