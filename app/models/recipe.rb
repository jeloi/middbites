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

class Recipe < ActiveRecord::Base
  extend FriendlyId
  # Friendly_id gem use database slug
  friendly_id :title, :use => :slugged

	# Associations
	belongs_to :user
	has_many :ingredients
	has_many :items, through: :ingredients
  accepts_nested_attributes_for :ingredients, :reject_if => lambda { |a| a[:item_id].blank? }, :allow_destroy => true


	# Validations
  TITLE_LENGTH = 40
  BLURB_LENGTH = 100
	validates_uniqueness_of :title, message: "That name is already taken!", case_sensitive: false
	validates_presence_of :title, :blurb, :directions, message: "can't be blank"
  validate :validate_ingredients_count

  def validate_ingredients_count
    errors.add(:ingredient, "too many!") if ingredients.length > 10
    errors.add(:ingredient, "recipe needs at least one ingredient") if ingredients.length == 0
  end

  # Friendly_Id generate new slug
  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

  def display_title
    title.downcase.titlecase
  end

end
