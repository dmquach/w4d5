def my_uniq(arr)
    hash = Hash.new(0)
    arr.each do |ele|
        hash[ele] += 1
    end

    hash.keys

end


class Array

    def two_sum
        arr =[]
        self.each.with_index do |ele1, ind1|
            self.each.with_index do |ele2, ind2|
                if ind1 < ind2
                    arr << [ind1,ind2] if ele1 + ele2 == 0
                end
            end
        end
        arr
    end
end

def my_transpose(matrix)
    arr = Array.new(matrix.size){Array.new([])}
    matrix.each do |ele1|
        ele1.each_with_index do |ele2 , ind|
            arr[ind] << ele2
        end
    end
    arr
end

def stock_picker(arr)
    res = [0,0]
    profit = 0
    (0...arr.length).each do |ele|
        (ele+1...arr.length).each do |i|
            if arr[i] - arr[ele] >= profit
                profit = arr[i] - arr[ele]
                res = [ele, i]
            end
        end
    end
    res
end

class Hanoi

    attr_reader :board
    def initialize(size)
        @size = size
        @board = [(0...size).to_a.reverse, [], []] # array from size - 0
    end

    def move(initial_pos, end_pos) #0 = left, 1 = middle, 2 = right
        raise "Invalid Move" if invalid?(initial_pos, end_pos)
        holder = board[initial_pos].pop
        board[end_pos] << holder
    end

    def invalid?(start_pos, end_pos)
        return true if board[start_pos].empty?
        return board[end_pos].last < board[start_pos].last unless board[end_pos].empty?
        false
    end

    def won? #hboard
        return false if board[0].length != 0 || board[1].length != 0
        return false if board[2].length != @size
        p board
        true
    end

    def play
        while !won?
            puts "input start val, end val"
            val = gets.chomp
            s, e = val.split(",")
            self.move(s.to_i, e.to_i)
            p " #{board[0]}, #{board[1]}, #{board[2]}"
        end
        puts 'game over'
    end
end

# h = Hanoi.new(3)
# h.play
