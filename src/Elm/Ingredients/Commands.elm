module Ingredients.Commands exposing (..)

import Http
import Json.Decode exposing (..)
import String exposing (..)
import Maybe
import Ingredients.Models exposing (..)
import Ingredients.Messages exposing (..)


getAllIngredients : Cmd Msg
getAllIngredients =
    let
        url =
            "http://ryanpeaseisabitch.herokuapp.com/ingredients"
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
        colorDecoder
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


colorDecoder : Decoder String
colorDecoder =
    field "Color" string
        |> andThen stringToHexDecoder


stringToHexDecoder : String -> Decoder String
stringToHexDecoder str =
    succeed (Maybe.withDefault "#000" <| colorNameToHex str)


colorNameToHex : String -> Maybe String
colorNameToHex name =
    let
        str =
            toLower name
    in
        case str of
            "brown" ->
                Just "#302d2c"

            "tan" ->
                Just "#9E865D"

            "yellow" ->
                Just "#AFAF64"

            "light blue" ->
                Just "#64AFAE"

            "purple" ->
                Just "#AB64AF"

            "red" ->
                Just "#AF64640"

            "dark red" ->
                Just "#7A4C4C"

            "orange" ->
                Just "#AF7264"

            str ->
                Nothing
