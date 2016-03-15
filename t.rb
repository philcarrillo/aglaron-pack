puts "Test Program"

=begin -----------------------------------------
def incr(a)
	puts "a at TP1: #{a}"
	a += 1
	puts "a at TP2: #{a}"
end
def incr!(a)
	puts "a at TP1: #{a}"
	a += 1
	puts "a at TP2: #{a}"
end


b=9
puts "b: #{b}"
incr b
puts "b: #{b}"

puts "b!: #{b}"
incr! b
puts "b!: #{b}"


c="daiFD"

def down1(str)
	puts "str at TP3: #{str}"
	str.downcase
	puts "str at TP4: #{str}"
end
def down2(str)
	puts "str at TP5: #{str}"
	str.downcase!
	puts "str at TP6: #{str}"
end
down1(c)
puts "1: " + c

down2(c)
puts "2: " + c



6.times do |gy|
puts "The number: #{gy} Of Type #{gy.class}"
end

----------------------------------------------------------------
=end

anArray = [1,"Silly",5.6]

ENV.each do |theItem|
	puts "Object: #{theItem} Of Type #{theItem.class}"
end