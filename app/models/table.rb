class Table < ActiveRecord::Base
  belongs_to :section
  has_many :seats
  def slug
      self.username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(number)
      self.find {|i| i.slug == number}
  end

  def server
    self.section.server
  end
end
