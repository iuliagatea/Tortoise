require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject { create :customer, password: 'P@ssw0rd' }

  describe 'associations' do
    it { should have_many(:appointments) }
  end
end
