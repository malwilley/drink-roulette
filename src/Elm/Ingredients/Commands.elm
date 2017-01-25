module Ingredients.Commands exposing (..)

import Http
import Json.Decode exposing (..)
import Ingredients.Models exposing (Ingredient, IngredientId, BackendIngredient)
import Ingredients.Messages exposing (..)


getAllIngredients : Cmd Msg
getAllIngredients =
    let
        url =
            "http://ryanpeaseisabitch.herokuapp.com/ingredients"
    in
        Http.get url decodeIngredientList
            |> Http.send FetchAllDone


decodeIngredientList : Decoder (List BackendIngredient)
decodeIngredientList =
    list ingredientDecoder


ingredientDecoder : Decoder BackendIngredient
ingredientDecoder =
    map3 BackendIngredient
        (field "ID" int)
        (field "Name" string)
        (field "Category" int)
