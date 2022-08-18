class MinPathSum
  # @param a : array of array of integers
  # @return an integer
  def minPathSum(a)

    @@results = []
    iterate_matrix(a[0][0], 0, 1, a)
    iterate_matrix(a[0][0], 1, 0, a)

    min_result = @@results[0]
    for i in 1..@@results.size-1
      if (@@results[i] < min_result)
        min_result = @@results[i]
      end
    end

    return min_result

  end

  def iterate_matrix(previous_sum, row_index, column_index, a)


    # End of Matrix
    if (a[row_index].size-1 == column_index && a.size-1 == row_index)
      @@results << previous_sum + a[row_index][column_index]
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
    p s.minPathSum([[3,8,0],[2,9,1],[1,7,4]])
end
