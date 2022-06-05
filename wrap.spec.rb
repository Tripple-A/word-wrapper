# frozen_string_literal: true

require './wrap'

describe 'Wrapper class' do
  let(:string) { 'A certain string' }
  let(:column_number) { 54 }

  context 'when the parameters are of invalid types' do
    it 'raises an error when string is not supplied' do
      expect do
        Wrapper.wrap(['a string'], 3)
      end.to raise_error(TypeError)
    end

    it 'raises an error when an integer is not supplied for column number' do
      expect do
        Wrapper.wrap('a string', '3')
      end.to raise_error(TypeError)
    end
  end

  it 'returns the given string if the length is less than column number' do
    result = Wrapper.wrap(string, column_number)

    expect(result).to eq(string)
  end

  it 'performs word breaks' do
    result = Wrapper.wrap('Incredible for real', 12)

    expect(result).to eq("Incredible\nfor real")
  end

  context 'when a word length is greater than column number' do
    it 'breaks a single word into parts to allign with column number' do
      result = Wrapper.wrap('Argumentative', 5)

      expect(result.count("\n")).to eq(2)
      expect(result).to eq("Argum\nentat\nive")
    end

    it 'merges the remainder of the word to other words on new line' do
      result = Wrapper.wrap('Try something now', 7)

      expect(result).to eq("Try\nsomethi\nng now")
    end
  end

  context 'when there is lots of white space' do
    it 'removes the excess whitespace' do
      result = Wrapper.wrap('    I   love   you    ', 10)

      expect(result.count("\n")).to eq(0)
      expect(result).to eq('I love you')
    end
  end
end
