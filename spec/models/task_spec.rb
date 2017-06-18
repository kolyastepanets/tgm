require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'Association' do
    it { should belong_to(:user) }
    it { should belong_to(:service) }
  end

  context 'Validation' do
    it { should validate_presence_of(:title) }
  end
end
