class Hand
  attr_accessor :cards
  attr_reader :score

  def initialize(cards)
    @cards = cards
  end

  def hit!(card)
    @cards.push(card)
  end

  def calculate_hand
    @score = 0
    ace_cards = []
    @cards.each do |card|
      if card.type_of_card == "face"
        @score += 10
      elsif card.type_of_card == "value"
        @score += get_value(card)
      else
        ace_cards << card
      end
    end

    if ace_cards.size > 0
      ace_cards.each do |ace_card|
        if @score + 11 > 21
          @score += 1
        else
          @score += 11
        end
      end
    end
    @score
  end

  def get_value(card)
    values = card.card.split('')
    rank = values[0..-2].join('')
    rank.to_i
  end
end
