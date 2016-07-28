require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array

  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays

  holiday_hash[:winter].collect do |holiday, supplies|
    supplies << supply
  end

  holiday_hash
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

# return an array of all of the supplies that are used in the winter season
def all_winter_holiday_supplies(holiday_hash)
  winter_supplies = []

  holiday_hash[:winter].collect do |holiday, supply_array|
    winter_supplies += supply_array
  end

  winter_supplies
end

# iterate through holiday_hash and print items such that your readout resembles:
# Winter:
#   Christmas: Lights, Wreath
#   New Years: Party Hats
# Summer:
#   Fourth Of July: Fireworks, BBQ
# etc.
def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holidays|
    season_name = season.to_s.capitalize
    puts "#{season_name}:"

    holidays.each do |holiday, supplies|
      holiday_name = holiday.to_s.split('_').map(&:capitalize).join(' ')
        #source: http://stackoverflow.com/questions/13520162/ruby-capitalize-every-word-first-letter
      holiday_string = "  #{holiday_name}:"
      num_supplies = supplies.count

      for i in 0...(num_supplies-1) do
        holiday_string += " #{supplies[i]},"
      end

      holiday_string += " #{supplies[num_supplies-1]}"
      puts holiday_string
    end

  end

end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_holidays = []

  holiday_hash.each do |season, holidays|
    holidays.each do |holiday, supplies|
      if supplies.include?("BBQ")
        bbq_holidays << holiday
      end
    end
  end

  bbq_holidays
end
