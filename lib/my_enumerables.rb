module Enumerable
  # Your code goes here
  def my_each_with_index
    idx = 0
    my_each do |element|
      yield(element, idx)
      idx += 1
    end
  end

  def my_select
    selected=[]
    my_each do |element|
      if yield(element)
        selected.push(element)
      end
    end
    selected
  end

  def my_all?
    my_each do |element|
      unless yield(element)
        return false
      end
    end
    true
  end

  def my_any?
    my_each do |element|
      if yield(element)
        return true
      end
    end
    false
  end

  def my_none?
    !my_any? { |element| yield(element) }
  end

  def my_count
    c=0
    if block_given?
      my_each { |element| c+=1 if yield(element) }
    else
      my_each { |_| c+=1 }
    end
    c
  end

  def my_map
    new=[]
    my_each {|element| new.push(yield(element))}
    new
  end

  def my_inject(val=0)
    my_each do |element|
      val=yield(val,element)
    end
    val
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self
      yield element
    end
  end
end