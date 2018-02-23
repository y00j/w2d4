
list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]


def my_min(list)
  min = list.first

  list.each do |el1|
    list.each do |el2|
      min = el2 if min > el2
    end
  end
  min
end

def my_better_min(list)
  min = list.first
  list.each do |el|
    min = el if el < min
  end
  min
end

def contiguous_sum(list)
  sub_arrays = []
  list.each_index do |i1|
    list.each_index do |i2|
      next if i2 < i1
      sub_arrays << list[i1..i2]
    end
  end

  largest = 0

  sub_arrays.first.each do |el|
    largest += el
  end

  sub_arrays[1..-1].each do |sub_arr|
    curr_sum = 0
    sub_arr.each { |el| curr_sum += el }
    largest = curr_sum if curr_sum > largest
  end
  largest
end

def best_contiguous_sum(list)

  largest = list.first
  running_tot = list.first



  list[1..-1].each do |el|
    if largest < 0
      largest = largest > el ? largest : el
    end
    running_tot += el
    if running_tot > largest
      largest = running_tot
    elsif running_tot < 0
      running_tot = 0
    end
  end
  largest

end

def first_anagram?(string1, string2)
  total_size = factorial(string1.length)
  str_perms = []
  begin

    str_perms << string1.chars.shuffle.join
    str_perms.uniq
  end until str_perms.length == total_size

  str_perms.include?(string2)
end

def first_anagram?(str1, str2)
  return [str1] if str1.length <= 1
  str_perms = []
  sub_strings = first_anagram?(str1[1..-1], str2)
  removed_el = str1[0]

  sub_strings.each do |str|
    (0..str.length).each do |idx|
      str_perms << str[0...idx] + removed_el + str[idx..-1]
    end
  end

  str_perms
end

def factorial(n)
  (1..n).reduce(:*)
end

def second_anagram?(string1, string2)
  str1_chars = string1.chars
  str2_chars = string2.chars

  string1.each_char.with_index do |ch1, i|
    str2_chars.each_with_index do |ch2, j|
      if ch1 == ch2
        str2_chars.delete_at(j)
        break
      end
    end
  end

  string2.each_char.with_index do |ch1, i|
    str1_chars.each_with_index do |ch2, j|
      if ch1 == ch2
        str1_chars.delete_at(j)
        break
      end
    end
  end
  p str1_chars
  p str2_chars
  str2_chars.empty? && str1_chars.empty?
  #O(n^2)
end

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1, str2)
  str1_hash = Hash.new(0)

  str1.each_char do |char|
    str1_hash[char] += 1
  end

  str2.each_char do |char|
    str1_hash[char] -= 1
    return false if str1_hash[char] < 0
  end

  str1_hash.values.all? { |count| count == 0 }

end

def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |el1, i|
    arr.each_with_index do |el2, j|
      next if j <= i
      return true if el1 + el2 == target_sum
    end

  end
  false
end

# def okay_two_sum?(arr, target_sum)
#   sorted = arr.sort
#
#   sorted.each do |el|
#
#   end
#
#
# end

# def b_searc(arr, target)
#   mid = arr.length / 2
#   left = arr[0...mid]
#   right = arr[mid + 1..-1]
#
#   if arr[mid] ==
#
# end

def true_two_sum(arr, targ)

  arr_hash = Hash.new

  arr.each { |el| arr_hash[n] = true }

  arr.each { |el| return arr_hash[targ - el] if arr_hash[targ - el] }
  false 
end



str1 = "abcde"

str2 = "cbdea"
p first_anagram?(str1, str2)
# fourth_anagram?(str1, str2)
# p third_anagram?(str1, str2)
# p second_anagram?("abcde", "cbdea")
# p first_anagram?("abcde", "cbdea")

# p my_min(list)
# p my_better_min(list)
# p contiguous_sum([2, 3, -6, 7, -6, 7])
# p contiguous_sum([-5, -1, -3])
# p best_contiguous_sum([2, 3, -6, 7, -6, 7])
# p best_contiguous_sum([-5, -1, -3])
