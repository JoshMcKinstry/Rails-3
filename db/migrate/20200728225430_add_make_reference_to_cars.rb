class AddMakeReferenceToCars < ActiveRecord::Migration[5.2]
  def change
    add_reference :cars, :make, foreign_key: true
  end
end
