# Ruby Self

## Swimming in the Shallow End of Ruby's Dynamic Environment

### Luke DeWitt - DTC Ruby Meetup - 6/3/2015 - Ruby Beginners Talk

#### E-Mail - luke@dewittsoft.com / Twitter - lanewalkerx

---

# Ruby Self and Scope Definitions

- Self
    - Is the current object
    - At **every** moment when your program is running there's one and only one self.

---

# Self (Current/Default) Object

To know Self you must know what context you are in.

- Possible Contexts

    - Top Level
    - Class Definition Blocks
    - Module Definition Blocks
    - Method Definition Blocks

---

# Self (Current/Default) Object

Top Level - This is code that is written outside of any class or module definition

```ruby
m = self
puts self

$ ruby top_level.rb
main
```

This Self is outside most programming needs.

---

# Self (Current/Default) Object

- In Class or Module Definitions - Self is the Class or Module object

```ruby
class C
  puts "Just started class C: #{self}"
end
module M
  puts "Just started module M: #{self}"
end

$ ruby self_class_module_defs.rb
Just started class C: C
Just started module M: M
```

---

# Self (Current/Default) Object

- In Class or Module Definitions

    - Whenever a Class or Module keyword boundary is crossed that Class or Module becomes Self.

    - Reminder that Class's and Module's are themselves objects.

    - Examples to come on how to use this fact.

---

# Self (Current/Default) Object

- In Method Definitions

    - When the method is called, Self will be the object that called the method
    - Self in this case is an instance of the object in which the method is defined.


#### Example on the next slide

---

# Self (Current/Default) Object

```ruby
class C
  def x
    puts "Class C, inside  Method x: #{self}"
  end
end
c = C.new
c.x
puts "That was a call to x by: #{c}"

$ ruby self_in_method_defs.rb
Class C, inside  Method x: #<C:0x007fa22121f0a0>
That was a call to x by: #<C:0x007fa22121f0a0>
```

---

# Self (Current/Default) Object

- Self in a Singleton Method

    - Singleton Methods are defined on an instance of an object.

    - Method is written to a single object so that object gets to be Self.

#### Example on the next slide

---

# Self (Current/Default) Object

```ruby
o = Object.new
def o.show_me_self
  puts "Singleton method show me self: #{self}"
end
o.show_me_self
puts "The object that called show_me_self:  #{o}."

$ ruby self_singleton_method.rb
Singleton method show me self: #<Object:0x007fbb14087290>
The object that called show_me_self:  #<Object:0x007fbb14087290>
```

---

# Self (Current/Default) Object

- Using Self to define a Class method.
    - Allowed but not considered a best practice

```ruby
class C
  def C.x
  end
end
```

---

# Self (Current/Default) Object

- Using Self to define a Class method.
    - When an object is Self, the object is the default receiver, so a Class method can be defined this way.

```ruby
class C
  def self.x
  end
end
```

---

# Self (Current/Default) Object

- Self is the default receiver of bareword method calls.
    - Meaning you can call a method as if you had typed " ```self.x``` "
    - Omitting the " ```self.``` "

#### Example on next slide.

---

# Self (Current/Default) Object

```ruby
class C
  def x
    puts "This is x."
  end
  def y
    puts "This is y.  Calling x without a dot."
  x
  end
end
c = C.new
c.y
```

```ruby
$ ruby self_bareword.rb
This is y.  Calling x without a dot.
This is x.
```

---

# Self (Current/Default) Object

- Things to Remember
    - Class Objects can not call Instance Methods
    - Instance Methods can not call Class Methods.

#### Example next slide.

---

# Self (Current/Default) Object

```ruby
class CarFactory
  def self.order_machine_parts
    puts "I need more sprokets."
  end

  def make_car
    puts "A bright and shiny new car."
  end
end

model_T = CarFactory.new
model_T.make_car
CarFactory.order_machine_parts

# model_T.order_machine_parts
# CarFactory.make_car
```

---

# References

* __The Well-Grounded Rubyist__ 2<sup>nd</sup> Edition
  * David A. Black
  * Manning © 2014
