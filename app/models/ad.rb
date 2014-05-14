class Ad < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :user
  has_many   :pictures


  validates :title               , presence: true,
                                   length:{maximum: 15}

  validates :price               , presence: true,
                                   numericality: true

  validates :color               , presence: true

  validates :year                , presence: true

  validates :paper_status        , presence: true

  validates :transmission_type   , presence: true

  validates :gears               , presence: true

  validates :engine_size         , presence: true,
                                   numericality: true

  validates :strokes             , presence: true

  validates :cylinders           , presence: true

end
