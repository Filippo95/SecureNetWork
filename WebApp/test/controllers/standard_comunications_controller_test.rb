require 'test_helper'

class StandardComunicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @standard_comunication = standard_comunications(:one)
  end

  test "should get index" do
    get standard_comunications_url
    assert_response :success
  end

  test "should get new" do
    get new_standard_comunication_url
    assert_response :success
  end

  test "should create standard_comunication" do
    assert_difference('StandardComunication.count') do
      post standard_comunications_url, params: { standard_comunication: { data: @standard_comunication.data, date: @standard_comunication.date, destination: @standard_comunication.destination, host: @standard_comunication.host, protocol: @standard_comunication.protocol, source: @standard_comunication.source } }
    end

    assert_redirected_to standard_comunication_url(StandardComunication.last)
  end

  test "should show standard_comunication" do
    get standard_comunication_url(@standard_comunication)
    assert_response :success
  end

  test "should get edit" do
    get edit_standard_comunication_url(@standard_comunication)
    assert_response :success
  end

  test "should update standard_comunication" do
    patch standard_comunication_url(@standard_comunication), params: { standard_comunication: { data: @standard_comunication.data, date: @standard_comunication.date, destination: @standard_comunication.destination, host: @standard_comunication.host, protocol: @standard_comunication.protocol, source: @standard_comunication.source } }
    assert_redirected_to standard_comunication_url(@standard_comunication)
  end

  test "should destroy standard_comunication" do
    assert_difference('StandardComunication.count', -1) do
      delete standard_comunication_url(@standard_comunication)
    end

    assert_redirected_to standard_comunications_url
  end
end
