class CreateCats < ActiveRecord::Migration[5.1]
  def change
    create_table :cats do |t|
      t.string :name
      t.text :caption
      t.attachment :image

      t.timestamps
    end
  end
end
