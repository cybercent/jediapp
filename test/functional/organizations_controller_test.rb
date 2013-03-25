require 'test_helper'

class OrganizationsControllerTest < ActionController::TestCase
  setup do
    @organization = organizations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organizations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organization" do
    assert_difference('Organization.count') do
      post :create, organization: { city: @organization.city, contact_job: @organization.contact_job, contact_name: @organization.contact_name, department: @organization.department, description: @organization.description, email: @organization.email, fax: @organization.fax, name: @organization.name, phone: @organization.phone, postal_code: @organization.postal_code, street_name: @organization.street_name, street_number: @organization.street_number }
    end

    assert_redirected_to organization_path(assigns(:organization))
  end

  test "should show organization" do
    get :show, id: @organization
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organization
    assert_response :success
  end

  test "should update organization" do
    put :update, id: @organization, organization: { city: @organization.city, contact_job: @organization.contact_job, contact_name: @organization.contact_name, department: @organization.department, description: @organization.description, email: @organization.email, fax: @organization.fax, name: @organization.name, phone: @organization.phone, postal_code: @organization.postal_code, street_name: @organization.street_name, street_number: @organization.street_number }
    assert_redirected_to organization_path(assigns(:organization))
  end

  test "should destroy organization" do
    assert_difference('Organization.count', -1) do
      delete :destroy, id: @organization
    end

    assert_redirected_to organizations_path
  end
end
