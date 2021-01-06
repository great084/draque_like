require 'pry-byebug'

class Character
  attr_reader :name, :hp, :offense, :defense
  attr_writer :hp

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

class Brave < Character
end

class Monster < Character
  def initialize(name:, hp:, offense:, defense:)
    super
    puts "#{name} が現れた！！"
  end
end

class Battle
  Monster_list = [
    {name: "スライム", hp: 100, offense: 10, defense: 10},
    {name: "はぐれメタル", hp: 200, offense: 20, defense: 80},
    {name: "キメラ", hp: 150, offense: 50, defense: 30},
    {name: "ゴーレム", hp: 500, offense: 10, defense: 50},
  ]


  def initialize
    @brave = Brave.new(name: "ゆうしゃ", hp: 100, offense: 50, defense: 10)
    @monster = Monster.new(Monster_list.sample)
  end
  
  def start
    while battle_continue? do
      print_status
      sleep(1.5)
      @brave.attack(@monster)
      break unless battle_continue?
      @monster.attack(@brave)
    end
    print_status
    judge
  end
  
  def print_status
    puts "*="*10
    puts "#{@brave.name} のhp: #{@brave.hp}"
    puts "#{@monster.name} のhp: #{@monster.hp}"
    puts "*="*10
    puts "\n"
  end

  def battle_continue?
    @brave.hp > 0 && @monster.hp > 0
  end

  def judge
    if @brave.hp > 0 
      puts "#{@monster.name}をやっつけた！(^0^)"
    else
      puts "#{@brave.name} はしんでしまった!！orz"
    end
  end
end

Battle.new.start