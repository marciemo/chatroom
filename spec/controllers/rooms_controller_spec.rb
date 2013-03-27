require 'spec_helper'

describe RoomsController do

  context 'routing' do
    it {should route(:post, '/rooms').to :action => :create}
    it {should route(:get, '/rooms').to :action => :index}
  end
  
  context 'POST create' do
    context 'with valid_parameters' do

      let(:valid_attributes) {{name: 'test'}}
        let(:valid_parameters) {{room: valid_attributes}}

      before {post :create, valid_parameters}

      it {should respond_with 201}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of the newly-created room' do 
        response.body.should eq Room.find(JSON.parse(response.body)['room']['id']).to_json
      end
    end

    context 'with invalid_parameters' do
      let(:invalid_attributes) {{:name => ''}}
      let(:invalid_parameters) {{:room => invalid_attributes}}

      before {post :create, invalid_parameters}

      it {should respond_with 422}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of the errors' do
        response.body.should eq Room.create(invalid_attributes).errors.to_json
      end
    end


    context 'GET index' do
      before {Room.create({:name => 'test'})}
      before {get :index}

      it {should respond_with 200}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of all the words' do
        response.body.should eq Room.all.to_json
      end
    end

    context 'GET show' do
      let(:room) {FactoryGirl.create :room}
      before {get :show, :id => room.id}

      it {should respond_with 200}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of the room' do
        response.body.should eq room.to_json
      end
    end
  end
end