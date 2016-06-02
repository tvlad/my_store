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

  describe 'create action' do

    it 'redirect to the item path if validation passed' do
      post :create, item: {name: 'Item1', description: 'description', price: '10'}

      expect(response).to redirect_to item_path(assigns(:item))

    end

    it 'render the new page again if price is eq. nill' do
      post :create, item: { name: 'Item1', description: 'description', price: nil}
      expect(response).to render_template('new')
    end

    it 'render the new page again if price is eq. 0' do
      post :create, item: { name: 'Item1', description: 'description', price: 0}
      expect(response).to render_template('new')
    end

  end

end
