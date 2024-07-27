require_relative '../string_calculator'

RSpec.describe StringCalculator do
    it 'should return sum of single digits separated by commas in a string' do
        string_with_numbers = StringCalculator.new('6,2,3,5')
        sum = string_with_numbers.add()
        expect(sum).to eq(16)
    end
end