module Drinks.Commands exposing (..)

import String
import Http
import Json.Decode as Decode exposing (..)
import Ingredients.Models exposing (IngredientId)
import Ingredients.Commands exposing (ingredientDecoder)
import Drinks.Messages exposing (..)
import Drinks.Models exposing (BackendDrink, DrinkContentsBackend)

getDrink : List IngredientId -> Cmd Msg
getDrink ids =
  Http.get (drinkUrl ids) drinkDecoder
    |> Http.send FetchDrinkDone

drinkUrl : (List Int) -> String
drinkUrl ids =
    "http://ryanpeaseisabitch.herokuapp.com/makedrink/" ++ (String.join "-" (List.map toString ids))

drinkDecoder : Decoder BackendDrink
drinkDecoder =
  map3 BackendDrink
    (field "Name" string)
    (field "Contents" contentsListDecoder)
    (field "Size" int)

contentsListDecoder : Decoder (List DrinkContentsBackend)
contentsListDecoder = list contentsDecoder

contentsDecoder : Decoder DrinkContentsBackend
contentsDecoder =
  map2 DrinkContentsBackend
    (field "Ingredient" ingredientDecoder)
    (field "Fraction" float)
