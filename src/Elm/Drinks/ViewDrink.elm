module Drinks.ViewDrink exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Svg exposing (svg)
import Svg.Attributes exposing (viewBox)
import Drinks.Models exposing (Model(..), IngredientProportion)
import Drinks.Messages exposing (Msg(..))


view : Model -> Html Msg
view model =
    svg [ id "drink-svg", viewBox "0 0 100 100", style [ ( "align-self", "flex-end" ), ( "margin", "1px" ) ] ] []


drinkDisplay : Model -> Html Msg
drinkDisplay model =
    case model of
        NoDrink ->
            div [ class "bold", style [ ( "font-size", "156pt" ) ] ] [ text "?" ]

        Success drink ->
            div []
                [ h1 [] [ text drink.name ]
                , div [] (List.map ingredientView drink.ingredients)
                , svg [ id "drink-svg", viewBox "0 0 100 100" ] []
                ]

        Error msg ->
            div []
                [ h1 [ class "red" ] [ text msg ]
                ]


ingredientView : IngredientProportion -> Html Msg
ingredientView ip =
    h2 [] [ text (ip.ingredient.name ++ " - " ++ (toString (ip.proportion * 100)) ++ "%") ]
