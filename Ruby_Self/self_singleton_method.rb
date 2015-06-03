o = Object.new
def o.show_me_self
  puts "Singleton method show me self: #{self}"
end
o.show_me_self
puts "The object that called show_me_self:  #{o}."
