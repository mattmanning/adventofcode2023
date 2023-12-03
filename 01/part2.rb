require 'strscan'

def numberize(s)
	case s
	when 'one'
		1
	when 'two'
		2
	when 'three'
		3
	when 'four'
		4
	when 'five'
		5
	when 'six'
		6
	when 'seven'
		7
	when 'eight'
		8
	when 'nine'
		9
	else
		s.to_i
	end
end

total = File.foreach('input').inject(0) do |sum, line|
	arr = []
	s = StringScanner.new(line)
	while !s.eos? do
		r = s.scan /[0-9]|one|two|three|four|five|six|seven|eight|nine|ten/
		if r.nil?
			s.pos = s.pos + 1
		else
			arr.push r
			s.pos = s.pos - 1 unless r.length == 1
		end
	end
	n = "#{numberize(arr[0])}#{numberize(arr[-1])}".to_i
	sum + n
end

puts total
