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

# Anagrams

def first_anagram?(word1, word2)
    word1_arr = word1.split('')
    pos_anagrams = word1_arr.permutation.to_a
    
    pos_anagrams.each do |subArray| 
        if subArray.join('') == word2
            return true
        end
    end
    false
end

def second_anagram?(string1, string2)
    word2 = string2.split('')
    
    (0...string1.length).each do |i|
        char_to_check = string1[i]
        word2.delete_at(word2.index(char_to_check)) if word2.include?(char_to_check)
    end

    return true if word2.empty?
    false
end

def third_anagram?(word1, word2)
    arr1, arr2 = word1.split(''), word2.split('')

    return true if arr1.sort == arr2.sort
    false
end

def fourth_anagram?(word1, word2)
    char_count = Hash.new(0)

    word1.each_char { |char| char_count[char] += 1 }
    word2.each_char { |char| char_count[char] -= 1 }

    char_count.values.all? { |val| val == 0 }
end



# O(n^3) cubic time?
# O(n^2) quadratic space?
def bad_two_sum?(arr, target_sum)
    all_pairs = []
    arr.each_with_index do |el1, idx1|
      arr.each_with_index do |el2, idx2|
        if idx2 > idx1
          all_pairs << [ el1, el2 ]
        end
      end
    end

    all_pairs.any? { |pair| pair.sum == target_sum }
end


def okay_two_sum_a?(arr, target_sum)
  sorted_arr = arr.sort
  i, j = 0, arr.length - 1

  while i < j
    case (arr[i] + arr[j]) <=> target_sum
    when 0
        return true
    when -1 
        i += 1
    when 1
        j -= 1
    end 
  end
  false
end

#O(n) linear time
#O(n) linear space
def two_sum?(arr, target_sum)
  debugger
  complements = {}

  arr.each do |el|
    return true if complements[target_sum - el]
    complements[el] = true
  end

  false
end


arr = [0, 3, 5, 7]
# puts two_sum?(arr, 6) # => should be true
puts two_sum?(arr, 10) # => should be false



