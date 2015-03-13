class window.AbilityScore
  constructor: (@value = 10) ->
  modifier: () -> Math.floor((@value - 10) / 2)


class window.Skill
  constructor: (@name, @ability, @value = 0, @trained = false) ->

class window.DndCharacter
  constructor: (@charName, @characterClass, @race) ->

  level: 1
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

  abilityValue: (abilityName) ->
    ability = @abilityScores[abilityName]
    racialBonus = @race.abilityScoreBonus[abilityName] || 0
    new AbilityScore(ability.value + racialBonus)

  skillValue: (skillName) ->
    skill = @skills[skillName]
    ability = @abilityValue(skill.ability)
    trainedPoints = if skill.trained then 4 else 0
    abilityPoints = ability.modifier()
    levelPoints = Math.floor(@level / 2)
    racialBonus = @race.skillBonus[skillName] || 0
    trainedPoints + abilityPoints + levelPoints + racialBonus
