# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TimeSlot do
  let(:partner) { create :partner, password: 'P@ssw0rd' }
  let(:availability) { create :availability, partner: partner, wday: 1 }
  let(:service) { create :service, partner: partner, duration: 40 }
  let(:date) { '18.04.2022'.to_date }
  let(:ts) { TimeSlot.new service, date }
  subject { ts.slots }

  context 'without appointments' do
    before do
      availability
      subject
    end

    it 'generates available slots' do
      expect(subject.count).to eq(12)
    end
  end

  context 'with appointments' do
    let(:customer) { create :customer, password: 'P@ssw0rd' }
    let(:from_time) { '11:00' }
    let(:to_time) { '12:30' }
    let(:appointment) do
      create :appointment, customer: customer, service: service, date: date, from_time: from_time, to_time: to_time
    end

    before do
      availability
      appointment
      subject
    end

    it 'generates available slots' do
      expect(subject.count).to eq(10)
    end
  end
end
