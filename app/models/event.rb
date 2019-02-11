class Event < ApplicationRecord
  has_many :attendances
  validates :start_date, :presence => true
  validates :duration, :presence => true,:numericality => { greater_than: 0 }
  validates :title, :presence => true,:length => { in: 5..140 }
  validates :description,:presence => true,:length => { in: 20..1000 }
  validates :price,:presence => true,:numericality { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :location, :presence => true
  


  def multiple_of_5
    if duration % 5 != 0
      errors.add(:duration, "it should be a multiple of 5")    
    end
  end
end
