require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let(:partner) { create :partner, password: 'P@ssw0rd' }
  let(:service) { create :service, user: partner }
  let(:customer) { create :customer, password: 'P@ssw0rd' }
  let(:from_date) { DateTime.now }
  let(:to_date) { from_date + service.duration.to_i.minutes}
  subject { create :appointment, partner: partner, customer: customer, service: service, from: from_date, to: to_date }

  describe 'associations' do
    it { should belong_to(:customer) }
    it { should belong_to(:partner) }
    it { should belong_to(:service) }
    it { should validate_presence_of(:customer) }
    it { should validate_presence_of(:partner) }
    it { should validate_presence_of(:service) }
    it { should validate_presence_of(:from) }
    it { should validate_presence_of(:to) }
  end
end
