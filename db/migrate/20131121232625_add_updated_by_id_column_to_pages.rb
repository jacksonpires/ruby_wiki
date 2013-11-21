class AddUpdatedByIdColumnToPages < ActiveRecord::Migration
  def change
    add_column :pages, :updated_by_id, :integer
  end
end
