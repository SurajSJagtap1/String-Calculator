

# Specs 
# 0) First version: basic addition of comma separated single digits from a string, should calculate sum of numbers only.

def add_numbers_from_string(str)
    return 0 if str.empty?

    last_index = str.length - 1
    numbers = []
    delimiters = [',']

    for i in 0..last_index do
        if !(delimiters.include?(str[i]))
            numbers.push(str[i].to_i)
        end
    end

    numbers.sum
end


str = "1,2,3,4"

puts add_numbers_from_string(str)
