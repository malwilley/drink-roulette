module Drinks.ViewCreate exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Drinks.Models exposing (..)
import Drinks.Messages exposing (Msg(..))


view : Model -> Html Msg
view model =
    div
        [ class "flex items-center flex-none rounded-top"
        , style [ ( "height", "120px" ), ( "background", "#af9664" ), ( "justify-content", "center" ) ]
        ]
        [ div [ class "h3 btn btn-makedrink", onClick MakeDrink ] [ text "create" ] ]
