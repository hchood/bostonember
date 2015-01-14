class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :title, null: false
      t.integer :speaker_id, null: false

      t.timestamps null: false
    end
  end
end
