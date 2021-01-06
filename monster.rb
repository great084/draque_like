class Monster < Character
  def initialize(name:, hp:, offense:, defense:)
    super
    puts "#{name} が現れた！！"
  end
end
