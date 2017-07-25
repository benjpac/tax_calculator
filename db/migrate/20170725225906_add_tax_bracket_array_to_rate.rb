class AddTaxBracketArrayToRate < ActiveRecord::Migration[5.1]
  def change
    add_column :rates, :fed_inc_rates, :decimal, array: true, default: [0.1, 0.15, 0.25, 0.28, 0.33, 0.35, 0.396]
    add_column :rates, :fed_inc_thresholds, :decimal, array: true, default: [9325, 37950, 91900, 191650, 416700, 418400]
    add_column :rates, :fed_medicare_rate, :decimal
    add_column :rates, :fed_ss_rate, :decimal
    remove_column :rates, :percentage
    remove_column :rates, :bracket
  end
end
