class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.decimal :percentage
      t.int4range :bracket

      t.timestamps
    end
  end
end
