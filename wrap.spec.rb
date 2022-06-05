require './wrap.rb'

describe 'Wrapper class' do
  let(:string) { 'A certain string'}
  let(:column_number) { 54 }

  it 'return strings if less than column number' do
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
    end

    it 'merges the remainder of the word to other words on new line' do
      result = Wrapper.wrap('Try something now', 7)

      expect(result).to eq("Try\nsomethi\nng now")
    end
  end
end