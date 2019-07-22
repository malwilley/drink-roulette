module Drinks.ViewCreate exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Common.Icons
import Common.Models exposing (..)
import Drinks.Models exposing (..)
import Drinks.Messages exposing (Msg(..))


view : Model -> Html Msg
view model =
    let
        animateClass =
            case model.currentDrink of
                Just Fetching ->
                    "popup"

                _ ->
                    "popdown"
    in
        div
            [ class "bartop flex items-center flex-none justify-center" ]
            [ button [ class "h3 btn btn-makedrink", onClick MakeDrink ] [ text "Create" ]
            , div [ class ("loader-container " ++ animateClass) ] [ Common.Icons.liquidBoxLoader ]
            ]
