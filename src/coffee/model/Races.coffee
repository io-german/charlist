class Race
  constructor: (@name, @speed, @languages, @abilityScoreBonus = {}, @skillBonus = {}) ->

window.races = {
  dragonborn: new Race('Dragonborn', 6, ['Common', 'Draconic'], { strength: 2, charisma: 2 }, {history: 2, intimidate: 2}),
  dwarf: new Race('Dwarf', 5, ['Common', 'Dwarven'], {constitution: 2, wisdom: 2}, {dungeoneering: 2, endurance: 2}),
  eladrin: new Race('Eladrin', 6, ['Common', 'Elven'], {dexterity: 2, intelligence: 2}, {arcana: 2, history: 2}),
  elf: new Race('Elf', 7, ['Common', 'Elven'], {dexterity: 2, wisdom: 2}, {nature: 2, perception: 2}),
  halfElf: new Race('Half Elf', 6, ['Common', 'Elven'], {constitution: 2, charisma: 2}, {diplomacy: 2, insight: 2}),
  halfling: new Race('Halfling', 6, ['Common'], {dexterity: 2, charisma: 2}, {acrobatics: 2, thievery: 2}),
  human: new Race('Human', 6, ['Common'], {}, {}),
  tiefling: new Race('Tiefling', 6, ['Common'], {intelligence: 2, charisma: 2}, {bluff: 2, stealth: 2})

}