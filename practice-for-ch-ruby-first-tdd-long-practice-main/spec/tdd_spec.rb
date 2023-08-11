require "tdd"

describe "#my_uniq" do
    it "removes duplicates from an array" do
        expect(my_uniq([1, 2, 1, 3, 3])).to eq([1, 2, 3])
    end
end


describe Array do
    describe '#two_sum' do
        it "Should return index of pairs with sum of 0" do
            a = [-1,0,2,-2,1]
            expect(a.two_sum).to eq([[0, 4], [2, 3]])
        end

        it "Should return [] if no pair is found" do
            a = [1,2,3,4,5]
            expect(a.two_sum).to eq([])
        end
    end
end

describe '#my_trasnpose' do
    it 'Should return a transposed Matrix' do
        mat = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
          ]
        # res_mat = [
        #     [0, 3, 6],
        #     [1, 4, 7],
        #     [2, 5, 8]
        #   ]

        expect(my_transpose(mat)).to eq(mat.transpose)
    end
end

describe '#stock_picker' do
    it 'Should return largest profit'do
        a = [2,4,8]
        expect(stock_picker(a)).to eq([0,2])
    end

    it 'Should account for lower number past largest number' do
        a = [4,8,2]
        expect(stock_picker(a)).to eq([0,1])
    end

    it 'Should account for always decreasing array' do
        a = [7,5,2]
        expect(stock_picker(a)).to eq([0,0])
    end
end

describe Hanoi do
    subject(:hanoi) {Hanoi.new(3)}
    let(:won?) {double("win", hboard: [[],[1],[2,0]])}

    describe '#initialize' do
        it 'assigns board' do
            expect(hanoi.board).to eq([[2, 1, 0], [], []])
        end

        it 'right and middle should be empty' do
            expect(hanoi.board[1]).to eq([])
            expect(hanoi.board[2]).to eq([])
        end
    end

    describe '#move' do
        it 'should move top disk to different rod' do
            m = Hanoi.new(3) #[[2,1], [0], []]
            m.move(0, 1)
            expect(m.board[0].size).to eq(2)
            expect(m.board[1].size).to eq(1)
        end

        it 'should raise error if invalid move' do
            m = Hanoi.new(3)
            m.move(0, 1)
            expect(m.board[0].size).to eq(2)
            expect(m.board[1].size).to eq(1)
            expect {m.move(0, 1)}.to raise_error("Invalid Move")
        end

        it 'raise error if stack empty' do
            m = Hanoi.new(3)
            expect{m.move(1, 2)}.to raise_error("Invalid Move")
        end
    end

    describe '#won?' do
        it 'return true when won' do
            #allow(won?).to receive(:hboard).and_return(true)
            hanoi.move(0,1)
            hanoi.move(0,2)
            hanoi.move(1,0)
            hanoi.move(2,1)
            hanoi.move(0,1)
            hanoi.move(0, 2)
            hanoi.move(1,0)
            hanoi.move(1, 2)
            hanoi.move(0,2)
            expect(hanoi.won?).to eq(true)
        end

        it 'return false when not won' do
            expect(hanoi.won?).to eq(false)
        end
    end
end
