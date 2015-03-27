 class Node

  attr_accessor :value, :left_child, :right_child

  def initialize(value, parent=nil, left_child=nil, right_child=nil)
    @value = value
    @left_child = left_child
    @right_child = right_child
  end

end

def build_tree(arr, first=0, last=arr.length-1)
  return if first > last
  mid = first + (last - first) / 2
  
  root = Node.new(arr[mid])
  root.left_child = build_tree(arr, first, mid-1)
  root.right_child = build_tree(arr, mid+1, last)
  root
end

def bst_from_unord_arr(arr)
  root ||= Node.new(arr[0])
  current = root
  while current
    arr[1..-1].each do |elem|
      if elem > current.value
        unless current.right_child.nil?
          current = current.right_child
          current.right_child = Node.new(elem)
        else
          current.right_child = Node.new(elem)
        end
      elsif elem < current.value
        unless current.left_child.nil?
          current = current.left_child
          current.left_child = Node.new(elem)
        else
          current.left_child = Node.new(elem)
        end
      end
    end
    current = nil
  end
  root
end

def breadth_first(tree, value)
  queue = [tree]
  return tree if tree.value == value
  until queue.empty?
    current_node = queue.shift
    left = current_node.left_child
    right = current_node.right_child
    return current_node if current_node.value == value
    queue << left unless left.nil?
    queue << right unless right.nil?
  end
  nil
end

def depth_first(tree, value)
  queue = [tree]
  return tree if tree.value == value
  until queue.empty?
    current_node = queue.pop
    left = current_node.left_child
    right = current_node.right_child
    return current_node if current_node.value == value
    queue << left unless left.nil?
    queue << right unless right.nil?
  end
  nil
end

def depth_first_rec(tree, value)
  return tree if tree.value == value
  unless tree.left_child.nil?
    result = depth_first_rec(tree.left_child, value)
    return result unless result.nil?
  end
  unless tree.right_child.nil?
    result = depth_first_rec(tree.right_child, value)
    return result unless result.nil?
  end
  nil
end

