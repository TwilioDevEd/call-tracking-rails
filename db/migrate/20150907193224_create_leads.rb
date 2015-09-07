class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.references :lead_source, null: false
      t.string :phone_number, null: false
      t.string :city
      t.string :state

      t.timestamps
    end

    add_foreign_key :leads, :lead_sources
  end
end
