require 'spec_helper'

describe Message do  
  it {should validate_presence_of :text}
  it {should validate_presence_of :room_id}
  it {should belong_to :room}

end