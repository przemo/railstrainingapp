require "test_helper"

class RecipeTest < ActiveSupport::TestCase

  # set up recipe object and test method
  
  def setup
    @chef = Chef.create(chefname: "BOB", email: "BIB@example.com")
    @recipe = @chef.recipes.build(name: "chicke", summary: "the best recipe", 
      description: "some ingredients are needed in the reciipe")# instance variable so it is available for the oter models in the application 
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end 
  
  test "chef_id should be present" do
  @recipe.chef_id = nil
  assert_not @recipe.valid?
  end
  
  test "name shoud be present" do 
    @recipe.name = " "
    assert_not @recipe.valid? # this is an example of negative assertion - it expects the reuslt a false since we assign an empty string  
    # this can be fixed by editing and adding a validation to the recipe model
  end
  
  test "name lenght should be not too long" do 
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end 
  
  test "name lenght should not be too short" do
    @recipe.name = "abcd"
    assert_not @recipe.valid?
  end 
  
  test "summary should be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end
  
  test "summary should not be too long" do 
    @recipe.summary = "A" * 151
    assert_not @recipe.valid?
  end
  
  test "smmary lenght should not be too short" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end
  
  test "description must be present" do 
    @recipe.description = " "
    assert_not @recipe.valid?
  end
  
  test "description should not be too long" do
    @recipe.description = "a" * 501
    assert_not  @recipe.valid?
  end
  
  test "description should not be too short" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end
  
  # chef id should be presnt - this is goint to be finished later
  
end

