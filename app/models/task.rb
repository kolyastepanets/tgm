class Task < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :title, :address, presence: true
end
