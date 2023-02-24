require 'rails_helper'

RSpec.describe Entity, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:group) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:amount).is_greater_than_or_equal_to(0) }
  end
end
