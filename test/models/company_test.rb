
require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  def setup
    @company = Company.new(name: "Hometown Painting",
                           email: "email@getmainstreet.com",
                           zip_code: "93003")
  end

  test "valid company" do
    assert @company.valid?
  end

  test "valid null email" do
    @company.email = nil
    assert @company.valid?
  end

  test "invalid email" do
    @company.email = "marcus_painting@marcus_painting.com"
    refute @company.valid?, "company is valid with invalid email"
  end
end
