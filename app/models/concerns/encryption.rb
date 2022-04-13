module Encryption
  extend ActiveSupport::Concern

  included do
    before_save :encrypt_password, if: proc { |user| user.changes.include?('password') }
  end

  private

  def encryptor
    @encryptor ||= ActiveSupport::MessageEncryptor.new(ENV['KEY'])
  end

  def encrypt_password
    self.password = encryptor.encrypt_and_sign(password)
  end
end
