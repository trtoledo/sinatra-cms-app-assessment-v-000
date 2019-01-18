class Manager < ActiveRecord::Base
  has_secure_password
  has_one :shift


  def slug
      self.username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(username)
      self.find {|i| i.slug == username}
  end

end
