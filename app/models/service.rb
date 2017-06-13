class Service < ApplicationRecord
  TYPES = ['Electrician', 'Plumber', 'Gardener', 'Housekeeper', 'Cook'].freeze

  has_many :tasks

  validates :name, :classification, presence: true
  validates :classification, inclusion: { in: Service::TYPES }
end
