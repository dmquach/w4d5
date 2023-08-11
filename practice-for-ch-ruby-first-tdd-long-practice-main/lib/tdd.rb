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

    attr_reader
    def initialize(size)
        @left = (0..size).to_a.reverse # array from size - 0
        @right = []
        @middle = []
    end
end