class User < ApplicationRecord
  has_secure_password

  after_destroy :ensure_an_admin_remains
  class Error < StandardError
  end

  def self.create_starter_user_with(name, password)
    User.create!(name: name, password: password, password_confirmation: password)
  end

  private

  def ensure_an_admin_remains
    if User.count.zero?
      raise Error.new "Can't delete last user"
    end
  end
end
