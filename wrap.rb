require 'sorbet-runtime'

class Wrapper
  extend T::Sig

  sig { params(string: String, column_number: Integer).returns(String) }
  def self.wrap(string,column_number)
    return string if string.length <= column_number
    final_string = ''

    add_breaks = ->(string_array, column_number, output) {
      if string_array.empty? && output.length <= column_number
        return final_string += output
      end
      
      word_to_add = string_array[0]
      new_output = "#{output} #{word_to_add}"
      if output.length > column_number
        final_string += "#{output[0...column_number]}\n"
        add_breaks.call(string_array,column_number,output[column_number..-1])
      elsif new_output.length <= column_number
        add_breaks.call(string_array[1..-1],column_number,new_output)
      else
        final_string += "#{output}\n"
        add_breaks.call(string_array[1..-1],column_number,word_to_add)
      end
    }

    string_array = string.split(' ')
    add_breaks.call(string_array[1..-1], column_number, string_array[0])
    final_string
  end
end