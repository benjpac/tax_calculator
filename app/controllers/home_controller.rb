class HomeController < ApplicationController
  def index

  end

  def create
    income = params[:income2].to_i
    @calculated_tax = get_income_tax(income)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end


  private

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

  # includes matching employer contribution
  def get_medicare_tax(status, income)
    tax_rate = 0.124
    if status = "married" && income > 250000
      tax_rate += 0.009
    elsif status = "single" && income > 200000
      tax_rate += 0.009
    end
    if income >= 127200
      return tax_rate * 127200
    else
      return tax_rate * income
    end
  end

  def get_ss_tax(income)
    if income >= 127200
      return 0.029 * 127200
    else
      return 0.029 * income
    end  
  end

  # get_medicare_tax("single", 50000)
  # get_ss_tax(100000)

end
