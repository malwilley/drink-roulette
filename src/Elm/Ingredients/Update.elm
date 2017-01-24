module Ingredients.Update exposing (..)

import Ingredients.Models exposing (Ingredient, IngredientId, Category(..), BackendIngredient)
import Ingredients.Messages exposing (Msg(..))
import String exposing (..)

update : Msg -> List Ingredient -> ( List Ingredient, Cmd Msg )
update msg ingredients  =
  case msg of
    Toggle ingredientId ->
      ( List.map (toggleItem ingredientId) ingredients, Cmd.none )
    SearchIngredients searchTerm ->
      ( List.filter
      ( \i -> String.isEmpty searchTerm || i.selected ||
        String.contains searchTerm i.name )
      ingredients, Cmd.none  )
    FetchAllDone (Ok newIngredients) ->
      ( List.filterMap backendIngredientToIngredient newIngredients, Cmd.none )
    FetchAllDone (Err _) ->
      ( ingredients, Cmd.none )

backendIngredientToIngredient : BackendIngredient -> Maybe Ingredient
backendIngredientToIngredient backendIngredient =
  let cat = intToCategory backendIngredient.category
  in
    case cat of
      Just cat ->
        Just
        { id = backendIngredient.id
        , name = backendIngredient.name
        , category = cat
        , selected = False
        }
      Nothing -> Nothing

intToCategory : Int -> Maybe Category
intToCategory num =
  case num of
    0 -> Just Alcohol
    1 -> Just Mixer
    2 -> Just Other
    _ -> Nothing

toggleItem : IngredientId -> Ingredient -> Ingredient
toggleItem ingredientId ingredient =
  if  ingredient.id == ingredientId then
    { ingredient | selected = not ingredient.selected }
  else
    ingredient
