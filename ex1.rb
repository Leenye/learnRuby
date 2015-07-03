s = "Ruby is an object oriented programming language"
t = s.length

a = []
i = 0
while i<t do 
	a << s[i]
	i += 1
end
puts a.inspect 
puts "***********"
b = a.sort
puts b.inspect
puts "***********"
c = a.sort_by{|x| x.downcase}
puts c.inspect
puts "***********"
x = s.split(" ")
#y = x.each{|n| n.capitalize}
string2 = " "
x.each do |info|
	#puts info.capitalize
	string2 += (info.capitalize.to_s).insert(0," ")
	#string2 += info.capitalize.to_s + "\s"
end 
puts x.map(&:capitalize).join(' ')
puts "***********"
puts string2

e = []
a.each do |ch|
	if !e.include?(ch)
		e.push(ch)
	end
end 

#puts e 
#puts "***********"
#e.push(" ")s

puts "' ' : #{s.scan(" ").length}"
e.each do |countcha|
		puts "'#{countcha} ': #{s.scan((countcha.to_s)).length}" 
end


e = a.uniq
