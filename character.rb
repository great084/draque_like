class Character
  attr_reader :name, :offense, :defense
  attr_accessor :hp

  def initialize(name:, hp:, offense:, defense:)
    @name = name
    @hp = hp
    @offense = offense
    @defense = defense
  end

  def attack(opponent)
    puts "#{@name}の攻撃!!"
    damage = @offense - opponent.defense / 2
    puts "#{opponent.name}に#{damage} のダメージを与えた!!"
    opponent.hp = damage > opponent.hp ? 0 : opponent.hp - damage
  end
end
