class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :number
      t.boolean :published
      t.date :a_date
      t.datetime :a_date_time

      t.timestamps
    end
  end
end
