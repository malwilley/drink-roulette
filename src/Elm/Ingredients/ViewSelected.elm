module Ingredients.ViewSelected exposing (viewSelected)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Common.Models exposing (..)
import Common.Icons
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
                    ( "Alcohol", Common.Icons.bottle )

                Mixer ->
                    ( "Mixers", Common.Icons.can )

                Other ->
                    ( "Other", Common.Icons.lemon )
    in
        div [ class "left flex-auto flex flex-column flex-stretch", style [ ( "flex-basis", "40px" ) ] ]
            [ h2 [ class "h3 flex items-center flex-none" ]
                [ icon "cat-icon fill-white"
                , div [] [ text name ]
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
    button
        [ class "btn selected-ingredient m1 p1 white flex justify-between"
        , style [ ( "background-color", ingredient.color ) ]
        , onClick (SelectedIngredientClicked ingredient)
        ]
        [ div [ class "" ] [ text ingredient.name ]
        , i [ class "fa fa-times-circle ml1" ] []
        ]
