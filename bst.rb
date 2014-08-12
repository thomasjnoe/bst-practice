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
				if current_node.left.nil?
					current_node.left = Node.new(value, current_node, nil, nil)
				else
					add(value, current_node.left)
				end
			else
				if current_node.right.nil?
					current_node.right = Node.new(value, current_node, nil, nil)
				else
					add(value, current_node.right)
				end
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

	def depth_first_search(value)
		stack = [root]
		visited = [root]
		current_node = root
		loop do
			return current_node.value if value == current_node.value
			if !current_node.left.nil? && !visited.include?(current_node.left)
				current_node = current_node.left
				stack.push(current_node)
				visited.push(current_node)
			elsif !current_node.right.nil? && !visited.include?(current_node.right)
				current_node = current_node.right
				stack.push(current_node)
				visited.push(current_node)
			else
				stack.size > 0 ? current_node = stack.pop : break
			end
		end
		return nil
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
end

arr = [0,2,4,5,10,14,18,20]
arr.shuffle!
new_tree = BST.new(arr)
new_tree.build_tree
puts new_tree.breadth_first_search(10)
puts new_tree.depth_first_search(10)
puts new_tree.dfs_rec(10)

