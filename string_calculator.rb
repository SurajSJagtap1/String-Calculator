require "pry"

# Specs 
# 1) It should be able to handle comma separated numbers containing multiple digits in a single number.

class StringCalculator
    attr_accessor :string_with_numbers

    def initialize(string_with_numbers)
        @string_with_numbers = string_with_numbers
    end

    def calculate_whole_number(numbers)
        last_index = numbers.length - 1
        multiplier_number = "1"
        formed_number = 0
    
        (numbers.length - 1).times do
            multiplier_number += "0"
        end
    
        multiplier_number = multiplier_number.to_i
    
        for i in 0..last_index do
            formed_number += (numbers[i] * multiplier_number)
            multiplier_number = multiplier_number / 10
        end
    
        formed_number
    end
    
    def figure_out_all_digits_of_same_number(index, str, delimiters) # If there are multiple digits in the same number,
        found_delimiter = false                                      # This funtion extracts all these digits
        digits_of_the_same_number = []
    
        while (found_delimiter == false && index < str.length)
            if delimiters.include?(str[index])
                found_delimiter = true
                
            end
            digits_of_the_same_number.push(str[index].to_i) unless delimiters.include?(str[index])
            index += 1
        end
    
        whole_number = calculate_whole_number( digits_of_the_same_number )
        whole_number
    end

    def add()
        return 0 if string_with_numbers.empty?
    
        last_index = string_with_numbers.length - 1
        numbers = []
        delimiters = [',']
    
        for i in 0..last_index do
            unless delimiters.include?(string_with_numbers[i])
                if (string_with_numbers[i].to_i).is_a? Numeric
                    whole_number = (figure_out_all_digits_of_same_number(i, string_with_numbers, delimiters))
                    numbers.push(whole_number)
                end
            end
        end
        numbers.sum
    end
end
