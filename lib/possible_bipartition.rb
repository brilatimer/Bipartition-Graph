
def possible_bipartition(dislikes)  
  coloring = {}
  dislikes.each_with_index do |dislike_array, this_puppy|
    # If the node connected to "this_puppy" doesn't exist in coloring,
    # need to search it
    if !coloring.key?(this_puppy)
      coloring[this_puppy] = true
      is_bipartite = dfs(dislikes, this_puppy, dislike_array, coloring)
      # If false, return immediately, otherwise check remaining puppies 
      if is_bipartite == false
        return false
      end
    end
  end
  return true
end

def dfs(dislikes, this_puppy, dislike_array, coloring)
  dislike_array.each do |next_puppy|
    # If adding to coloring, make the color the opposite
    if !coloring.key?(next_puppy)
      coloring[next_puppy] = !coloring[this_puppy]
      is_bipartite = dfs(dislikes, next_puppy, dislikes[next_puppy], coloring)
      if is_bipartite == false
        return false
      end
      # If the color exists and it's the same, it isn't bipartite
    elsif coloring[this_puppy] == coloring[next_puppy]
      return false
    end
  end
end
