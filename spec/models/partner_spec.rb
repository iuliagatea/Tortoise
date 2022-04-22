# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Partner, type: :model do
  subject { create :partner, password: 'P@ssw0rd' }

  describe 'associations' do
    it { should have_many(:services) }
  end
end
