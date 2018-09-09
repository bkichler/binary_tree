require 'spec_helper'

RSpec.describe BTreeSort, type: :model do
  describe 'btree sort should work' do
    it 'should order the array' do
      expected = [1, 4, 6, 7, 9, 10, 14]
      array = [7, 4, 9, 1, 6, 14, 10]
      sorter = BTreeSort.new(array)
      sorter.build_tree(sorter.tree)
      sorted_ary = sorter.tree_sort(sorter.tree)
      expect(sorted_ary).to eq expected
    end
  end
end