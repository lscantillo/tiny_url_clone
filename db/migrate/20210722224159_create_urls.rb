class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.text :url
      t.text :token
      t.integer :visit_count

      t.timestamps
    end
  end
end
