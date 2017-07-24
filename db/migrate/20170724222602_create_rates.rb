class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.perc :integer
      t.bracket :integer

      t.timestamps
    end
  end
end
