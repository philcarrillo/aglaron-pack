puts "Test Program t.rb"

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

a = :on
puts a.class

if a == :one
	puts "TP01 #{a}"
	puts "a is :one"
elsif a == :two

	puts "TP02 #{a}"
	puts "a is :two"
else
	puts "TP03 #{a}"
	puts "we don't know what a is"

end


a = 7
b = 0
c = 0

a != b || c = 77

 puts "Yep #{c}"
