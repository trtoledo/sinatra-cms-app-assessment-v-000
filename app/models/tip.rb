class Tip < ActiveRecord::Base
  belongs_to :server

  def slug
      self.username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(username)
      self.find {|i| i.slug == username}
  end

end
