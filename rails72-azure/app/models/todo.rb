class Todo < ApplicationRecord
  validates :title, presence: true

  scope :recent_first, -> { order(created_at: :desc) }
end
