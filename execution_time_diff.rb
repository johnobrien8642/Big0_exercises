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

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# puts my_min_phase_2(list)  # =>  -5
