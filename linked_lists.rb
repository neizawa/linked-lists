class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)

    if @head.nil? && @tail.nil?
      @head, @tail = node, node
    else
      @tail.next_node = node
      @tail = node
    end
  end

  def prepend(value)
    node = Node.new(value)

    if @head.nil? && @tail.nil?
      @head, @tail = node, node
    else
      node.next_node = @head
      @head = node
    end
  end

  def size
    count = 0
    node = @head

    until node == nil
      node = node.next_node
      count += 1
    end
    count
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

linked_list = LinkedList.new
linked_list.append(1)
linked_list.append(6)
linked_list.prepend(7)
linked_list.prepend(9)

p linked_list.size