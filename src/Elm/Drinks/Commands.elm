module Drinks.Commands exposing (..)

import String
import Http
import Json.Decode as Decode exposing (..)
import Ingredients.Models exposing (IngredientId)
import Ingredients.Commands
import Drinks.Messages exposing (..)
import Drinks.Models exposing (..)


getDrink : List IngredientId -> Cmd Msg
getDrink ids =
    Http.get (drinkUrl ids) drinkDecoder
        |> Http.send FetchDrinkDone


drinkUrl : List Int -> String
drinkUrl ids =
    "http://ryanpeaseisabitch.herokuapp.com/makedrink/" ++ (String.join "-" (List.map toString ids))


drinkDecoder : Decoder Drink
drinkDecoder =
    map3 Drink
        (field "Name" string)
        (field "Contents" contentsListDecoder)
        drinkSizeDecoder


drinkSizeDecoder : Decoder DrinkSize
drinkSizeDecoder =
    (field "Size" int)
        |> andThen intToDrinkSizeDecoder


intToDrinkSizeDecoder : Int -> Decoder DrinkSize
intToDrinkSizeDecoder num =
    let
        ds =
            intToDrinkSize num
    in
        case ds of
            Just ds ->
                succeed ds

            Nothing ->
                fail (toString num ++ " is not a valid drink size number")


intToDrinkSize : Int -> Maybe DrinkSize
intToDrinkSize num =
    case num of
        0 ->
            Just Shot

        1 ->
            Just Pint

        2 ->
            Just Cup

        3 ->
            Just Buttchug

        _ ->
            Nothing


contentsListDecoder : Decoder (List IngredientProportion)
contentsListDecoder =
    list contentsDecoder


contentsDecoder : Decoder IngredientProportion
contentsDecoder =
    map2 IngredientProportion
        (field "Ingredient" Ingredients.Commands.ingredientDecoder)
        (field "Fraction" float)
