class Task < ActiveRecord::Base
  validates :title, presence: true
  #uniqueness: {scope: :project_id}
end
