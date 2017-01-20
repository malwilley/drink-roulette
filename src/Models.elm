module Models exposing (..)

import Ingredients.Models exposing (Ingredient)
import Search.Models
import Drinks.Models

type alias Model =
  { ingredients : List Ingredient
  , search : Search.Models.Model
  , currentDrink : Drinks.Models.Model
  }
