module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing (Model)
import Messages exposing (Msg(..))
import Ingredients.ViewSearch exposing (viewSearchBar)
import Ingredients.ViewSelected exposing (viewSelected)
import Common.Icons
import Drinks.ViewHistory
import Drinks.ViewDrink
import Drinks.ViewCreate


view : Model -> Html Msg
view model =
    div [ class "flex justify-center" ]
        [ div [ class "flex flex-column items-stretch", style [ ( "width", "100%" ), ( "max-width", "1200px" ) ] ]
            [ header [ class "flex justify-between items-center height-4" ]
                [ Common.Icons.bottle "clickable width-2 ml3 fill-white lg-hide"
                , h1 [ class "white my0 mx-auto bold" ] [ text "Drink Roulette" ]
                , Common.Icons.history "clickable width-2 mr3 fill-white lg-hide"
                ]
            , div [ class "main-stage flex items-stretch" ]
                [ div [ class "center px3 flex flex-column flex-stretch flex-auto flex-basis-0 xs-hide sm-hide md-hide" ]
                    [ Html.map IngredientsMsg (viewSelected model.ingredients)
                    ]
                , div [ class "px3 flex flex-column items-stretch justify-between flex-auto flex-basis-0" ]
                    [ Html.map IngredientsMsg (viewSearchBar model.ingredients)
                    , Html.map DrinkMsg (Drinks.ViewDrink.view model.currentDrink)
                    ]
                , div [ class "center px3 flex flex-column flex-stretch flex-auto flex-basis-0 xs-hide sm-hide md-hide" ]
                    [ Html.map DrinkMsg (Drinks.ViewHistory.view model.currentDrink) ]
                ]
            , Html.map DrinkMsg (Drinks.ViewCreate.view model.currentDrink)
            , div [ class "flex flex-column center items-center m1" ]
                [ div [ class "h5 mt3 gray", style [ ( "letter-spacing", ".1rem" ) ] ]
                    [ text "made with" ]
                , div [ class "flex items-center" ]
                    [ a [ href "https://github.com/malwilley/drink-roulette", target "_blank" ]
                        [ img [ class "logo", src "src/img/elm.svg" ] [] ]
                    , img [ src "src/img/plus.svg", style [ ( "width", "8px" ) ] ] []
                    , a [ href "https://github.com/bsomes/trashed-panda-backend/", target "_blank" ]
                        [ img [ class "logo", src "src/img/gopher.svg" ] [] ]
                    ]
                ]
            ]
        ]
