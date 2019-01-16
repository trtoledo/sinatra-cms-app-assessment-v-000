class Server < ActiveRecord::Base
  has_secure_password
  has_one :section
  belongs_to :shift

end
