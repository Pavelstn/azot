require 'test_helper'

class DealsControllerTest < ActionController::TestCase
  setup do
    @deal = deals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deal" do
    assert_difference('Deal.count') do
      post :create, deal: { active: @deal.active, category_id: @deal.category_id, click: @deal.click, costs: @deal.costs, delete: @deal.delete, description: @deal.description, imgurl: @deal.imgurl, partner_id: @deal.partner_id, region_id: @deal.region_id, shortdescription: @deal.shortdescription, shorturl: @deal.shorturl, smallimgurl: @deal.smallimgurl, start_action: @deal.start_action, stop_action: @deal.stop_action, title: @deal.title, top: @deal.top, type_id: @deal.type_id, url: @deal.url, user_id: @deal.user_id, visit: @deal.visit }
    end

    assert_redirected_to deal_path(assigns(:deal))
  end

  test "should show deal" do
    get :show, id: @deal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deal
    assert_response :success
  end

  test "should update deal" do
    put :update, id: @deal, deal: { active: @deal.active, category_id: @deal.category_id, click: @deal.click, costs: @deal.costs, delete: @deal.delete, description: @deal.description, imgurl: @deal.imgurl, partner_id: @deal.partner_id, region_id: @deal.region_id, shortdescription: @deal.shortdescription, shorturl: @deal.shorturl, smallimgurl: @deal.smallimgurl, start_action: @deal.start_action, stop_action: @deal.stop_action, title: @deal.title, top: @deal.top, type_id: @deal.type_id, url: @deal.url, user_id: @deal.user_id, visit: @deal.visit }
    assert_redirected_to deal_path(assigns(:deal))
  end

  test "should destroy deal" do
    assert_difference('Deal.count', -1) do
      delete :destroy, id: @deal
    end

    assert_redirected_to deals_path
  end
end
