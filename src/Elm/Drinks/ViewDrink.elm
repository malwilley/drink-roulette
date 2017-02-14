module Drinks.ViewDrink exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Common.Models exposing (..)
import Drinks.Models exposing (..)
import Drinks.Messages exposing (Msg(..))
import Drinks.ViewDrinkSvg


view : Model -> Html Msg
view model =
    case model.currentDrink of
        Nothing ->
            div [] [ Html.text "?" ]

        Just (Succeed drink) ->
            viewDrink drink

        _ ->
            div []
                [ h1 [ class "red" ] []
                ]


viewDrink : Drink -> Html Msg
viewDrink drink =
    div [ class "flex justify-center items-center" ]
        [ div [ class "current-drink-container" ] [ Drinks.ViewDrinkSvg.viewSvg drink ]
        , viewDrinkRecipe drink
        ]


viewDrinkRecipe : Drink -> Html Msg
viewDrinkRecipe drink =
    div [ class "drink-recipe flex-none" ]
        [ h3 [] [ Html.text drink.name ]
        , ul [] (List.map toRecipeListItem drink.ingredients)
        ]


toRecipeListItem : IngredientProportion -> Html Msg
toRecipeListItem ip =
    let
        amount =
            toString ip.proportion
    in
        li [] [ Html.text (amount ++ " " ++ ip.ingredient.name) ]
