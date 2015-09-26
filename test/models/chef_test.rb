require "test_helper"

class ChefTest < ActiveSupport::TestCase
  
  def setup 
  @chef = Chef.new(chefname: "john", email: "join@home.pl")

  end
  
  test "Chef should be valid" do
  assert @chef.valid?
  end
  
  test "chefname should be present" do 
    @chef.chefname = " "
    assert_not @chef.valid?
  end

  test "cheff name should not be too long" do 
    @chef.chefname = "a" * 41
    assert_not @chef.valid?
  end
  
  test "chef name should no tbe too short" do 
      @chef.chefname = "a" * 2
      assert_not @chef.valid?
    end
    
    test "emain must be present" do
      @chef.email = " "
      assert_not @chef.valid?
    end
    
    test "email should be not too long" do 
      @chef.email = "a" * 101 + "example.com"
      assert_not @chef.valid?
    end
    
    test "email address has to bee unique" do 
      dup_chef = @chef.dup
      dup_chef.email = @chef.email.upcase
      @chef.save
      assert_not dup_chef.valid?
    end
    
    test "email addres should be valid" do
    valid_address = %w[user@eeee.com TDD_dds-ss@eee.com.pl useer@example.com laura+joe@example.com]
    valid_address.each do |a|
      @chef.email = a
      assert @chef.valid?, "#{a.inspect} is not a valid e-mail address."
    end
  end
  
    test "email validation should reject wrong email addresses" do
      invalid_address = %w[user@example,com user_at_somethign.com foo@bar+somehitng.vom hello@gmail.com.-f]
       invalid_address.each do |a|
          @chef.email = a
          assert_not @chef.valid? , "#{a.inspect} should be invalid"
       end
    end
end