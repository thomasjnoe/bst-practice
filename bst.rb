#!/usr/bin/env ruby

class Node
	attr_accessor :value, :parent, :left, :right

	def initialize(value, parent, left, right)
		@value = value
		@parent = parent
		@left = left
		@right = right
	end
end

class BST
	attr_accessor :arr, :root
	def initialize(arr)
		@arr = arr
		@root = Node.new(arr[0], nil, nil, nil)
	end

	def build_tree
		arr.each do |node|
			add(node)
		end
	end

	def add(value, current_node = root)
		if value != current_node.value
			if value < current_node.value
				current_node.left.nil? ? current_node.left = Node.new(value, current_node, nil, nil) : add(value, current_node.left)
			else
				current_node.right.nil? ? current_node.right = Node.new(value, current_node, nil, nil) : add(value, current_node.right)
			end
		end
	end

	def breadth_first_search(value)
		queue = []
		current_node = root
		begin
			current_node = queue.shift if queue.size > 0
			return current_node.value if value == current_node.value
			queue.push(current_node.left) if current_node.left.nil? == false
			queue.push(current_node.right) if current_node.right.nil? == false
		end while queue.size > 0
		return nil
	end

	def depth_first_search(value)
		stack = [root]
		until stack.empty?
			current_node = stack.pop
			return current_node.value if value == current_node.value
			stack.push(current_node.left) unless current_node.left.nil?
			stack.push(current_node.right) unless current_node.right.nil?
		end
		nil
	end

	def dfs_rec(value, current_node = root)
		result = nil
		return current_node.value if value == current_node.value
		if !current_node.left.nil?
			result = dfs_rec(value, current_node.left)
			return result if !result.nil?
		end
		if !current_node.right.nil?
			result = dfs_rec(value, current_node.right)
			return result if !result.nil?
		end
		result
	end

	def bfs_show_tree # For debugging purposes
		queue = []
		current_node = root
		begin
			current_node = queue.shift if queue.size > 0
			puts "Current_node is #{current_node.value}"
			left_child = current_node.left.nil? ? "None" : current_node.left.value
			right_child = current_node.right.nil? ? "None" : current_node.right.value
			puts "Current Node's children: #{left_child}, #{right_child}"
			queue.push(current_node.left) if current_node.left.nil? == false
			queue.push(current_node.right) if current_node.right.nil? == false
		end while queue.size > 0
	end
end

arr = [0,2,4,5,10,14,18,20]
arr.shuffle!
new_tree = BST.new(arr)
new_tree.build_tree
puts new_tree.breadth_first_search(10)
puts new_tree.depth_first_search(10)
puts new_tree.dfs_rec(10)

