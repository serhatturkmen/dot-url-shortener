class CreateUrlsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :urls do |t|
      t.string :original_url
      t.string :short_url
      t.integer :clicks, default: 0

      t.timestamps
    end   
  end
end
