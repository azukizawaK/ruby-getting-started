class CreateIdols < ActiveRecord::Migration[5.1]
  def change
    create_table :idols do |t|
      t.string :name
      t.string :profile
      t.string :photo

      t.timestamps
    end
  end
end
