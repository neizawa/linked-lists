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

  def at(index)
    return @head.value if index.zero?

    node = @head
    index.negative? && index = size - index.abs
    index.times { node = node.next_node }
    node
  end

  def pop
    @tail = at(-2)
    @tail.next_node = nil
  end

  def contains?(value)
    node = @head

    until node.nil?
      return true if value == node.value

      node = node.next_node
    end
    false
  end

  def find(value)
    node = @head
    index = 0

    until node.nil?
      return index if value == node.value

      node = node.next_node
      index += 1
    end
    nil
  end

  def to_s
    node = @head
    result = ''

    until node.nil?
      result += "( #{node.value} ) -> "
      node = node.next_node
    end
    result + 'nil'
  end

  def insert_at(value, index)
    index == 0 && prepend(value) && return
    index == -1 && append(value) && return

    node = Node.new(value)
    node.next_node = at(index)
     at(index - 1).next_node = node
  end

  def remove_at(index)
    if index.zero?
      @head = at(index + 1)
    elsif index == -1
      pop && return
    else
      at(index - 1).next_node = at(index + 1)
   end
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
linked_list.prepend(3)
linked_list.prepend(91)
linked_list.prepend(123)
linked_list.prepend(87)
linked_list.prepend(9)
linked_list.pop
linked_list.insert_at(727, 2)
linked_list.remove_at(0)

p linked_list.head
p linked_list.tail
p linked_list.size
p linked_list.at(-3)
p linked_list.contains?(1)
p linked_list.find(123)
p linked_list.to_s