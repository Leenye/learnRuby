inputs = File.open("filename.txt").read
input = inputs.split("\n")
roma_hash = Hash.new
addition_hash = Hash.new 
question_hash = Hash.new
DIGITS = {
	"I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "D" => 500,
    "M" => 1000
}

reg_exp = /^M*(D?C{0,3}|C[DM])(L?X{0,3}|X[LC])(V?I{0,3}|I[VX])$/i

def get_roma(roma_string)
  roma_string.each { |i|
	former = 0
	if reg_exp.match(i)
		result = i.to_s.reverse.split(//).inject(0) do |sum, roma|  #sum是返回值，所以这里令result等于sum
			if roma_value = DIGITS[roma]
				# if former && former > roma_value
				# 	sum -= roma_value
				# else
				# 	sum += roma_value
				# end
				sum -= (former <=> roma_value) * roma_value
				former = roma_value

			end
			sum  #这里sum是个返回值，ruby中返回值可以省略return
		end	
		#puts result
	elsif 
		puts"The #{i} is not a valid roma number"			
	end
   }
end



input.each{ |i|
	roma_hash[i.split(" ")[0]] =  i.split(" ")[2] if /\A[\w]+\sis\s[IVXLDM]\z/.match(i) 
}

puts roma_hash

reg_exp2 = /how much is [\w\s] ?/i#问号跟在字符后才是特殊字符，跟在空格后面就不是特殊字符
reg_exp3 = /how many Credits is [\w\s] ?/i


input.each { |p|
	if reg_exp2.match(p) || reg_exp3.match(p)
		addition_hash[p] = []
		p.split(" ").each { |word|
		    addition_hash[p].push(roma_hash[word]) if roma_hash.has_key?(word)			

		}
		addition_hash[p]
	end
}
puts "********"
puts addition_hash

=begin
addition = []
reg_exp2 = /(how much is [\w\s]\?)|(how many Credits is [\w\s]\?)$/i
input.map { |i|
	if reg_exp2.match(i)
		puts i
		i.split(" ").select { |word|
			if roma_string.include(i)
				addition.push(roma_hash[i])
			end
	    }
	    puts addition

    end
}
=end


#reg_exp2 = /[\w\s]+[IVXLDM]+[\w\s]\?$/
reg_exp2 = /[\w\s]+[IVXLDM]+[\w\s]\?$/


#input.each{ |i| 
#	roma_hash.each{ |k,v| 	i.gsub!(/#{k}/,v) } 
#}

=begin

if /\A[\w]+\sis\s[IVXL]\z/.match(i) 
	    roma_hash[i.split(" ")[0]] =  roma[i.split(" ")[2]]
	elsif /\A[\w\s]+(Silver|Iron|Gold)+\sis\s\d+\sCredits/.match(i) 
		roma_hash.each{|k,v| i.gsub(/#{k}/,v.to_s)}
	elsif /\Ahow\s("much"|"many")[\w\s]is\s[\w\s]\?/.match(i)
	    roma_hash.each{|k,v| i.gsub!(/#{k}/,v)}
end
=end
