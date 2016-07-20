class Project < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  belongs_to :user
  validate :due_date_cannot_be_in_the_past

  def due_date_cannot_be_in_the_past
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "can't be in the past")
    end
  end
end
