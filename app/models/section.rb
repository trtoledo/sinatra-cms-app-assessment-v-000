class Section < ActiveRecord::Base
  belongs_to :server
  has_many :tables

  def self.available
    all.select do |section|
      section.server.nil?
    end
  end

end
