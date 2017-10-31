require 'test_helper'

class VisitedDomainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @visited_domain = visited_domains(:one)
  end

  test "should get index" do
    get visited_domains_url
    assert_response :success
  end

  test "should get new" do
    get new_visited_domain_url
    assert_response :success
  end

  test "should create visited_domain" do
    assert_difference('VisitedDomain.count') do
      post visited_domains_url, params: { visited_domain: { host: @visited_domain.host, times: @visited_domain.times } }
    end

    assert_redirected_to visited_domain_url(VisitedDomain.last)
  end

  test "should show visited_domain" do
    get visited_domain_url(@visited_domain)
    assert_response :success
  end

  test "should get edit" do
    get edit_visited_domain_url(@visited_domain)
    assert_response :success
  end

  test "should update visited_domain" do
    patch visited_domain_url(@visited_domain), params: { visited_domain: { host: @visited_domain.host, times: @visited_domain.times } }
    assert_redirected_to visited_domain_url(@visited_domain)
  end

  test "should destroy visited_domain" do
    assert_difference('VisitedDomain.count', -1) do
      delete visited_domain_url(@visited_domain)
    end

    assert_redirected_to visited_domains_url
  end
end
