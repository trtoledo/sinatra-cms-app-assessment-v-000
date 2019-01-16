class Table < ActiveRecord::Base
  belongs_to :section
  has_many :seats
end
