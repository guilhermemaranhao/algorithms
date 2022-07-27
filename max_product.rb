class Solution
  # @param a : constant array of integers
  # @return an integer
  def maxProduct(a)

    max_product = a[0]
    sequence_product = a[0]
    temp_prod = a[0]
    has_zero = false
    reset = false
    a.each_with_index do |i, idx|
      if (idx == 0)
        if (i == 0)
          reset = true
        end
        next
      end
      if (i == 0)
        has_zero = true
        if (!max_product || temp_prod > max_product)
          max_product = temp_prod
        end
        if (temp_prod > sequence_product)
          sequence_product = temp_prod
        end
        temp_prod = 1
        reset = true
      else
        if (reset)
          temp_prod = i
          sequence_product = i
          reset = false
        else
          sequence_product *= i
          temp_prod *= i
        end
        if ((temp_prod > max_product) || (sequence_product > max_product))
          max_product = temp_prod > sequence_product ? temp_prod : sequence_product
        else
          temp_prod = i
        end
      end
    end

    if (has_zero && sequence_product < 0 && max_product < 0)
      return 0
    end
    if (!max_product || sequence_product > max_product)
      max_product = sequence_product
    end
    return max_product
  end

  s = Solution.new
  arr = ARGV[0].split(",").map { |s| s.to_i }
  p arr
  p s.maxProduct(arr)
end

