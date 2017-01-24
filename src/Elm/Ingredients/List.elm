module Ingredients.List exposing (viewUnselected, viewSelected)

import Html exposing (..)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick, onInput)
import String exposing (contains)
import Regex exposing (contains, regex, caseInsensitive)

import Ingredients.Models exposing (Ingredient)
import Ingredients.Messages exposing (..)

viewIngredientsTable : List Ingredient -> String -> Html Msg
viewIngredientsTable ingredients searchTerm =
  let
    items = List.filter (\i -> (not i.selected)
      && (matchesSearchTerm searchTerm i.name)) ingredients
  in
    div
      [ class "flex" ]
      [ div [ class "col-4" ] [ viewCategory Ingredients.Models.Alcohol items ]
      , div [ class "col-4" ] [ viewCategory Ingredients.Models.Mixer items ]
      , div [ class "col-4" ] [ viewCategory Ingredients.Models.Other items ]
      ]

matchesSearchTerm : String -> String -> Bool
matchesSearchTerm searchTerm name =
  String.isEmpty searchTerm
  || Regex.contains (caseInsensitive (regex searchTerm)) name

viewCategory : Ingredients.Models.Category -> List Ingredient -> Html Msg
viewCategory category items =
  let
    categoryTitle =
      case category of
        Ingredients.Models.Alcohol -> "Alcohol"
        Ingredients.Models.Mixer -> "Mixers"
        Ingredients.Models.Other -> "Other"
  in
  div [ ]
    [ div [ class "p1 bold white bg-blue center" ] [ text categoryTitle]
    , div [ class "p1 flex flex-wrap justify-center" ]
          ( items
            |> List.filter (\i -> i.category == category)
            |> List.map unselectedButton )
    ]

unselectedButton : Ingredient -> Html Msg
unselectedButton item =
    div
      [ class "btn bg-blue white p1 m1"
      , onClick (Toggle item.id) ]
      [ text item.name ]

selectedButton : Ingredient -> Html Msg
selectedButton item =
  div
    [ class "selected-ingredient"
    , onClick (Toggle item.id) ]
    [ text item.name ]

selectedButtonList : List Ingredient -> List (Html Msg)
selectedButtonList items =
  items
  |> List.filter (\i -> i.selected)
  |> List.map selectedButton

viewUnselected : List Ingredient -> String -> Html Msg
viewUnselected ingredients searchTerm =
  viewIngredientsTable ingredients searchTerm

viewSelected : List Ingredient -> Html Msg
viewSelected ingredients =
  div [] ( selectedButtonList ingredients )
