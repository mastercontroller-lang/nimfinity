# src/pokemon_types.nim
# Pokémon Type Effectiveness Module

# Define Pokémon types
type Type = enum
  Normal, Fire, Water, Grass, Electric, Ice, Fighting, Poison, Ground, Flying,
  Psychic, Bug, Rock, Ghost, Dragon, Dark, Steel, Fairy

# Type Effectiveness Lookup Table
let typeChart: array[Type, array[Type, float]] = [
  #               Nor  Fir  Wat  Gra  Ele  Ice  Fig  Poi  Gro  Fly  Psy  Bug  Roc  Gho  Dra  Dar  Ste  Fai
  Normal:      [ 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.5, 0.0, 1.0, 1.0, 0.5, 1.0 ],
  Fire:        [ 1.0, 0.5, 0.5, 2.0, 1.0, 2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 0.5, 1.0, 0.5, 1.0, 2.0, 1.0 ],
  Water:       [ 1.0, 2.0, 0.5, 0.5, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 1.0, 2.0, 1.0, 0.5, 1.0, 1.0, 1.0 ],
  Electric:    [ 1.0, 1.0, 2.0, 0.5, 0.5, 1.0, 1.0, 1.0, 0.0, 2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0 ],
  Ghost:       [ 0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 1.0, 1.0 ]
]

# Function to get type effectiveness
proc getTypeEffectiveness(moveType, targetType1, targetType2: Type): float =
  var multiplier = typeChart[moveType][targetType1]
  
  if targetType2 != Normal:  # If Pokémon has a second type
    multiplier *= typeChart[moveType][targetType2]

  return multiplier
