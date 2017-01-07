module Models exposing (..)

import Ingredients.Models exposing (Ingredient)
import Search.Models exposing (SearchTerm)
import Drinks.Models

type alias Model =
  { ingredients : List Ingredient
  , searchTerm : SearchTerm
  , currentDrink : Drinks.Models.Model
  }
