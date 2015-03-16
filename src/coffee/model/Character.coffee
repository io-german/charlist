class window.AbilityScore
  constructor: (@value = 10) ->
  modifier: () -> Math.floor((@value - 10) / 2)


class window.Skill
  constructor: (@name, @ability, @value = 0, @trained = false) ->

class window.DndCharacter
  constructor: (@charName, @characterClass, @race) ->

  level: 1

  levelBonus: () -> Math.floor(@level / 2)

  abilityScores: {
    strength: new AbilityScore,
    constitution: new AbilityScore,
    dexterity: new AbilityScore,
    intelligence: new AbilityScore,
    wisdom: new AbilityScore,
    charisma: new AbilityScore
  }

  skills: {
    acrobatics: new Skill('Acrobatics', 'dexterity')
    arcana: new Skill('Arcana', 'intelligence')
    athletics: new Skill('Athletics', 'strength')
    bluff: new Skill('Bluff', 'charisma')
    diplomacy: new Skill('Diplomacy', 'charisma')
    dungeoneering: new Skill('Dungeoneering', 'wisdom')
    endurance: new Skill('Endurance', 'constitution')
    heal: new Skill('Heal', 'wisdom')
    history: new Skill('History', 'intelligence')
    insight: new Skill('Insight', 'wisdom')
    intimidate: new Skill('Intimidate', 'charisma')
    nature: new Skill('Nature', 'wisdom')
    perception: new Skill('Perception', 'wisdom')
    religion: new Skill('Religion', 'intelligence')
    stealth: new Skill('Stealth', 'dexterity')
    streetwise: new Skill('Streetwise', 'charisma')
    thievery: new Skill('thievery', 'dexterity')
  }

  defences: () -> {
    self: this
    ac: () ->
      armorBonus = 0
      abilityBonus  = @highestModifier(['dexterity', 'intelligence'])
      classBonus = 0
      featBonus = 0
      enhancementBonus = 0
      10 + @self.levelBonus() + armorBonus + abilityBonus + classBonus + featBonus + enhancementBonus

    fortitude: () -> 10
    reflex: () -> 10
    willpower: () -> 10

    highestModifier: (abilities) ->
      modifiers = (@self.abilityScores[ability].modifier() for ability in abilities)
      Math.max.apply(Math, modifiers)
  }


  abilityValue: (abilityName) ->
    ability = @abilityScores[abilityName]
    racialBonus = @race.abilityScoreBonus[abilityName] || 0
    new AbilityScore(ability.value + racialBonus)

  skillValue: (skillName) ->
    skill = @skills[skillName]
    ability = @abilityValue(skill.ability)
    trainedPoints = if skill.trained then 5 else 0
    abilityPoints = ability.modifier()
    racialBonus = @race.skillBonus[skillName] || 0
    trainedPoints + abilityPoints + @levelBonus() + racialBonus
