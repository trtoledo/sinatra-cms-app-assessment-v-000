class Manager < ActiveRecord::Base
  has_secure_password
  has_one :shift
  
end
