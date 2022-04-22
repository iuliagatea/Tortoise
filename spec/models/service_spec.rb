# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Service, type: :model do
  let(:partner) { create :partner, password: 'P@ssw0rd' }
  subject { create :service, partner: partner }

  describe 'associations' do
    it { should belong_to(:partner) }
    it { should have_many(:appointments) }
  end
end
