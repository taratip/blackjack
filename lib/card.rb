class Card
  VALUE_CARDS = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
  FACE_CARDS = ["J", "Q", "K"]

  attr_reader :card, :type

  def initialize(rank, suit)
    @card = "#{rank}#{suit}"
    @type = ""
  end

  def type_of_card
    values = card.split('')
    rank = values[0..-2].join('')
    if VALUE_CARDS.include?(rank)
      @type = "value"
    elsif FACE_CARDS.include?(rank)
      @type = "face"
    else
      @type = "ace"
    end
    @type
  end
end
