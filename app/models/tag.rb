# == Schema Information
#
# Table name: tags
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  tag_category_id :integer          not null
#  created_at      :datetime
#  updated_at      :datetime
#

class Tag < ActiveRecord::Base
	has_many :taggings, dependent: :destroy
	has_many :recipes, :through => :taggings
	belongs_to :tag_category

	validates_uniqueness_of :name, :on => :save, :message => "must be unique"

	# Sunspot Solr Search
	searchable do
	  text :name, boost: 2
	  text :tag_category do
	    tag_category.name
	  end
	end	
end
