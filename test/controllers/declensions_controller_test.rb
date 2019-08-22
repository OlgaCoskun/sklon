require 'test_helper'

class DeclensionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @declension = declensions(:one)
  end

  test "should get index" do
    get declensions_url
    assert_response :success
  end

  test "should get new" do
    get new_declension_url
    assert_response :success
  end

  test "should create declension" do
    assert_difference('Declension.count') do
      post declensions_url, params: { declension: { dative: @declension.dative } }
    end

    assert_redirected_to declension_url(Declension.last)
  end

  test "should show declension" do
    get declension_url(@declension)
    assert_response :success
  end

  test "should get edit" do
    get edit_declension_url(@declension)
    assert_response :success
  end

  test "should update declension" do
    patch declension_url(@declension), params: { declension: { dative: @declension.dative } }
    assert_redirected_to declension_url(@declension)
  end

  test "should destroy declension" do
    assert_difference('Declension.count', -1) do
      delete declension_url(@declension)
    end

    assert_redirected_to declensions_url
  end
end
