class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
