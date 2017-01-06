require "spec_helper"

RSpec.describe Hand do
  let(:hand) { Hand.new([ Card.new(10,"♦"),  Card.new("J","♥")]) }
  let(:second_hand) { Hand.new([ Card.new(3,"♦"),  Card.new("A","♥")]) }

  describe '.new' do
    it 'should have 2 cards' do
      expect(hand.cards.size).to eq(2)
    end
  end

  describe '#hit!' do
    it 'should have 3 cards' do
      hand.hit!(Card.new(10,"♦"))
      expect(hand.cards.size).to eq(3)
    end
  end

  describe 'calculate_hand' do
    it 'it should return 20 points for hand' do
      expect(hand.calculate_hand).to eq(20)
    end

    it 'it should return 14 points for second hand' do
      expect(second_hand.calculate_hand).to eq(14)
    end

    it 'it should return 13 points for second hand' do
      second_hand.hit!(Card.new(9,'♠'))
      expect(second_hand.calculate_hand).to eq(13)
    end
  end
end
