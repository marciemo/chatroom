class Message < ActiveRecord::Base
  attr_accessible :text, :room_id
  validates :text, :room_id, :presence => true
  belongs_to :room
end