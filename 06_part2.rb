file = File.open("./06_part2.txt")
file_data = file.readlines.map(&:chomp)

chars = file_data[0].split('')
pocket_size = 14

result = 0
chars.each_with_index() do |char, i|
    pocket = chars[i..i+(pocket_size - 1)].uniq

    if pocket.length == pocket_size
        result = i + pocket_size
        break
    end
end

p result