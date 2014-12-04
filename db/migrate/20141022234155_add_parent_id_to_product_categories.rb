class AddParentIdToProductCategories < ActiveRecord::Migration
  def change
    add_column :shoppe_product_categories, :parent_id, :integer, :after => "description"
  end
end
