# Ruby Containers (*Arrays*, *Hashes*) and *Blocks*

### Luke DeWitt - DTC Ruby Meetup - 1/7/2015 - Ruby Beginners Talk

#### E-Mail - luke@dewittsoft.com / Twitter - lanewalkerx

---

# Or - The rest of Chapter 4 in the Pick Axe Book

### Luke DeWitt - DTC Ruby Meetup - 1/7/2015 - Ruby Beginners Talk

#### E-Mail - luke@dewittsoft.com / Twitter - lanewalkerx

---

# *Arrays*

* *Arrays* are objects that hold collections of other objects.

  - Created using literals
  
  ```ruby
> a = [ 1, "string2", 2, "string2"]
   => [1, "string2", 2, "string2"]
> a.class
   => Array
  ```

---

# *Arrays*

  - Created Explicitly
  
  ```ruby
> b = Array.new
   => []
> b.class
   => Array
  ```

---

# Working with *Arrays*

* *Arrays* are indexed with the ```[]``` operator

  ```ruby
> a
   => [1, "string2", 2, "string2"]
> a[0]
   => 1
> a[3]
   => "string2"
> a[4]
   => nil
   ```
   
---

# Working with *Arrays*

* *Array* indexing continued

   ```ruby
> a[-1]
    => "string2"
 > a[-4]
    => 1
 > a[-5]
    => nil
   ```

---


# Working with *Arrays*

* *Array* indexing can also be done with a pair of numbers ```[start,count]```

  ```ruby
> a = [2,4,6,8,10,12]
   => [2, 4, 6, 8, 10, 12]
> b = a[2,4]
   => [6, 8, 10, 12]
> b
   => [6, 8, 10, 12]
  ```
  
---

# Working with *Arrays*

* *Arrays* can also be accessed with ranges.  Defined with two or three periods.

  ```ruby
> a
   => [2, 4, 6, 8, 10, 12]
> a[1..4]
   => [4, 6, 8, 10]
> a[1...4]
   => [4, 6, 8]
  ```
  
---

# Working with *Arrays*
  
* ```..``` includes the object at the end of the range ```...``` does not

---

# Working with *Arrays*

* *Arrays* have lots of methods.  The methods ```push``` and ```pop``` allow an *array* to act as a stack.

```ruby
> stack = Array.new
 => []
> stack.push "Red"
> stack.push "Green"
> stack.push "Refactor"
 => ["Red", "Green", "Refactor"]
> stack.pop
 => "Refactor"
> stack.pop
 => "Green"
> stack.pop
 => "Red"
> stack
 => []
```

---

# *Hashes*

- *Hashes*
  - Similar to *Arrays* in that they are indexed collections of objects
  - However the indexes are not usually integers
  
- *Hash* indexing can be done with any object
- Most commonly I have seen Symbol objects used as the index

---

# Creating *Hashes* with Symbols, 2 possible ways

```ruby
> h = { :dog => 'bark', :cat => 'meow', :cow => 'moo' }
 => {:dog=>"bark", :cat=>"meow", :cow=>"moo"}
> h2 = { dog: 'bark', cat: 'meow', cow: 'moo' }
 => {:dog=>"bark", :cat=>"meow", :cow=>"moo"}
```

---

# Working with *Hashes*

- Accessing Items in the hash by using ```[]``` operator, and giving the index.

```ruby
> h[:dog]
 => "bark"
> h[:dog].class
 => String
 ```

---

# Mix and Match *Array* and *Hash*

- Using an Array of Symbols you can access the hash that was created.

```ruby
> animal = [:dog,:cat,:cow]
 => [:dog, :cat, :cow]
> h[animal[1]]
 => "meow"
> animal[1]
=> :cat
```

---

# *Blocks*

- A Ruby *Block* is a chunk of code between braces or the keywords ```do``` and ```end```

- A *Block* can be thought of as the body of an unnamed method

- *Blocks* can take parameters those appear at the beginning of the block between vertical bars

---

# *Blocks* Examples

- Braces format

```ruby
> some_array = [1,2,3]
 => [1, 2, 3]
> some_array.each {|value| puts value * 3 }
3
6
9
```

---

# *Blocks* Examples

- ```do``` and ```end``` format

```ruby
other_array = [5, 17, 129]
sum = 0

other_array.each do |value|
    sum += value
    puts sum
end

$ ruby block_example.rb
5
22
151
```

---

# *Arrays*, *Hashes* and *Blocks*.

- Going back to some previous created containers

```ruby
> h
 => {:dog=>"bark", :cat=>"meow", :cow=>"moo"}
> animal
 => [:dog, :cat, :cow]
```

- Lets use a *block* to access the *hash* with the elements of the *array*.

---

# *Arrays*, *Hashes* and *Blocks*.

```ruby
> animal.each { |symbol| puts h[symbol] }
bark
meow
moo
```

---

# References
  
* __Programming Ruby 1.9 & 2.0__
  * Dave Thomas
  * Pragmatic Programmers © 2013