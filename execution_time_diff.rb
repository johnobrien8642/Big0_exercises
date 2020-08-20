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

list = [5, 3, -7] #=> 8
list2 = [2, 3, -6, 7, -6, 7] #=> 8
list3 = [-5, -1, -3] #=> -1
puts contiguous_sub_sum_phase_1(list3)


