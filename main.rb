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
    if @head.nil?
      @head = new_node
    elsif @tail.nil?
      @head.next_node = new_node
    else
      @tail.next_node = new_node
    end
    @tail = new_node
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
      @tail.next_node = nil
    elsif current_node == @head && current_node.next_node.nil?
      @head = nil
      current_node.value = nil
    else
      until current_node.next_node == @tail
        current_node = current_node.next_node
      end
      current_node.next_node = nil
      @tail = current_node
    end
  end

  # returns true if the passed in value is in the list and otherwise returns false
  def contains?(value)
    current_node = @head
    until current_node.next_node.nil?
      if current_node.value == value
        return true
      else
        current_node = current_node.next_node
        false
      end
    end
  end

  # returns the index of the node containing value, or nil if not found
  def find(value)
    current_node = @head
    index = 0
    until current_node.value == value
      if current_node.next_node.nil? && current_node.value != value
        nil
      else
        current_node = current_node.next_node
        index += 1
      end
    end
    index
  end

  # represents LinkedList objects as strings, so that they can be printed and viewed in the console
  def to_s
    string = ''
    current_node = @head
    until current_node.nil?
      string += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    string += ' nil'
    string
  end

  # inserts new node with provided value at the given index
  def insert_at(value, index) 
    current_node = @head
    previous_node = nil
  end

  # removes the node at the given index
  def remove_at(index)
  end
end

class Node  # contains the node information
  attr_accessor :next_node, :value

  def initialize(value = nil, next_node = nil)
    @next_node = next_node
    @value = value
  end
end
