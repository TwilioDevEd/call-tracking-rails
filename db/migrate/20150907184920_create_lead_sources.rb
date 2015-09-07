class CreateLeadSources < ActiveRecord::Migration
  def change
    create_table :lead_sources do |t|
      t.string :name, null: false
      t.string :incoming_number, null: false
      t.string :forwarding_number

      t.timestamps
    end
  end
end
