# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# single
filing_status = 'single'
fed_inc_rates = [0.1, 0.15, 0.25, 0.28, 0.33, 0.35, 0.396]
fed_inc_thresholds = [9325, 37950, 91900, 191650, 416700, 418400]

# married
filing_status = 'married'
tax_rates = [0.1, 0.15, 0.25, 0.28, 0.33, 0.35, 0.396]
tax_thresholds = [18650, 75900, 153100, 233350, 416700, 470700]

# head of household
filing_status = 'head_of_household'
tax_rates = [0.1, 0.15, 0.25, 0.28, 0.33, 0.35, 0.396]
tax_thresholds = [13350, 50800, 131200, 212500, 416700, 444500]