class Todo < ApplicationRecord
  belongs_to :user

  validates :title, presence: true

  scope :recent_first, -> { order(created_at: :desc) }
end
