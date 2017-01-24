module Ingredients.Messages exposing (..)

import Http

import Ingredients.Models exposing (Ingredient, IngredientId, BackendIngredient)

type Msg
  = Toggle IngredientId
  | SearchIngredients String
  | FetchAllDone (Result Http.Error (List BackendIngredient))
