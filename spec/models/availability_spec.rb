# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Availability, type: :model do
  let(:partner) { create :partner, password: 'P@ssw0rd' }
  subject { create :availability, partner: partner }

  it { should belong_to(:partner) }
end
