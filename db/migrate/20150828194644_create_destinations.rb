class CreateDestinations < ActiveRecord::Migration
  def change
  	create_table :destinations do |t|
  		t.string :name
  		t.string :address
  		t.references :origin
  		t.references :destination

  		t.timestamps null: false
  	end
  end
end
