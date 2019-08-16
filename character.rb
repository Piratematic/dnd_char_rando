require_relative "race"
require_relative "align"
require_relative "class"

class Character
  def initialize
    lawful_good = Alignment.new 'Lawful Good', 10
    good = Alignment.new 'Good', 20
    chaotic_good = Alignment.new 'Chaotic Good', 10
    lawful_neutral = Alignment.new 'Lawful Neutral', 20
    neutral = Alignment.new 'Neutral', 20
    chaotic_neutral = Alignment.new 'Chaotic Neutral', 8
    lawful_evil = Alignment.new 'Lawful Evil', 5
    evil = Alignment.new 'Evil', 3
    chaotic_evil = Alignment.new 'Chaotic Evil', 1
    @alignments = find_alignment [lawful_good, good, chaotic_good, lawful_neutral, neutral, chaotic_neutral, lawful_evil, evil, chaotic_evil]
    barbarian = Classes.new 'Barbarian', 8
    bard = Classes.new 'Bard', 8
    cleric = Classes.new 'Cleric', 8
    druid = Classes.new 'Druid', 8
    fighter = Classes.new 'Fighter', 8
    monk = Classes.new 'Monk', 8
    paladin = Classes.new 'Paladin', 8
    ranger = Classes.new 'Ranger', 8
    rogue = Classes.new 'Rogue', 8
    sorcerer = Classes.new 'Sorcerer', 8
    warlock = Classes.new 'Warlock', 8
    wizard = Classes.new 'Wizard', 8
    normie = Classes.new 'Normal', 0
    royal = Classes.new 'Royalty', 0
    @character_class = character_class [barbarian, bard, cleric, druid, fighter, monk, paladin, ranger, rogue, sorcerer, warlock, wizard, normie, royal]
    dwarf = Race.new 'Dwarf', 11
    elf = Race.new 'Elf', 11
    human = Race.new 'Human', 11
    half_orc = Race.new 'Half Orc', 11
    half_elf = Race.new 'Half Elf', 11
    halfling = Race.new 'Halfling', 11
    gnome = Race.new 'Gnome', 11
    tiefling = Race.new 'Tiefling', 11
    dragonborn = Race.new 'Dragonborn', 11
    @race = find_race [dwarf, elf, human, half_orc, half_elf, halfling, gnome, tiefling, dragonborn]
    @str = calculate_stats
    @dex = calculate_stats
    @con = calculate_stats
    @wis = calculate_stats
    @int = calculate_stats
    @cha = calculate_stats
  end

  def print_character_sheet
    puts "Character Class: #{@character_class}"
    puts "Race: #{@race}"
    puts "Alignment: #{@alignments}"
    puts "Stregnth: #{@str}"
    puts "Dexterity: #{@dex}"
    puts "Constitution: #{@con}"
    puts "Wisdom: #{@wis}"
    puts "Inteligence: #{@int}"
    puts "Charisma: #{@cha}"
  end

def find_race (races)
  total = 0
  weighted_races = races.each do |race|
  race.weight = race.weight + total
  total = race.weight
  race
end
  percentage = rand(1..total)
  weighted_races.each do |race|
    return race.name if percentage <= race.weight
  end
end

  # CE 1% E 3% LE 5% CN 8% CG 10% LG 18% G 18% LN 18% N 19%
def find_alignment (alignment)
  total = 0
  weighted_alignment = alignment.each do |alignment|
    alignment.weight = alignment.weight + total
    total = alignment.weight
    alignment
  end
  percentage = rand(1..total)
  weighted_alignment.each do |alignment|
    return alignment.name if percentage <= alignment.weight
  end
end

def character_class (classes)
  total = 0
  weighted_classes = classes.each do |classes|
    classes.weight = classes.weight + total
    total = classes.weight
    classes
  end
  percentage = rand(1..total)
  weighted_classes.each do |classes|
    return classes.name if percentage <= classes.weight
  end
end

  def calculate_stats
    stats = []
    (1..4).each do
      stats << rand(1..6)
    end
    lowest = stats.min
    stats.delete_at(stats.index(lowest))
    sum = 0 
    stats.each { |stat| sum += stat }
    sum
  end
end

tim = Character.new
tim.print_character_sheet