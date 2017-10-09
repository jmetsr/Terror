class CreateTerrorAttacks < ActiveRecord::Migration
  def change
    create_table :terror_attacks do |t|
    	t.integer "date"
    end
  end
end
