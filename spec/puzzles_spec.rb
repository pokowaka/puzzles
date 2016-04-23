require 'spec_helper'

module Puzzles
  describe 'getting n random elements from a very long list' do
    context 'verify that the distribution is sort of even' do
      let(:list) { (1..100) }
      let(:dist) { d = {}; list.map { |x| d[x] = 0 }; d }
      let(:elems) { 5 }
      let(:iters) { 30_000 }
      subject do
        iters.times do
          Puzzles.random_infinite_list(list, elems).each { |x| dist[x] = dist[x] + 1 }
        end
        dist.map { |_k, v| v.to_f / (iters * elems) }
      end
      it { is_expected.to all(be_within(1.0 / (list.size * 10)).of(1.0 / list.size)) }
    end
  end
end
