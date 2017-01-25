module Ingredients.ViewSelected exposing (viewSelected)

import Html exposing (..)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import Ingredients.Models exposing (..)
import Ingredients.Messages exposing (..)


selectedButton : Ingredient -> Html Msg
selectedButton item =
    div
        [ class "selected-ingredient"
        , onClick (Toggle item.id)
        ]
        [ text item.name ]


selectedButtonList : List Ingredient -> List (Html Msg)
selectedButtonList items =
    items
        |> List.filter (\i -> i.selected)
        |> List.map selectedButton


viewSelected : Model -> Html Msg
viewSelected model =
    div [] (selectedButtonList model.list)
