require "spec_helper"

RSpec.describe Card do
  describe '.new' do
    card = Card.new("1","♦")
    it 'should take two arguments' do
      expect(card).to be_a(Card)
    end

    it 'should have a reader for card' do
      expect(card.card).to eq("1♦")
    end

    it 'should have a reader for type of card' do
      expect(card.type).to eq("")
    end
  end

  let(:card) { Card.new("1","♦") }
  let(:card_two) { Card.new("J","♠") }
  let(:card_three) { Card.new("A","♣") }

  describe '#type_of_card' do
    it 'should return what type of card it is' do
      expect(card.type_of_card).to eq("value")
      expect(card_two.type_of_card).to eq("face")
      expect(card_three.type_of_card).to eq("ace")
    end
  end
end
