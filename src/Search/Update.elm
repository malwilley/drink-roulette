module Search.Update exposing (..)

import Search.Models exposing (..)
import Search.Messages exposing (Msg(..))

update : Msg -> Model -> Model
update msg model =
  case msg of
    QueryChanged query ->
      { model | query = query }
