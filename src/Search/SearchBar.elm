module Search.SearchBar exposing (viewSearchBar)

import Html exposing (..)
import Html.Attributes exposing (class, style, type_, placeholder)
import Html.Events exposing (onInput)

import Search.Messages exposing (Msg(..))

viewSearchBar : Html Msg
viewSearchBar =
  input [ class "search-bar", type_ "search", onInput QueryChanged
  , placeholder "Search for an ingredient"]
  [ ]
