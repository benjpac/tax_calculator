# README

## To Do

* setup database structure; marginal brackets for single / married / dependents / what else?
* write function to compute income tax for single and married filers, includes actual tax % and actual take home
* add admin for adding new rates
* add ability for users to add their own hyothetical tax rates
* add expected return on medicare / ss benefit, given a retirement age and expected pay change by year
* allow users to manually add state income tax
* add state selection box

married
tax_rates = [0.1, 0.15, 0.25, 0.28, 0.33, 0.35, 0.396]
tax_thresholds = [18650, 75900, 153100, 233350, 416700, 470700]

head of household
tax_rates = [0.1, 0.15, 0.25, 0.28, 0.33, 0.35, 0.396]
tax_thresholds = [13350, 50800, 131200, 212500, 416700, 444500]

def get_income_tax(income)
  tax_rates = [0.1, 0.15, 0.25, 0.28, 0.33, 0.35, 0.396]
  tax_thresholds = [9325, 37950, 91900, 191650, 416700, 418400]
  tax_paid = 0
  untaxed_income = income
  i = 0
  while untaxed_income > 0 do
    puts 'tax paid = ' + tax_paid.to_s
    if tax_thresholds[i] != NIL
      if (untaxed_income - tax_thresholds[i]) < 0
        puts "final bracket"
        tax_paid += (tax_rates[i] * untaxed_income)
        untaxed_income = 0
      else
        if i != 0
          puts "middle bracket"
          taxed_amount = (tax_thresholds[i] - tax_thresholds[i-1])
          tax_paid += (tax_rates[i] * taxed_amount)
          untaxed_income -= taxed_amount
        else
          puts "lowest bracket"
          tax_paid += (tax_rates[i] * tax_thresholds[i])
          untaxed_income -= tax_thresholds[i]
        end
      end
    else
      puts "max bracket"
      puts untaxed_income
      puts i
      tax_paid += (tax_rates[i] * untaxed_income)
      untaxed_income = 0
    end
    i += 1
  end
  return tax_paid
end

# get_income_tax(9325)
# get_income_tax(37950)
# get_income_tax(1000000)