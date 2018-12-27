class CreateResourceNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :resource_notes do |t|
      t.text :body
      t.references :resource, foreign_key: true

      t.timestamps
    end
  end
end
