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
	end

	def depth_first_search(value)
	end

	def dfs_rec(value)
	end
end

arr = [0,2,4,5,10,14,18,20]
arr.shuffle!
new_tree = BST.new(arr)
puts new_tree.root.value
new_tree.build_tree

