class Goal < ApplicationRecord
  enum priority: { low: 0, medium: 1, high: 2 }

  validates :title, length: { maximum: 80 }, presence: true, allow_blank: false
  validates :description, length: { maximum: 500 }, presence: true, allow_blank: false

  validate :due_date_is_valid

  private

  def due_date_is_valid
    if due_date < Time.now || due_date.year > 2100
      errors.add(:due_date, 'should not be empty. Cannot be earlier than today, a year cannot be more than 2100')
    end
  end
end
