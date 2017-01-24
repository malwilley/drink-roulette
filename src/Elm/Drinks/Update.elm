module Drinks.Update exposing (..)

import Ingredients.Models exposing (IngredientId)
import Drinks.Models exposing (Model(..), DrinkContentsBackend, BackendDrink, Drink, IngredientProportion, DrinkSize(..))
import Drinks.Messages exposing (Msg(..))
import Drinks.Commands exposing (getDrink)
import Drinks.DrinkSvg exposing (..)

import Ingredients.Update exposing (backendIngredientToIngredient)

update : Msg -> Model -> List IngredientId -> ( Model, Cmd Msg )
update msg model ids =
  case msg of
    MakeDrink ->
      ( model, getDrink ids )
    FetchDrinkDone (Ok drink) ->
      ( convertToDrink drink, display (List.map (\i -> i.fraction) drink.contents) )
    FetchDrinkDone (Err _) ->
      ( Error "Error retrieving drink info from server", Cmd.none )

-- Converts the drink type created from the backend to the normal drink type
-- If there are any invalid parts, returns Nothing
convertToDrink : BackendDrink -> Model
convertToDrink backendDrink =
  let
    proportions = List.map convertToIngredientProportion backendDrink.contents
    drinkSize = intToDrinkSize backendDrink.size
  in
    if List.any (\p -> p == Nothing) proportions then Error "Error parsing drink contents"
    else
      case drinkSize of
        Just drinkSize ->
          Success
          { name = backendDrink.name
          , ingredients = List.filterMap (\p -> p) proportions
          , size = drinkSize
          }
        Nothing -> Error "Error parsing drink size"

convertToIngredientProportion : DrinkContentsBackend -> Maybe IngredientProportion
convertToIngredientProportion contentsBackend =
  let ingredient = backendIngredientToIngredient contentsBackend.ingredient
  in
    case ingredient of
      Just ingredient ->
        Just
        { ingredient = ingredient
        , proportion = contentsBackend.fraction
        }
      Nothing -> Nothing

intToDrinkSize : Int -> Maybe DrinkSize
intToDrinkSize num =
  case num of
    0 -> Just Shot
    1 -> Just Pint
    2 -> Just Cup
    3 -> Just Buttchug
    _ -> Nothing
