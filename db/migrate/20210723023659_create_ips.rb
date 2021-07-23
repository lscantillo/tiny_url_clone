class CreateIps < ActiveRecord::Migration[6.0]
  def change
    create_table :ips do |t|
      t.string :ip
      t.references :url, null: false, foreign_key: true

      t.timestamps
    end
  end
end
