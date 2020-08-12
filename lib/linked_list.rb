class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(input)
    @datum = input
    @next = nil
  end
end

class SimpleLinkedList
  attr_reader :head

  def initialize(input = nil)
    if input.nil?
      @head = input
    else
      @head = nil
      input. each { |data| push(Element.new(data)) }
    end
  end

  def push(element)
    if @head.nil?
      @head = element
    elsif @head.next.nil?
      @head.next = element
    else
      node = @head
      until node.next.nil?
        node = node.next
      end
      node.next = element
    end
    self
  end

  def pop
    return nil if @head.nil?
    return @head if @head.next.nil?

    node = @head
    until node.next.nil?
      current_node = node
      node = node.next
      if current_node.next.next.nil?
        current_node.next = nil
      end
    end
    node
  end

  def to_a
    return [] if @head.nil?
    return [@head.datum] if @head.next.nil?

    values = []
    node = @head
    until node.next.nil?
      values = ([node.datum] + values)
      node = node.next
      if node.next.nil?
        values = [node.datum] + values
      end
    end
    values
  end

  def reverse!
    values = self.to_a
    @head = nil
    values.each { |data| self.push(Element.new(data)) }
    self
  end
end