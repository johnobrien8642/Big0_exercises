require 'byebug'

#naive approach
# def windowed_max_range(arr, win)
#     best_max = nil
#     # debugger
#     (0...arr.length - 1).each do |i|
#         curr_win = arr[i...i + win]
#         curr_max = curr_win.max - curr_win.min
#         best_max = curr_max if !best_max || curr_max > best_max
#     end
#     best_max
# end

class MyQueue 
  def initialize(store = [])
    @store = store
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    @store.shift
  end
end

class MyStack
  def initialize
    @store = []
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def push(el)
    @store.push(el)
  end

  def pop
    @store.pop
  end
end

class StackQueue
  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def size 
    @in_stack.size + @out_stack.size
  end

  def empty?
    @in_stack.empty? && @out_stack.empty?
  end

  def enqueue(el)
    @in_stack.push(el)
  end

  def dequeue
    queueify if out_stack.empty

    @out_stack.push
  end

  private

  def queueify
    @out_stack.push(in_stack.pop) until in_stack.empty?
  end
end

class MinMaxQueue
  def initialize
    @store = MyStack.new  
  end

  def peek
    @store.peek[:value] unless empty?
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def max
    @store.peek[:max] unless empty?
  end

  def min
    @store.peek[:min] unless empty?
  end

  def pop 
    @store.pop[:value] unless empty?
  end

  def push(val)
    @store.push({
        max: new_max(val),
        min: new_min(val),
        value: val
    })
  end

  private

  def new_max(val)
    empty? ? val : [max, val].max
  end

  def new_min(val)
    empty? ? val : [min, val].min
  end
end

class MinMaxStackQueue
  def initialize
    @in_stack = MinMaxQueue.new
    @out_stack = MinMaxQueue.new
  end

  def size 
    @in_stack.size + @out_stack.size
  end

  def empty?
    @in_stack.empty? && @out_stack.empty?
  end

  def dequeue
    queueify if @out_stack.empty?
    @out_stack.pop
  end

  def enqueue(val)
    @in_stack.push(val)
  end

  def max
    maxes = []
    maxes << @in_stack.max unless @in_stack.empty?
    maxes << @out_stack.max unless @out_stack.empty?
    maxes.max
  end

  def min
    mins = []
    mins << @in_stack.min unless @in_stack.empty?
    mins << @out_stack.min unless @out_stack.empty?
    mins.min
  end

  private 

  def queueify
    @out_stack.push(@in_stack.pop) until @in_stack.empty?
  end
end

# def windowed_max_range(arr, window)




# end

# O(n) Optimized solution
def max_windowed_range(array, window_size)
  queue = MinMaxStackQueue.new
  best_range = nil
  # debugger
  array.each_with_index do |el, i|
    queue.enqueue(el)
    queue.dequeue if queue.size > window_size

    if queue.size == window_size
      current_range = queue.max - queue.min
      best_range = current_range if !best_range || current_range > best_range
    end
  end

  best_range
end






if __FILE__ == $PROGRAM_NAME
p max_windowed_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p max_windowed_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p max_windowed_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p max_windowed_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
end