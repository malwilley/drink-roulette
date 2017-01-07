module Drinks.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Drinks.Models exposing (Model(..), IngredientProportion)
import Drinks.Messages exposing (Msg(..))

view : Model -> Html Msg
view model =
  div [ class "flex flex-column items-center flex-auto"]
  [ div [  class "flex items-center flex-auto" ]
    [ drinkDisplay model
    ]
  , button [ class "btn bg-green h3 p2 rounded align-bottom col col-12", onClick MakeDrink ] [ text "Make Drink" ]
  ]

drinkDisplay : Model -> Html Msg
drinkDisplay model =
  case model of
    NoDrink ->
      div [ class "bold", style [("font-size", "156pt")] ] [ text "?" ]
    Success drink ->
      div []
      [ h1 [] [ text drink.name ]
      , div [] ( List.map ingredientView drink.ingredients )
      ]
    Error msg ->
      div []
      [ h1 [ class "red" ] [ text msg ]
      ]

ingredientView : IngredientProportion -> Html Msg
ingredientView ip =
  h2 [] [ text (ip.ingredient.name ++ " - " ++ (toString (ip.proportion * 100)) ++ "%") ]
