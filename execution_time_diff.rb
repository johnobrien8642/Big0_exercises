require 'byebug'

def my_min_phase_1(arr)
    min = arr[0]
    arr.each do |el1|
        arr.each do |el2|
        min = el2 if el2 < min
        end
    end
    min
end

def my_min_phase_2(arr)
    min = arr[0]
    arr.each { |el| min = el if el < min }
    min
end

def contiguous_sub_sum_phase_1(arr)
    subs = []
    (0...arr.length).each do |start_idx|
        (start_idx...arr.length).each do |end_idx|
            subs << arr[start_idx..end_idx]
        end
    end

    subs.map { |sub| sub.inject(:+) }.max
end

# This is still O(n^3), asked stackoverflow and had this clarified
# def largest_contiguous_sub_sum(arr)
#     largest_sum = -100

#     (0...arr.length).each do |start_idx|
#         (start_idx...arr.length).each do |end_idx|
#             current_sum = arr[start_idx..end_idx].sum
#             largest_sum = current_sum if largest_sum < current_sum
#         end
#     end
#     largest_sum
# end

# This is O(n) linear time, O(1) space
# taken from the course solutions. 
def largest_contiguous_subsum2(arr)
  largest = arr.first
  current = arr.first
  debugger
  (1...arr.length).each do |i|
    current = 0 if current < 0
    current += arr[i]
    largest = current if current > largest
  end

  largest
end

list = [5, 3, -7] #=> 8
list2 = [2, 3, -6, 7, -6, 7] #=> 8
list3 = [-5, -1, -3] #=> -1
puts largest_contiguous_subsum2(list2)


