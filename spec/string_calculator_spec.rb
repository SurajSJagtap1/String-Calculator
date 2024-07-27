require_relative '../string_calculator'

RSpec.describe StringCalculator do
    it 'should return sum of single digits separated by commas in a string' do
        string_with_numbers = StringCalculator.new('6,2,3,5')
        sum = string_with_numbers.add()
        expect(sum).to eq(16)
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
end