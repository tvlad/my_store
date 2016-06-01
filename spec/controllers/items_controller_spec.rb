require 'spec_helper'
require 'rails_helper'


describe ItemsController do

  describe 'show action' do

    it 'renders show template if an item is found' do
      item = create(:item)
      get :show, id: item.id
      expect(response).to render_template(:show)
    end

    it 'renders 404 page if an item is not found' do
      get :show, id: 0
      expect(response.status).to eq 404
    end

  end

end
