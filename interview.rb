require "pry"

# Specs 
# 0) First version: basic addition of comma separated single digits from a string, should calculate sum of numbers only.
# 1) It should be able to handle comma separated numbers containing multiple digits in a single number.

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

def add_numbers_from_string(str)
    return 0 if str.empty?

    last_index = str.length - 1
    numbers = []
    delimiters = [',']

    for i in 0..last_index do
        unless delimiters.include?(str[i])
            if (str[i].to_i).is_a? Numeric
                whole_number = (figure_out_all_digits_of_same_number(i, str, delimiters))
                numbers.push(whole_number)
            end
        end
    end

    numbers.sum
end

str = "122,2,3,4"

puts add_numbers_from_string(str)
