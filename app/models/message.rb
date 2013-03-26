class Message < ActiveRecord::Base
  attr_accessible :text
  validates :text, :presence => true

end