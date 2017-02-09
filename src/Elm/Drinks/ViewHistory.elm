module Drinks.ViewHistory exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Drinks.Models exposing (..)
import Drinks.Messages exposing (Msg(..))


view : Model -> Html Msg
view model =
    h2 [ class "m2 h3" ]
        [ i [ class "fa fa-glass inline-block m1" ] []
        , div [ class "inline-block" ] [ text "Previous Drinks" ]
        ]
