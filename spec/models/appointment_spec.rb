# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let(:partner) { create :partner, password: 'P@ssw0rd' }
  let(:service) { create :service, partner: partner }
  let(:customer) { create :customer, password: 'P@ssw0rd' }
  let(:from_time) { DateTime.now }
  let(:to_time) { from_time + service.duration.to_i.minutes }
  subject do
    create :appointment, customer: customer, service: service, date: from_time, from_time: from_time, to_time: to_time
  end

  describe 'associations' do
    it { should belong_to(:customer) }
    it { should belong_to(:service) }
    it { should validate_presence_of(:customer) }
    it { should validate_presence_of(:service) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:from_time) }
    it { should validate_presence_of(:to_time) }
  end
end
