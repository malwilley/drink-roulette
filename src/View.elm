module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Models exposing (Model)
import Messages exposing (Msg(..))
import Ingredients.List
import Search.SearchBar
import Drinks.View

-- todo: refactor
import Drinks.Messages

view : Model -> Html Msg
view model =
  div []
  [ header [ class "flex flex-column", style [("height", "100vh"), ("min-height", "500px"), ("background", "#D9DFD2")] ]
    [ h1 [ class "bg-black white p1 center m0 bold" ] [ text "Drink Roulette" ]
    , div [ class "flex flex-auto" ]
      [ div [ class "col col-4 center p1" ]
        [ Html.map IngredientsMsg (Ingredients.List.viewSelected model.ingredients)
        , Html.map SearchMsg Search.SearchBar.viewSearchBar
        , Html.map IngredientsMsg (Ingredients.List.viewUnselected model.ingredients model.searchTerm)
        ]
      , div [ class "col col-4 flex" ]
        [ Html.map DrinkMsg (Drinks.View.view model.currentDrink) ]
      , div [ class "col col-4 center p1" ]
        [ h2 [ class "m2" ] [ text "Previous Drinks" ]

        ]
      ] -- todo: refactor below code into own submodule
    , Html.map DrinkMsg (div [ class "flex items-center"
      , style [("height", "20vh"), ("background", "#AF8C80"), ("justify-content", "center")]]
      [ button [ class "btn border rounded m2 p2", onClick Drinks.Messages.MakeDrink,
        style [("background", "transparent"), ("border-color", "#ece2df"), ("color", "#ece2df")]]
        [ text "Make Drink" ]
      ])
    ]
  , section [ class "white", style [("background", "#302d2c"), ("height", "80px")] ] [ text "other info" ]
  {-}, Html.map SearchMsg Search.SearchBar.viewSearchBar
  , Html.map IngredientsMsg (Ingredients.List.viewUnselected model.ingredients model.searchTerm)
  -}]
