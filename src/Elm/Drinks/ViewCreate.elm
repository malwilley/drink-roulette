module Drinks.ViewCreate exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Drinks.Models exposing (..)
import Drinks.Messages exposing (Msg(..))


view : Model -> Html Msg
view model =
    div
        [ class "flex items-center"
        , style [ ( "height", "15vh" ), ( "background", "#af9664" ), ( "justify-content", "center" ) ]
        ]
        [ div [ class "h3 btn btn-makedrink", onClick Drinks.Messages.MakeDrink ]
            [ div [ style [ ( "display", "inline-block" ), ( "padding-right", "10px" ) ] ] [ text "create  " ], div [ class "fa fa-cogs" ] [] ]
        ]
