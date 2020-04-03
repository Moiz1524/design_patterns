# To understand this pattern it is recommended to first learn Encapsulation (OOP concept) and single-responsibility design principle
# This pattern provides a way to access the elements of aggregate object sequentially without exposing its underlying representation.


class AlphabeticalOrderIterator

  include Enumerable

  attr_accessor :reverse
  private :reverse

  attr_accessor :collection
  private :collection

  def initialize(collection, reverse = false)
    @collection = collection
    @reverse = reverse
  end

  def each(&block)
    return @collection.reverse.each(&block) if reverse

    @collection.each(&block)
  end

end

class WordsCollection

  attr_accessor :collection
  private :collection

  def initialize(collection = [])
    @collection = collection
  end

  def iterator
    AlphabeticalOrderIterator.new(@collection)
  end

  def reverse_iterator
    AlphabeticalOrderIterator.new(@collection, true)
  end

  def add_item(item)
    @collection << item
  end

end

collection = WordsCollection.new
collection.add_item('First')
collection.add_item('Second')
collection.add_item('Third')

puts 'Straight Traversal:'
collection.iterator.each { |item| puts item }
puts "\n"

puts 'Reverse Traversal:'
collection.reverse_iterator.each { |item| puts item }
