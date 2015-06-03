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
