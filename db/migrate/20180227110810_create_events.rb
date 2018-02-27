class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :category
      t.string :state
      t.string :image_url

      t.timestamps
    end
  end
end
