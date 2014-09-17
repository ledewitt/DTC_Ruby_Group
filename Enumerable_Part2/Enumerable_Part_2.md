# Enumerable <sub>Part 2</sub>

## Let Ruby Count the Ways

### Luke DeWitt - DTC Ruby Meetup - 7/2/2014 - Ruby Beginners Talk

#### E-Mail - luke@dewittsoft.com / Twitter - lanewalkerx

---

# Topics covered

* Enumerable vs Enumerator
* Ruby's Way of Enumerating
* Lazy Enumerators

---

# Enumerable vs Enumerator

* Enumerable is a module
  * Provides a Namespace
  * Implements Mixins

* Enumerator is a Ruby Class
  * Captures idea of Enumeration as an object
  

---

# Ruby's Way of Enumerating

"In Ruby, the basic iterator is internal to the collection—it’s simply a method, identical to any other, that happens to call yield whenever it generates a new value. The thing that uses the iterator is just a block of code associated with a call to this method."

* Programming Ruby (p. 57)

---

# Example of Enumerators

```ruby
> a = [ 1, 3, "cat" ]
 => [1, 3, "cat"]
> a.next
NoMethodError: undefined method `next' for [1, 3, "cat"]:Array
	from (irb):2
	from /Users/luke/.rvm/rubies/ruby-2.1.2/bin/irb:11:in `<main>'
```	  

## Create the Enumerator Object

```ruby
> enum_a = a.to_enum
  => #<Enumerator: [1, 3, "cat"]:each>
> enum_a.class
  => Enumerator
```

---

# Examples of Enumerators cont.

```ruby
> enum_a.next
 => 1
> enum_a.next
 => 3
> enum_a.next
 => "cat"
> enum_a.next
StopIteration: iteration reached an end
```

---

How Enumerator is used by Enumerable (One of the Ways)

An Array is Enumerable -

* Array is a Class that mixes in Enumerable
* Enumerable's each function returns an Enumerator Object

---

Example - Each returns a Enumerator Object

```ruby
> a
 => [1, 3, "cat"]
> a.each
 => #<Enumerator: [1, 3, "cat"]:each>
> a.each.next
 => 1
> a.each.next
 => 1
```

---

# Lazy Enumerators in Ruby 2

When enumerators are lazy they do the minimum amount of work until the job is done.

---

Example - Mapping when the Enumerator isn't Lazy

```ruby
> (1..9).map { |n| puts "Doing #{n} * 100..."; n * 100 }.find { |nnn| nnn.between?(190, 210) }
Doing 1 * 100...
Doing 2 * 100...
Doing 3 * 100...
Doing 4 * 100...
Doing 5 * 100...
Doing 6 * 100...
Doing 7 * 100...
Doing 8 * 100...
Doing 9 * 100...
 => 200
```

---

Example - Mapping when the Enumerator is Lazy

```ruby
> (1..9).lazy.map { |n| puts "Doing #{n} * 100..."; n * 100 }.find { |nnn| nnn.between?(190, 210) }
Doing 1 * 100...
Doing 2 * 100...
 => 200
```
---

Example - Ruby picking navel lint in Infinity

```ruby
> range = 1..Float::INFINITY
 => 1..Infinity
> p range.collect { |x| x*x }.first(10)

???
```
Hello Ruby where did you go....

---

Example - Ruby getting lazy in Infinity

```ruby
> range = 1..Float::INFINITY
 => 1..Infinity
> p range.lazy.collect { |x| x*x }.first(10)
[1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
 => [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
```

Magic... Sort of...

---

# References

* __The Well-Grounded Rubyist__ 2<sup>nd</sup> Edition
  * David A. Black
  * Manning © 2014
  
* __Programming Ruby 1.9 & 2.0__
  * Dave Thomas
  * Pragmatic Programmers © 2013
  
---

# References cont.
  
* Robert Quails
  * http://www.sitepoint.com/guide-ruby-collections-iii-enumerable-enumerator/
* Pat Shaughnessy
  * http://patshaughnessy.net/2013/4/3/ruby-2-0-works-hard-so-you-can-be-lazy