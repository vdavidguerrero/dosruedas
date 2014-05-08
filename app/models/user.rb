class User < ActiveRecord::Base
  belongs_to :city

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates :name      , presence: true
  validates :last_name , presence: true
  validates :email     , presence: true,
                         uniqueness: true,
                         format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create}


  validates :password  , presence: true,
                         length: {minimum: 6}

  validates :cellphone , presence: true,
                         numericality: true,
                         length: {is: 10}

  validates :phone     , numericality: true,
                         length: {is: 10}




end

