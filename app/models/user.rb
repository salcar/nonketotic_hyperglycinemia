# encoding: UTF-8

class User < ActiveRecord::Base
  has_secure_password

  attr_accessor :password_confirmation

  validates :email, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true, :on => :create

  def self.authenticate(email, password)
    User.where("email = ?", email.downcase.strip).first.try(:authenticate, password)
  end

  def change_password!(new_password)
    self.password = new_password
    self.password_confirmation = new_password
    save!
  end
end