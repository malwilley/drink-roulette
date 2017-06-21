module Drinks.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (..)
import Json.Encode as Encode
import Ingredients.Models exposing (IngredientId)
import Ingredients.Commands
import Drinks.Messages exposing (..)
import Drinks.Models exposing (..)


getPost : String -> List IngredientId -> Http.Request Drink
getPost apiHost ids =
    Http.post (getDrinkUrl apiHost) (getRequestBody ids) drinkDecoder


getDrink : String -> List IngredientId -> Cmd Msg
getDrink apiHost ids =
    getPost apiHost ids
        |> Http.send FetchDrinkDone


getDrinkUrl : String -> String
getDrinkUrl apiHost =
    apiHost ++ "/makedrink"


getRequestBody : List IngredientId -> Http.Body
getRequestBody ids =
    ids
        |> List.map Encode.int
        |> Encode.list
        |> Http.jsonBody


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
