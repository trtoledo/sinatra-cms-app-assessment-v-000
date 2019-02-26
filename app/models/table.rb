class Table < ActiveRecord::Base
  belongs_to :section
  has_many :seats
  def slug
      self.username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(number)
      self.find {|i| i.slug == number}
  end

  def self.section_tables(section)
    all.select do |table|
      table.section_id = section
    end
  end


end
