file = File.open("./08_part1.txt")
file_data = file.readlines.map(&:chomp)

file_data_splited = file_data.map { |str| str.split('') }
counter_visible_trees = 0

def is_visible(index, row)
    before = row[0..index - 1]
    after = row[index + 1..-1]

    are_before_all_lower = true
    before.each do |tree|
        if tree >= row[index]
            are_before_all_lower = false
        end
    end

    are_after_all_lower = true
    after.each do |tree|
        if tree >= row[index]
            are_after_all_lower = false
        end
    end

    return are_before_all_lower || are_after_all_lower
end

file_data_splited.each_with_index do |row, row_index|
    if row_index == 0 || (file_data_splited.count == row_index + 1)
        # first and last row always visible
        counter_visible_trees += row.count
    else
        # row sides are always visible
        counter_visible_trees += 2
        row.each_with_index do |tree, index|
            unless index == 0 || row.count == index + 1 
                column_trees = file_data_splited.map{|row| row[index].to_i}
                row_trees = row.map{|tree| tree.to_i}
                if is_visible(row_index, column_trees) || is_visible(index, row_trees)
                    counter_visible_trees += 1           
                end
            end
        end
    end
end

p counter_visible_trees