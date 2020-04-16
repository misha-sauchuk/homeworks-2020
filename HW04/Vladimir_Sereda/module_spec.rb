require_relative 'module.rb'
# rubocop:disable Metrics/BlockLength

describe Array do
  describe '#for_each' do
    subject { described_class.new([1, 2, 3, 4, 5]) }

    context 'when given array [1,2,3,4,5]' do
      it 'return values from array [1,2,3,4,5]' do
        expect do
          subject.for_each { |elem| puts elem }
        end.to output("1\n2\n3\n4\n5\n").to_stdout
      end
    end

    describe '#for_map' do
      subject { described_class.new([1, 2, 3, 4, 5]) }

      context 'when given array [1,2,3,4,5]' do
        it 'return  [2,4,6,8,10]' do
          expect(subject.for_map { |elem| elem * 2 }).to
          match_array [2, 4, 6, 8, 10]
        end
      end
    end
  end

  describe '#for_select' do
    subject { described_class.new([1, 2, 3, 4, 5]) }

    context 'when given array [1,2,3,4,5]' do
      it 'return an array of numbers [1,2,3]' do
        expect(subject.for_select { |elem| elem < 4 }).to
        match_array[1, 2, 3]
      end
    end
  end
end
# rubocop:enable  Metrics/BlockLength
