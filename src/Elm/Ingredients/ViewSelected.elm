module Ingredients.ViewSelected exposing (viewSelected)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Keyed
import Svg.Attributes
import Html.Events exposing (onClick)
import Common.Models exposing (..)
import Common.Icons
import Ingredients.Models exposing (..)
import Ingredients.Messages exposing (..)


viewSelected : Model -> Html Msg
viewSelected model =
    section [ class "selected-ingredients flex-auto flex flex-column flex-stretch overflow-auto" ]
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
        div [ class "left flex-auto flex flex-column flex-stretch flex-none" ]
            [ h2 [ class "my2 h3 tan border-bottom border-tan flex items-center flex-none" ]
                [ icon [ Svg.Attributes.class "cat-icon fill-white" ]
                , div [] [ text name ]
                ]
            , viewCategoryButtons cat model
            ]


viewCategoryButtons : Category -> Model -> Html Msg
viewCategoryButtons cat model =
    case model.ingredients of
        Succeed ingredients ->
            -- Ingredients must be keyed or order will be messed up when adding/removing
            Html.Keyed.ul [ class "flex flex-wrap justify-start" ]
                (ingredients
                    |> List.filter (\i -> i.selected)
                    |> List.filter (\i -> i.category == cat)
                    |> List.map (\i -> ( toString (i.id), i ))
                    |> List.map (Tuple.mapSecond selectedButton)
                )

        Fetching ->
            div [] []

        Fail _ ->
            div [] []


selectedButton : Ingredient -> Html Msg
selectedButton ingredient =
    let
        colorClass =
            "background-" ++ ingredient.color
    in
        button
            [ class ("btn selected-ingredient flex justify-between items-center " ++ colorClass)
            , onClick (SelectedIngredientClicked ingredient)
            ]
            [ div [ class "selected-ingredient-text" ] [ text ingredient.name ]
            , Common.Icons.close
                [ Svg.Attributes.class "height-1 ml1" ]
            ]
