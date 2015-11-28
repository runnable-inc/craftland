require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do
  login_admin

  describe "GET #index" do
    it "assigns all products as @products" do
      products = [
        *FactoryGirl.create_list(:product, 2, user: @current_user),
        FactoryGirl.create(:product, :with_user)
      ]
      get :index, {}
      expect(assigns(:products)).to eq products.reverse
    end
  end
end
