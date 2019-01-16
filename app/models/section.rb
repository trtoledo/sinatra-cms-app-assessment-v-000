class Section < ActiveRecord::Base
  belongs_to :server
  has_many :tables 
end
