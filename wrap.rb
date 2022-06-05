# frozen_string_literal: true

require 'sorbet-runtime'

class Wrapper
  extend T::Sig

  sig { params(string: String, column_number: Integer).returns(String) }
  def self.wrap(string, column_number)
    return string if string.length <= column_number

    final_string = ''
    add_breaks = lambda { |string_array, output|
      return final_string += output if string_array.empty? && output.length <= column_number

      word_to_add = string_array[0]
      new_output = "#{output} #{word_to_add}"
      if output.length > column_number
        final_string += "#{output[0...column_number]}\n"
        add_breaks.call(string_array, output[column_number..])
      elsif new_output.length <= column_number
        add_breaks.call(string_array[1..], new_output)
      else
        final_string += "#{output}\n"
        add_breaks.call(string_array[1..], word_to_add)
      end
    }

    string_array = string.split(' ')
    add_breaks.call(string_array[1..], string_array[0])
    final_string
  end
end
