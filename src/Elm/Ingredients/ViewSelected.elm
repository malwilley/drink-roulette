module Ingredients.ViewSelected exposing (viewSelected)

import Html exposing (..)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import Ingredients.Models exposing (..)
import Ingredients.Messages exposing (..)


selectedButton : Ingredient -> Html Msg
selectedButton ingredient =
    div
        [ class "selected-ingredient m1 p1 white bg-red rounded"
        , onClick (SelectedIngredientClicked ingredient)
        ]
        [ text ingredient.name ]


viewSelected : Model -> Html Msg
viewSelected model =
    div [ class "flex flex-justify flex-wrap mt2" ]
        (model.list
            |> List.filter (\i -> i.selected)
            |> List.map selectedButton
        )
