module Ingredients.Commands exposing (..)

import Http
import Json.Decode exposing (..)
import Maybe
import Ingredients.Models exposing (..)
import Ingredients.Messages exposing (..)


getAllIngredients : String -> Cmd Msg
getAllIngredients apiHost =
    let
        url =
            apiHost ++ "/ingredients"
    in
        Http.get url decodeIngredientList
            |> Http.send FetchAllDone


decodeIngredientList : Decoder (List Ingredient)
decodeIngredientList =
    list ingredientDecoder


ingredientDecoder : Decoder Ingredient
ingredientDecoder =
    map5 Ingredient
        (field "ID" int)
        (field "Name" string)
        categoryDecoder
        (field "Color" string)
        (succeed False)


categoryDecoder : Decoder Category
categoryDecoder =
    (field "Category" int) |> andThen intToCategoryDecoder


intToCategoryDecoder : Int -> Decoder Category
intToCategoryDecoder num =
    succeed <|
        Maybe.withDefault Other <|
            intToCategory num


intToCategory : Int -> Maybe Category
intToCategory num =
    case num of
        0 ->
            Just Alcohol

        1 ->
            Just Mixer

        2 ->
            Just Other

        _ ->
            Nothing
