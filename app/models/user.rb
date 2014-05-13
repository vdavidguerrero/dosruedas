class User < ActiveRecord::Base
  belongs_to :city
  has_many :ads

  has_secure_password


  before_create :set_auth_token


  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates :name      , presence: true
  validates :last_name , presence: true
  validates :email     , presence: true,
                         uniqueness: true,
                         format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create}




  validates :cellphone , presence: true,
                         numericality: true,
                         length: {is: 10}

  validates :phone     , numericality: true,
                         length: {is: 10}


  private
  def set_auth_token
    return if auth_token.present?

    begin
      self.auth_token = SecureRandom.hex
    end while self.class.exists?(auth_token: self.auth_token)
  end
end

