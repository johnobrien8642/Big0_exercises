require 'byebug'

def windowed_max_range(arr, win)
    best_max = nil
    debugger
    (0...arr.length - 1).each do |i|
        curr_win = arr[i...i + win]
        curr_max = curr_win.max - curr_win.min
        best_max = curr_max if !best_max || curr_max > best_max
    end
    best_max
end

class MyQueue 
  def initialize
    @store = []
  end

  def peek
    @store.first
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

  def dequeue(el)
    @store.unshift(el)
  end
end




puts windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
puts windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
puts windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
puts windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8