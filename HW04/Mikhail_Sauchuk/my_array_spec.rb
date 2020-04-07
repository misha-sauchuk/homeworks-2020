# write specs for each of methods from my_array.rb usign RSpec

require 'rspec'
require_relative 'my_array.rb'

RSpec.describe Array do
  subject { described_class.new([1, 2, 3]) }

  describe '#my_each' do
    context 'if block was given' do
      it 'return values from array one by one' do
        expect do
          subject.my_each { |elem| puts elem }
        end.to output("1\n2\n3\n").to_stdout
      end
    end
    context 'if no block' do
      it 'retun initial array' do
        expect(subject.my_each).to eql([1, 2, 3])
      end
    end
  end
end

RSpec.describe Array do
  subject { described_class.new([1, 2, 3]) }
  describe '#my_map' do
    context 'if block was given' do
      it 'return updated array' do
        expect(subject.my_map { |elem| elem * 2 }).to eql([2, 4, 6])
      end
    end
    context 'if no block' do
      it 'retun empty array' do
        expect(subject.my_map).to eql([])
      end
    end
  end
end

RSpec.describe Array do
  subject { described_class.new([1, 2, 3]) }
  describe '#my_select' do
    context 'if block was given' do
      it 'return filtered array' do
        expect(subject.my_select { |elem| elem > 1 }).to eql([2, 3])
      end
    end
    context 'if no block' do
      it 'retun Enumerator object' do
        expect(subject.my_select).to be_an Enumerator
      end
    end
  end
end
