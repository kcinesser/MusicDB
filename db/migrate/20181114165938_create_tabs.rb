class CreateTabs < ActiveRecord::Migration[5.2]
  def change
    create_table :tabs do |t|
      t.string :filename
      t.references :song, foreign_key: true
      t.binary :data

      t.timestamps
    end
  end
end
