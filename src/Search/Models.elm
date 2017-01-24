module Search.Models exposing (..)

import Ingredients.Models exposing (Ingredient)

type alias Model =
  { query : Query
  , focus : FocusBool
  }

type alias Query = String
type alias FocusBool = Bool
