module Ingredients.ViewSelected exposing (viewSelected)

import Html exposing (..)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import Common.Models exposing (..)
import Ingredients.Models exposing (..)
import Ingredients.Messages exposing (..)


viewSelected : Model -> Html Msg
viewSelected model =
    section [ class "selected-ingredients flex-auto flex flex-column flex-stretch" ]
        [ viewSelectedCategory Alcohol model
        , viewSelectedCategory Mixer model
        , viewSelectedCategory Other model
        ]


viewSelectedCategory : Category -> Model -> Html Msg
viewSelectedCategory cat model =
    let
        ( name, icon ) =
            case cat of
                Alcohol ->
                    ( "Alcohol", "fa fa-glass" )

                Mixer ->
                    ( "Mixers", "fa fa-glass" )

                Other ->
                    ( "Other", "fa fa-glass" )
    in
        div [ class "left flex-auto flex flex-column flex-stretch" ]
            [ h2 [ class "h3" ]
                [ div [ class ("inline-block m1 " ++ icon) ] []
                , div [ class "inline-block" ] [ text name ]
                ]
            , viewCategoryButtons cat model
            ]


viewCategoryButtons : Category -> Model -> Html Msg
viewCategoryButtons cat model =
    case model.ingredients of
        Succeed ingredients ->
            div [ class "flex flex-justify flex-wrap overflow-auto" ]
                (ingredients
                    |> List.filter (\i -> i.selected)
                    |> List.filter (\i -> i.category == cat)
                    |> List.map selectedButton
                )

        Fetching ->
            div [] []

        Fail _ ->
            div [] []


selectedButton : Ingredient -> Html Msg
selectedButton ingredient =
    div
        [ class "selected-ingredient m1 p1 white rounded"
        , style [ ( "background", ingredient.color ) ]
        , onClick (SelectedIngredientClicked ingredient)
        ]
        [ text ingredient.name ]
