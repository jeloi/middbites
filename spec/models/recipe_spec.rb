# == Schema Information
#
# Table name: recipes
#
#  id                 :integer          not null, primary key
#  directions         :text
#  title              :string(255)
#  blurb              :string(255)
#  user_id            :integer
#  recipe_category_id :integer
#  created_at         :datetime
#  updated_at         :datetime
#

require 'spec_helper'

describe Recipe do
  
  # Validations
  it "has a valid factory" do
    expect(FactoryGirl.build(:recipe)).to be_valid #without Factory Girl syntax shortening
  end

  it "is invalid without a title" do
		expect(build(:recipe, title: nil)).to \
			have(1).errors_on(:title)
  end

  it "is invalid without a description" do
    expect(build(:recipe, directions: nil)).to have(1).errors_on(:directions)
  end
  it "is invalid without a blurb" do
    expect(build(:recipe, blurb: nil)).to have(1).errors_on(:blurb)
  end

	it "is invalid if the title is not unique" do
		create(:recipe)
		# expect(build :recipe).to have(1).errors_on(:title)
	end

	# Associations
	it {should have_many(:items).through(:ingredients)}
	it {should belong_to(:user)}
	
end
