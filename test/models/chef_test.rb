require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(chefname: "john", email: "john@example.com")
  end
  
  test "chef should be valid" do
    assert @chef.valid?  
  end
  
  test "chefname should be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end
  
  test "chefname should not be too long" do
    @chef.chefname = "a"*45
    assert_not @chef.valid?
  end
  
  test "chefname should not be too short" do
    @chef.chefname = "a"
    assert_not @chef.valid?
  end
  
  test "email should be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end
  
  test "email should not be too long" do
    @chef.email = "a" * 101 + "@example.com"
    assert_not @chef.valid?
  end
  
  test "email address should be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com test.name@test.com test+4@test.com]
    valid_addresses.each do |addr|
      @chef.email = addr
      assert @chef.valid?, '#{addr.inspect} should be valid'
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user R_TDD-DS.eee.hello.org user@example_one.com test.name@te+st.com]
    invalid_addresses.each do |addr|
      @chef.email = addr
      assert_not @chef.valid?, '#{addr.inspect} should not be valid'
    end
  end
end