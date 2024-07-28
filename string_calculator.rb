require "pry"

class StringCalculator
    DELIMITERS = [',','n','\\']

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

    def figure_out_all_digits_of_same_number(index) # If there are multiple digits in the same number,
        found_delimiter = false                                      # This funtion extracts all these digits
        digits_of_the_same_number = []
        this_is_a_negative_number = string_with_numbers[index] == '-'
        index += 1 if this_is_a_negative_number

        while (found_delimiter == false && index < string_with_numbers.length)
            if DELIMITERS.include?(string_with_numbers[index])
                found_delimiter = true
                break;
            end
            digits_of_the_same_number.push(string_with_numbers[index].to_i) unless DELIMITERS.include?(string_with_numbers[index])
            index += 1
        end

        whole_number = calculate_whole_number( digits_of_the_same_number )
        whole_number = whole_number * -1 if this_is_a_negative_number
        [whole_number, index]
    end

    def check_if_runtime_delimiters_are_passed?()
        if string_with_numbers.start_with?('//')
            DELIMITERS.push(string_with_numbers[2]) and return true unless string_with_numbers[2].is_a? Numeric
        end
        false
    end

    def filter_out_negatives_if_any(numbers)
        numbers.select {|x| x < 0}
    end

    def return_result(numbers)
        begin
            negative_numbers = filter_out_negatives_if_any(numbers)
            if negative_numbers.empty?
                return numbers.sum
            else
                raise "Negative numbers not allowed: #{negative_numbers.to_s}"
            end
        rescue => e
            return e.message
        end
    end

    def add()
        return 0 if string_with_numbers.empty?
    
        last_index = string_with_numbers.length - 1
        numbers = []
        reached_end_of_string = false
        current_index = check_if_runtime_delimiters_are_passed? ? 3 : 0
        reached_till_index = 0

        while (reached_end_of_string == false) do
            unless DELIMITERS.include?(string_with_numbers[current_index])
                if ((string_with_numbers[current_index].to_i).is_a? Numeric || string_with_numbers[current_index] == '-')
                    whole_number, reached_till_index = (figure_out_all_digits_of_same_number(current_index))
                    numbers.push(whole_number)
                end
            end

            current_index = reached_till_index > current_index ? reached_till_index : current_index + 1
            reached_end_of_string = true if current_index > last_index
        end

        return_result(numbers)
    end
end
