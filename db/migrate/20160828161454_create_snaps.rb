class CreateSnaps < ActiveRecord::Migration[5.0]
  def change
    create_table :snaps do |t|
      t.string :caption

      t.timestamps
    end
  end
end
