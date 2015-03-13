class CharacterClass
  constructor: (@title, @hpPerLevel, @hpAtFirstBase, @healingSurgesPerDayBase) ->

window.characterClasses = {
  cleric: new CharacterClass('Cleric', 5, 12, 7),
  fighter: new CharacterClass('Fighter', 6, 15, 9),
  paladin: new CharacterClass('Paladin', 6, 15, 10),
  ranger: new CharacterClass('Ranger', 5, 12, 6),
  rogue: new CharacterClass('Rogue', 5, 12, 6),
  warlock: new CharacterClass('Warlock', 5, 12, 6),
  warlord: new CharacterClass('Warlord', 5, 12, 7),
  wizard: new CharacterClass('Wizard', 4, 10, 6),
}

