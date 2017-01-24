module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Models exposing (Model)
import Messages exposing (Msg(..))
import Ingredients.List
import Search.View
import Drinks.View

-- todo: refactor
import Drinks.Messages

view : Model -> Html Msg
view model =
  div []
  [ header [ class "flex flex-column", style [("height", "100vh"), ("min-height", "500px"), ("background", "#111")] ]
    [ h1 [ class "white p1 center m0 bold" ] [ text "Drink Roulette" ]
    , div [ class "flex flex-auto" ]
      [ div [ class "col col-4 center p1" ]
        [ Html.map SearchMsg (Search.View.viewSearchBar model.search model.ingredients)
        , Html.map IngredientsMsg (Ingredients.List.viewUnselected model.ingredients model.search.query )
        , Html.map IngredientsMsg (Ingredients.List.viewSelected model.ingredients)
        ]
      , div [ class "col col-4 flex" ]
        [ Html.map DrinkMsg (Drinks.View.view model.currentDrink) ]
      , div [ class "col col-4 center p1" ]
        [ h2 [ class "m2" ] [ text "Previous Drinks" ]

        ]
      ] -- todo: refactor below code into own submodule
    , Html.map DrinkMsg (div [ class "flex items-center"
      , style [("height", "15vh"), ("background", "#af9664"), ("justify-content", "center")]]
      [ div [ class "h3 btn btn-makedrink", onClick Drinks.Messages.MakeDrink ]
        [ div [ style[("display", "inline-block"), ("padding-right", "10px")]] [text "create  "], div [ class "fa fa-cogs" ] [] ]
      ])
    ]
  , section [ class "white", style [("background", "#302d2c"), ("height", "80px")] ] [ text "other info" ]
  ]
