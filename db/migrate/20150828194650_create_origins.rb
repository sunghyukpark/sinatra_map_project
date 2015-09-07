class CreateOrigins < ActiveRecord::Migration
  def change
  	create_table :origins do |t|
			t.string :name
			t.string :address
			
			t.references :direction
			t.references :destination

			t.timestamps null: false
		end
  end
end
