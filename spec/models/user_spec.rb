require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create :user, email: 'USER@test.com' }

  describe 'validations' do
    context 'first_name' do
      it { should validate_presence_of(:first_name) }
      it { should validate_length_of(:first_name).is_at_least(3).is_at_most(25) }
    end
    context 'last_name' do
      it { should validate_presence_of(:last_name) }
      it { should validate_length_of(:last_name).is_at_least(3).is_at_most(25) }
    end
    context 'email' do
      it { should validate_presence_of(:email) }
      it { should validate_uniqueness_of(:email).case_insensitive }
      it 'should have valid format' do
        invalid_emails = %w[user@testcom user@test..com usertest.com]
        invalid_emails.each do |invalid_email|
          subject.email = invalid_email
          expect(subject).to_not be_valid
        end
      end
    end
    context 'password' do
      it { should validate_presence_of(:password) }
      it { should validate_length_of(:password).is_at_least(6) }
      it 'should have valid format' do
        invalid_passwords = %w[Testtt test test1 test! test1! Test1 Test!]
        invalid_passwords.each do |invalid_password|
          subject.password = invalid_password
          expect(subject).to_not be_valid
        end
      end
    end

    it { is_expected.to be_valid }
  end

  context 'email' do
    it 'should downcase before save' do
      expect(subject.email).to eq 'user@test.com'
    end
  end

  context 'password' do
    it 'should be encrypted before save' do
      expect(subject.password).to_not eq 'User!23'
    end

    let(:password) { subject.password }
    it 'should not re-encrypt password when updated' do
      subject.update(is_admin: true)
      subject.save
      expect(subject.password).to eq password
    end
  end
end
