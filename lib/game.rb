class game
  def gather_numbers
    arr = []
    3.times do arr.push(generate_random_number(arr))
    end
    return arr
  end
  def generate_random_number(duplicates_arr)
    num = rand 8
    if duplicates_arr.include?(num) then generate_random_number(duplicates_arr)
    else
      return num
    end 
  end
end