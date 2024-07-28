require_relative '../string_calculator'

RSpec.describe StringCalculator do
    it 'should return sum as same number if only one number is passed in a string' do
        string_with_numbers = StringCalculator.new('4')
        sum = string_with_numbers.add()
        expect(sum).to eq (4)
    end

    it 'should return sum of single digits separated by commas in a string' do
        string_with_numbers = StringCalculator.new('6,2,3,5')
        sum = string_with_numbers.add()
        expect(sum).to eq(16)
    end

    it 'should return 0 if there are no numbers in the string' do
        string = StringCalculator.new(',,,, ,,,, ,,,') # Sum should be 0
        sum = string.add()
        expect(sum).to eq(0)
    end

    it 'should return 0 if an empty string is passed' do
        empty_string = StringCalculator.new('')
        sum = empty_string.add()
        expect(sum).to eq(0)
    end

    it 'should return sum of numbers having multiple consecutive commas between them' do
        string_with_numbers = StringCalculator.new('1,,,4') # Sum is 5
        sum = string_with_numbers.add()
        expect(sum).to eq(5)
    end

    it 'should return sum of numbers having multiple digits within a number in comma separated string' do
        string_with_numbers = StringCalculator.new('143, 24, 1, 34') # Sum is 202
        sum = string_with_numbers.add()
        expect(sum).to eq(202)
    end

    it 'should return appropriate sum if we pass new line characters (\n) instead of commas in the string' do
        string_with_numbers = StringCalculator.new('13\n24\n1,21') # Sum is 59
        sum = string_with_numbers.add()
        expect(sum).to eq(59)
    end

    it 'should return 0 if only set of delimiters passed in a string' do
        string_with_delimiters_only = StringCalculator.new('\n,,,\n,\n\n,')
        sum = string_with_delimiters_only.add()
        expect(sum).to eq(0)
    end

    it 'should support different delimieters: when specified at runtime in string itself' do
        string_with_numbers = StringCalculator.new('//;\n1;2')
        sum = string_with_numbers.add()
        expect(sum).to eq(3)
    end

    it 'should throw an exception if there is a negative number in string' do
        string_with_negative_number = StringCalculator.new('3,5,-6,\n19')
        result = string_with_negative_number.add()
        expect(result).to eq("Negative numbers not allowed: [-6]")
    end
end