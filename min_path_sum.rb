class MinPathSum
  # @param a : array of array of integers
  # @return an integer
  def minPathSum(a)

    right_results = []
    down_results = []
    right_results << iterate_matrix(a[0][0], 0, 1, a)
    down_results << iterate_matrix(a[0][0], 1, 0, a)

    min_right = right_results[0]
    for i in 1..right_results.size-1
      if (right_results[i] < min_right)
        min_right = right_results[i]
      end
    end

    min_down = down_results[0]
    for i in 1..down_results.size-1
      if (down_results[i] < min_down)
        min_down = down_results[i]
      end
    end

    if (min_right < min_down)
      return min_right
    else
      return min_down
    end

  end

  def iterate_matrix(previous_sum, row_index, column_index, a)

    # End of Matrix
    if (a[row_index].size-1 == column_index && a.size-1 == row_index)
      return previous_sum + a[row_index][column_index]
    end

    current_sum = previous_sum + a[row_index][column_index]

    # Check if there is a path to the right
    if (column_index < a[row_index].size-1)
      iterate_matrix(current_sum, row_index, column_index+1, a)
    end

    # Check if there is a path to down
    if (row_index < a.size-1)
      iterate_matrix(current_sum, row_index+1, column_index, a)
    end

  end

    s = MinPathSum.new
    matrix = ARGV[0]
    p matrix
    p s.minPathSum(matrix)
end
