total = File.foreach('input').inject(0) do |sum, line|
  str = line.delete('^0-9')
  sum + "#{str[0]}#{str[-1]}".to_i
end

puts total