module Messages exposing (..)

import Ingredients.Messages
import Drinks.Messages

type Msg
  = IngredientsMsg Ingredients.Messages.Msg
  | DrinkMsg Drinks.Messages.Msg
