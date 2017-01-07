module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Models exposing (Model)
import Messages exposing (Msg(..))
import Ingredients.List
import Search.SearchBar
import Drinks.View

view : Model -> Html Msg
view model =
  div []
  [ header [ class "bg-silver flex flex-column", style [("height", "70vh"), ("min-height", "500px")] ]
    [ h1 [ class "bg-black white p1 center m0 bold" ] [ text "Drink Roulette" ]
    , div [ class "flex flex-auto" ]
      [ div [ class "col col-4 center p1" ]
        [ h2 [ class "m2" ] [ text "Selected Ingredients" ]
        , Html.map IngredientsMsg (Ingredients.List.viewSelected model.ingredients)
        ]
      , div [ class "col col-4 flex" ]
        [ Html.map DrinkMsg (Drinks.View.view model.currentDrink) ]
      , div [ class "col col-4 center p1" ]
        [ h2 [ class "m2" ] [ text "Previous Drinks" ]

        ]
      ]
    ]
  , Html.map SearchMsg Search.SearchBar.viewSearchBar
  , Html.map IngredientsMsg (Ingredients.List.viewUnselected model.ingredients model.searchTerm)
  ]
