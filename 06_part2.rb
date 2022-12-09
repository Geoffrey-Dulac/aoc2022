file = File.open("./06_part2.txt")
file_data = file.readlines.map(&:chomp)

chars = file_data[0].split('')

result = 0
chars.each_with_index() do |char, i|
    pocket = chars[i..i+13].uniq

    if pocket.length == 14
        result = i + 14
        break
    end
end

p result