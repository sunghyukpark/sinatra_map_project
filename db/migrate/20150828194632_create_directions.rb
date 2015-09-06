class CreateDirections < ActiveRecord::Migration
  def change
  	create_table :directions do |t|
  		t.float :cost
  		t.string :distance
      t.string :duration

  		t.timestamps null: false
  		t.references :user
  	end
  end
end
