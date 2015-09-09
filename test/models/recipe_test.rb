require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create(chefname: "bob", email: "bob@example.com")
    @recipe = @chef.recipes.build(
      name: "pizza",
      summary: "A modern take on an old classic",
      description: "Lorem Ipsum dollar shank floral bacon tester"
    )
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "chef id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test "name length should not be too long" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end
  
  test "name length should not be too short" do
    @recipe.name = "aa"
    assert_not @recipe.valid?
  end
  
  test "summary should be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end
  
  test "summary length should not be too long" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end
  
  test "summary length should not be too short" do
    @recipe.summary = "aa"
    assert_not @recipe.valid?
  end
  
  test "description should be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end
  
  test "description length should not be too long" do
    @recipe.description = "a" * 504
    assert_not @recipe.valid?
  end
  
  test "description length should not be too short" do
    @recipe.description = "a" * 18
    assert_not @recipe.valid?
  end 
end