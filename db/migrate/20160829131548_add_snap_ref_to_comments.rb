class AddSnapRefToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :snap, foreign_key: true
  end
end
