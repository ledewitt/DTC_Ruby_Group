class CarFactory
  def self.order_machine_parts
    puts "I need more sprokets."
  end

  def make_car
    puts "A bright and shiney new car."
  end
end

model_T = CarFactory.new
model_T.make_car
CarFactory.order_machine_parts

# model_T.order_machine_parts
# CarFactory.make_car
