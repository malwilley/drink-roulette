module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing (Model)
import Messages exposing (Msg(..))
import Ingredients.ViewSearch exposing (viewSearchBar)
import Ingredients.ViewSelected exposing (viewSelected)
import Drinks.ViewHistory
import Drinks.ViewDrink
import Drinks.ViewCreate


view : Model -> Html Msg
view model =
    div []
        [ header [ class "flex flex-column", style [ ( "height", "100vh" ), ( "min-height", "500px" ), ( "background", "#111" ) ] ]
            [ h1 [ class "white p1 center m1 bold" ] [ text "Drink Roulette" ]
            , div [ class "flex flex-auto" ]
                [ div [ class "col col-4 center px3 flex flex-column flex-stretch" ]
                    [ Html.map IngredientsMsg (viewSelected model.ingredients)
                    ]
                , div [ class "col col-4 px3 flex flex-column items-stretch justify-between" ]
                    [ Html.map IngredientsMsg (viewSearchBar model.ingredients)
                    , Html.map DrinkMsg (Drinks.ViewDrink.view model.currentDrink)
                    ]
                , div [ class "col col-4 center px3 flex flex-column flex-stretch" ]
                    [ Html.map DrinkMsg (Drinks.ViewHistory.view model.currentDrink) ]
                ]
            , Html.map DrinkMsg (Drinks.ViewCreate.view model.currentDrink)
            ]
        , section [ class "white", style [ ( "background", "#302d2c" ), ( "height", "80px" ) ] ] [ text "other info" ]
        ]
