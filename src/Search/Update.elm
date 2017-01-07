module Search.Update exposing (..)

import Search.Models exposing (SearchTerm)
import Search.Messages exposing (Msg(..))

update : Msg -> SearchTerm
update msg =
  case msg of
    SetSearchTerm searchTerm ->
      searchTerm
