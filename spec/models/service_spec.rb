require 'rails_helper'

RSpec.describe Service, type: :model do
  context 'Association' do
    it { should have_many(:tasks) }
  end

  context 'Validation' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:classification) }
    it { should validate_inclusion_of(:classification).in_array(Service::TYPES) }
  end
end
