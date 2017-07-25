# README

## To Do

* setup database structure; marginal brackets for single / married / dependents / what else?
* write function to compute income tax for single and married filers, includes actual tax % and actual take home
* add admin for adding new rates
* add ability for users to add their own hyothetical tax rates
* add expected return on medicare / ss benefit, given a retirement age and expected pay change by year
* allow users to manually add state income tax
* add state selection box

def get_income_tax(income)
  tax_rates = [0.1, 0.15, 0.25, 0.28, 0.33, 0.35, 0.396]
  tax_threshold = [9325, 37950, 91900, 191650, 416700]
  tax_paid = 0
  untaxed_income = income
  i = 0
  while untaxed_income > 0 do
    puts tax_paid
    if tax_threshold[i] != NIL
      if (untaxed_income - tax_threshold[i]) < 0
        tax_paid += (tax_rates[i] * untaxed_income)
        untaxed_income = 0
      else
        tax_paid += (tax_rates[i] * tax_threshold[i])
        untaxed_income -= tax_threshold[i]
      end
    else
      tax_paid += (tax_rates[i] * untaxed_income)
      untaxed_income = 0
    end
    i += 1
  end
  puts untaxed_income
  return tax_paid
end

get_income_tax(91900)