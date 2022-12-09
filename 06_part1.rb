file = File.open("./06_part1.txt")
file_data = file.readlines.map(&:chomp)

chars = file_data[0].split('')

result = 0
chars.each_with_index() do |char, i|
    pocket = chars[i..i+3].uniq

    if pocket.length == 4
        result = i + 4
        break
    end
end

p result