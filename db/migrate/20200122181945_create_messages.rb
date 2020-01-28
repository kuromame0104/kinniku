class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true
      t.text :image
      t.string :text
      t.timestamps
    end
  end
end
