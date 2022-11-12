module Enumerable
  # Your code goes here

  # method to check if all elements in the array satisfy the condition
  def my_each_with_index
    i = 0
    for elem in self
      # Takes in argument from self and returns arguments elem, i e.g { |elem, i| puts elem, i }
      yield elem, i
      i += 1
    end
  end
  def my_select
    empty_array = []
    for elem in self
      empty_array.push(elem) if yield(elem)
    end
    # returns the empty array
    empty_array
  end

  def my_all?
    # SOLUTION incorporating my_each

    # my_each do |x|
    #   if yield(x) === false
    #     return false
    #   end
    # end
    # return true

    # SOLUTION without external method

    for elem in self
      if !yield(elem)
        return false
      end
    end
    return true
  end

  def my_any?
    #SOLUTION multiple lines plus external method

    # my_each do |x| 
    #   if yield(x) == true
    #     return true
    #   end
    # end
    # return false

    #SOLUTION no external method

    # for elem in self
    #   if yield(elem)
    #     return true
    #   end
    # end
    # return false

    #SOLUTION one-liner

    my_each { |x| return true if yield(x)==true}
    return false
  end

  def my_none?
    my_each { |x| return false unless yield(x)==false}
    return true
  end

  def my_count
    if !block_given?
      return length
    end
    i = 0
    my_each { |x| i += 1 if yield(x) == true}
    return i
  end
  def my_map
    empty_arr = []
    my_each { |x| empty_arr << yield(x) }
    return empty_arr
  end
  def my_inject(initial_value)
    # accumulator = 0
    # my_each { |x| }

    initial_value
    my_each { |x| initial_value = yield(initial_value, x) }
    return initial_value
  end


end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    if !block_given?
      return "Block is not given"
    end
    for element in self
      yield element
    end
  end
end
