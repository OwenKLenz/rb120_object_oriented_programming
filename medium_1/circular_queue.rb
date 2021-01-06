# Your task is to write a CircularQueue class that implements a circular queue 
# for arbitrary objects. The class should obtain the buffer size with an 
# argument provided to CircularQueue::new, and should provide the following
# methods:

# - enqueue to add an object to the queue
# - dequeue to remove (and return) the oldest object in the queue. It should 
# return nil if the queue is empty.

# You may assume that none of the values stored in the queue are nil (however, 
# nil may be used to designate empty spots in the buffer).

class CircularQueue
  def initialize(buffer_size)
    @buffer_end = buffer_size - 1
    @queue = Array.new(buffer_size)
    @front_of_queue = 0
    @back_of_queue = 0
  end

  def enqueue(value)
    dequeue unless @queue[@back_of_queue].nil?

    @queue[@back_of_queue] = value
    @back_of_queue = increment_index(@back_of_queue)
  end

  def dequeue
    dequeued_element = @queue[@front_of_queue]
    @queue[@front_of_queue] = nil
    @front_of_queue = increment_index(@front_of_queue) if !dequeued_element.nil? 
    dequeued_element
  end

  private

  def increment_index(current_index)
    current_index == @buffer_end ? 0 : current_index + 1 
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

# Further Exploration:
# Phew. That's a lot of work, but it's a perfectly acceptable solution to this 
# exercise. However, there is a simpler solution that uses an Array, and the 
# #push and #shift methods. See if you can find a solution that does this. And 
# no, you're not allowed to monkey-patch the Array class, though doing so may 
# help you determine what needs to be done.

class CircularQueue
  attr_reader :queue

  def initialize(buffer_size)
    @queue = Array.new(buffer_size)
  end

  def enqueue(val)
    @queue.reverse!
    @queue.unshift(val)
    @queue.pop
    @queue.reverse!
  end

  def dequeue
    dequeued_element = nil
    @queue.each_with_index do |element, index|
      if element != nil
        dequeued_element = element
        @queue[index] = nil
        return dequeued_element
      end
    end
    nil
  end
end

queue = CircularQueue.new(3)

puts queue.dequeue == nil

queue.enqueue(1)
p queue.queue
queue.enqueue(2)
p queue.queue
puts queue.dequeue == 1
p queue.queue

queue.enqueue(3)
p queue.queue
queue.enqueue(4)
p queue.queue
puts queue.dequeue == 2

queue.enqueue(5)
p queue.queue
queue.enqueue(6)
p queue.queue
queue.enqueue(7)
p queue.queue
puts queue.dequeue == 5
p queue.queue
puts queue.dequeue == 6
p queue.queue
puts queue.dequeue == 7
p queue.queue
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil