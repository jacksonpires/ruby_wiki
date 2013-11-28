class CreateWikiDetails < ActiveRecord::Migration
  def change
    create_table :wiki_details do |t|
      t.string :name
      t.integer :initial_page_id
    end

    add_attachment :wiki_details, :logo
  end
end
