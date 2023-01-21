# methods for manipulating the linkedlist
class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # adds a new node containing #value to the end of the list
  def append(value)
    new_node = Node.new(value)
    if @tail.nil?
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
    @head = new_node if @head.nil?
  end
  
  # adds a new node containing #value to the start of the list
  def prepend(value)
    new_node = Node.new(value, @head)
    @head = new_node
    @tail = new_node if tail.nil?
  end

  # returns the total number of nodes in the list
  def size
    current_node = @head
    size = 1
    if @head.nil?
      size = 0
    else
      until current_node.next_node.nil?
        current_node = current_node.next_node
        size += 1
      end
    end
    size
  end

  # returns the first node in the list
  def head
    @head
  end

  # returns the last node in the list
  def tail
    @tail
  end

  # returns the node at the given index
  def at(index)
    current_node = @head
    index.times do
      current_node = current_node.next_node
    end
    if current_node.nil?
      puts 'No node exists for specified index.'
    else
      current_node
    end
  end

  # removes the last element from the list
  def pop
    current_node = @head
    if current_node.next_node == @tail
      @tail = current_node
    elsif current_node == @head && current_node.next_node.nil?
      @head = nil
    else
      until current_node.next_node == @tail
        current_node = current_node.next_node
      end
      current_node.next_node = nil
    end
  end

  def contains?(value)  # returns true if the passed in value is in the list and otherwise returns false
  end

  def find(value) # returns the index of the node containing value, or nil if not found
  end

  def to_s  # represents LinkedList objects as strings, so that they can be printed and viewed in the console
  end

  def insert_at(value, index) # inserts new node with provided value at the given index
  end

  def remove_at(index)  # removes the node at the given index
  end
end

class Node  # contains the node information
  attr_accessor :next_node, :value

  def initialize(value = nil, next_node = nil)
    @next_node = next_node
    @value = value
  end
end

list = LinkedList.new

list.prepend('crank that')
list.append('soulja boy')
puts list.head.value
puts list.tail.value
puts list.size
list.pop
puts list.size
