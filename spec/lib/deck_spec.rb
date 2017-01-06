require "spec_helper"

RSpec.describe Deck do
  let(:deck) { Deck.new }

  describe '#build_deck' do
    it 'should build a deck of 52 cards' do
      expect(deck.cards.size).to eq(52)
    end

    it "creates unique cards" do
      expect(deck.cards.uniq.size).to eq 52
    end
  end

  describe "#deal" do
    it "removes correct number of cards" do
      start_size = deck.cards.size
      finish_size = start_size - 2

      deck.deal(2)

      expect(deck.cards.size).to eq finish_size
    end

    it "deals the top card in the deck" do
      correct_card = deck.cards[-1]
      expect(deck.deal(1)).to eq [correct_card]
    end
  end
end
