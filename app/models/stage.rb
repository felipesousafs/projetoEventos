class Stage < ApplicationRecord
  belongs_to :event

  validates :name, presence: true
  validates :date_start, presence: true
  validates :date_end, presence: true

  validate :date_start_cant_be_later_than_date_end

  def date_start_cant_be_later_than_date_end
    if self.date_start
      if self.date_end <= self.date_start
        errors.add(:date_start, " deve ser menor que a data final.")
      end
    end
  end
end
