require 'spec_helper'
require 'rails_helper'

describe ItemsController do

  # def self.it_renders_404_if_page_not_found(*actions)
  #   actions.each do |a|
  #     it "#{a} render 404 page" do
  #       verb = if a == :update
  #                "PATCH"
  #              elsif a == :destroy
  #                "DELETE"
  #              else
  #                "GET"
  #              end
  #       process a, verb, {id: 0}
  #       expect(response.status).to eq 404
  #     end
  #   end
  # end

  it_renders_404_if_page_not_found :show, :edit, :update, :destroy

  describe 'show action' do

    it 'renders show template if an item is found' do
      item = create(:item)
      get :show, id: item.id
      expect(response).to render_template(:show)
    end

    # it 'renders 404 page if an item is not found' do
    #   get :show, id: 0
    #   expect(response.status).to eq 404
    # end

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

  describe 'destroy action' do

    it 'redirect to index after item has been destroyed' do
      item = create(:item)
      delete :destroy, id: item.id
      expect(response).to redirect_to items_path
    end

    # it 'action destroy render 404-page if the item was not found' do
    #   delete :destroy, id: 0
    #   expect(response.status).to eq 404
    # end

  end

end
