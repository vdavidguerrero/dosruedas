class Vehicle < ActiveRecord::Base
  belongs_to :style
  belongs_to :model
  has_many :ads
end
