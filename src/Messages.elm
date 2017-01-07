module Messages exposing (..)

import Ingredients.Messages
import Search.Messages
import Drinks.Messages

type Msg
  = IngredientsMsg Ingredients.Messages.Msg
  | SearchMsg Search.Messages.Msg
  | DrinkMsg Drinks.Messages.Msg
