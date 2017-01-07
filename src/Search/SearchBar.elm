module Search.SearchBar exposing (viewSearchBar)

import Html exposing (..)
import Html.Attributes exposing (class, style, type_, placeholder)
import Html.Events exposing (onInput)

import Search.Messages exposing (Msg(..))

viewSearchBar : Html Msg
viewSearchBar =
  input [ type_ "search", class "mb1 p2 fit center h2 border"
  , style[("width", "100%")], onInput SetSearchTerm
  , placeholder "Search..."] [  ]
