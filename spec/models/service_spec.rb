require 'rails_helper'

RSpec.describe Service, type: :model do
  let(:partner) { create :partner, password: 'P@ssw0rd' }
  subject { create :service, user: partner }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:appointments) }
  end
end
