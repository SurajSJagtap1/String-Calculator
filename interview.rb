

# Specs 
# 0) First version: basic addition of comma separated single digits from a string, should calculate sum of numbers only.
# 1) It should be able to handle comma separated numbers containing multiple digits in a single number.


def figure_out_whole_number(index, str, delimiters)
    found_delimiter = false
    digits_of_the_same_number = []

    while found_delimiter != true
        if delimiters.include?(str[index])
            found_delimiter = true
            break;
        end
        digits_of_the_same_number.push(str[index].to_i)
        index += 1
    end
    digits_of_the_same_number
end

def add_numbers_from_string(str)
    return 0 if str.empty?

    last_index = str.length - 1
    numbers = []
    delimiters = [',']

    for i in 0..last_index do
        unless delimiters.include?(str[i])
            if numbers.push(str[i].to_i).is_a? Numeric
                whole_number = figure_out_whole_number(i, str, delimiters)
            end
        end
    end

    numbers.sum
end



str = "122,215,3,4"

puts add_numbers_from_string(str)
