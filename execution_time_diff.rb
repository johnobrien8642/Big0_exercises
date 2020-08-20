require 'byebug'

def my_min(arr)
    min = arr[0]
    arr.each do |el1|
        arr.each do |el2|
        min = el2 if el2 < min
        end
    end
    min
end