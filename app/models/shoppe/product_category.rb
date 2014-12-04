module Shoppe
  class ProductCategory < ActiveRecord::Base

    self.table_name = 'shoppe_product_categories'

    # Categories have an image attachment
    attachment :image

    # All products within this category
    has_many :products, :dependent => :restrict_with_exception, :class_name => 'Shoppe::Product'
    has_many :children, :class_name => "Shoppe::ProductCategory", foreign_key: "parent_id"
    belongs_to :parent, :class_name => "Shoppe::ProductCategory"


    # Validations
    validates :name, :presence => true
    validates :permalink, :presence => true, :uniqueness => true

    # All categories ordered by their name ascending
    scope :ordered,      -> { order(:name) }
    scope :only_parents, -> { where(parent_id: nil) }

    # Set the permalink on callback
    before_validation { self.permalink = self.name.parameterize if self.permalink.blank? && self.name.is_a?(String) }

  end
end