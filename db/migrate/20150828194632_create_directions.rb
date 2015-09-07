class CreateDirections < ActiveRecord::Migration
  def change
  	create_table :directions do |t|
  		t.float :cost
  		t.string :distance
      t.string :duration

      t.references :user
      t.references :destination
      t.references :origin

  		t.timestamps null: false
  	
  	end
  end
end
