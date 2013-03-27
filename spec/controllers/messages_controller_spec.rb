require 'spec_helper'

describe MessagesController do


  context 'routing' do
    it {should route(:post, '/messages').to :action => :create}
    it {should route(:get, '/messages').to :action => :index}
  end

  context 'POST create' do
    context 'with valid_parameters' do
      # let(:new_room) {FactoryGirl.build(:room)}
      let(:valid_attributes) {{text: 'text', room_id: 1}}
        let(:valid_parameters) {{message: valid_attributes}}

      before {post :create, valid_parameters}

      it {should respond_with 201}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of the newly-created message' do 
        response.body.should eq Message.find(JSON.parse(response.body)['message']['id']).to_json
      end
    end

    context 'with invalid_parameters' do
      let(:invalid_attributes) {{:text => '', :room_id => ''}}
      let(:invalid_parameters) {{:message => invalid_attributes}}

      before {post :create, invalid_parameters}

      it {should respond_with 422}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of the errors' do
        response.body.should eq Message.create(invalid_attributes).errors.to_json
      end
    end


    context 'GET index' do
      it 'returns the messages from a specific room' do
        message1 = FactoryGirl.create(:message)
        message2 = FactoryGirl.create(:message)

        get :index, :room_id => message1.room.id 
        response.body.should eq [message1].to_json
      end
    end
  end
end












