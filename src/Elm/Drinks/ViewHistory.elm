module Drinks.ViewHistory exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Drinks.Models exposing (..)
import Drinks.Messages exposing (Msg(..))
import Drinks.ViewDrinkSvg


view : Model -> Html Msg
view model =
    section [ class "flex-auto flex flex-column flex-stretch" ]
        [ h2 [ class "my2 h3" ]
            [ i [ class "fa fa-glass inline-block m1" ] []
            , div [ class "inline-block" ] [ text "Previous Drinks" ]
            ]
        , div [ class "flex flex-column flex-stretch flex-auto overflow-auto" ]
            (List.map previousDrinkItem model.previousDrinks)
        ]


previousDrinkItem : Drink -> Html Msg
previousDrinkItem drink =
    div [ class "flex" ]
        [ div [ class "prevdrink-icon-container" ] [ Drinks.ViewDrinkSvg.viewSvg drink ]
        , div [ class "flex flex-column justify-center" ]
            [ h4 [ class "prevdrink-title" ] [ text drink.name ]
            , ul []
                (List.append
                    (drink.ingredients
                        |> List.map ingredientListItem
                        |> List.take 1
                    )
                    [ (extraIngredientsListItem drink.ingredients) ]
                )
            ]
        ]


ingredientListItem : IngredientProportion -> Html Msg
ingredientListItem ip =
    li [ class "prevdrink-ingredient" ] [ text ip.ingredient.name ]


extraIngredientsListItem : List IngredientProportion -> Html Msg
extraIngredientsListItem ips =
    li [ class "prevdrink-ingredient-extra" ] [ text ("+ " ++ toString (List.length ips - 1) ++ " more") ]
