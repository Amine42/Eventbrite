class Event < ApplicationRecord
  has_many :attendances
  validates :start_date, :presence => true
  validates :duration, :presence => true, :numericality => { greater_than: 0 }
  validates :title, :presence => true, :length => { in: 5..140 }
  validates :description, :presence => true, :length => { in: 20..1000 }
  validates :price, :presence => true, :numericality => { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :location, :presence => true
  validates :date_before
  validates :multiple_of_5

  def date_before
    if start_date < DateTime.now
      errors.add(:start_date, "can't be in to the past")
    else
      return true
    end
  end

  def multiple_of_5
    if duration % 5 != 0
      errors.add(:duration, "it should be a multiple of 5")
    else
      return true
    end
  end
end
