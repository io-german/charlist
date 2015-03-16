class CharacterClass
  constructor: (@title, @hpPerLevel, @hpAtFirstBase, @healingSurgesPerDayBase, @defences) ->

window.characterClasses = {
  cleric: new CharacterClass('Cleric', 5, 12, 7, {'will': 2}),
  fighter: new CharacterClass('Fighter', 6, 15, 9, {'fortitude': 2}),
  paladin: new CharacterClass('Paladin', 6, 15, 10, {'fortitude': 1, 'reflex': 1, 'will': 1}),
  ranger: new CharacterClass('Ranger', 5, 12, 6, {'fortitude': 1, 'reflex': 1}),
  rogue: new CharacterClass('Rogue', 5, 12, 6, {'reflex': 2}),
  warlock: new CharacterClass('Warlock', 5, 12, 6, {'reflex': 1, 'will': 1}),
  warlord: new CharacterClass('Warlord', 5, 12, 7, {'fortitude': 1, 'will': 1}),
  wizard: new CharacterClass('Wizard', 4, 10, 6, {'will': 2}),
}

