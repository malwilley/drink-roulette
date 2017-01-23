module Search.Models exposing (..)

import Ingredients.Models exposing (Ingredient)

type alias Model =
  { options : IngredientOptions
  , query : Query
  , focus : FocusBool
  }

type alias IngredientOptions = List Ingredient
type alias Query = String
type alias FocusBool = Bool
