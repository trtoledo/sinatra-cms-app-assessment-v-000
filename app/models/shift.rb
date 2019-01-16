class Shift < ActiveRecord::Base
  has_many :servers
  belongs_to :manager
end
