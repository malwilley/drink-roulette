module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Svg exposing (Svg)
import Svg.Attributes
import Html.Events exposing (..)
import Models exposing (..)
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
        [ div [ class "flex flex-column items-stretch col col-12", style [ ( "max-width", "1200px" ) ] ]
            [ model |> viewHeader
            , model |> viewStage
            , model |> viewBartop
            , viewFooter
            ]
        , model |> viewOverlay
        ]


viewHeader : Model -> Html Msg
viewHeader model =
    header [ class "flex justify-between items-center p2" ]
        [ model |> viewSidebarIcon Common.Icons.bottle IngSidebarToggle
        , h1 [ class "white m0 mx-auto bold" ] [ text "Drink Roulette" ]
        , model |> viewSidebarIcon Common.Icons.history HistorySidebarToggle
        ]


viewStage : Model -> Html Msg
viewStage model =
    div [ id "stage", class "flex items-stretch" ]
        [ div
            [ class <| "px2 flex flex-column flex-stretch flex-auto flex-basis-0 sidebar--left "
                ++ getSidebarClass Ingredients model ]
            [ div [ class "flex justify-start py2" ]
                [ model |> viewSidebarIcon Common.Icons.close OverlayClick ]
            , Html.map IngredientsMsg (viewSelected model.ingredients) ]
        , div [ class "px3 flex flex-column items-stretch justify-between flex-auto flex-basis-0" ]
            [ Html.map IngredientsMsg (viewSearchBar model.ingredients)
            , Html.map DrinkMsg (Drinks.ViewDrink.view model.currentDrink)
            ]
        , div [
            class <| "px2 flex flex-column flex-stretch flex-auto flex-basis-0 sidebar--right "
                ++ getSidebarClass History model ]
            [  div [ class "flex justify-end py2" ]
                [ model |> viewSidebarIcon Common.Icons.close OverlayClick ]
            , Html.map DrinkMsg (Drinks.ViewHistory.view model.currentDrink) ]
        ]


viewBartop : Model -> Html Msg
viewBartop model =
    Html.map DrinkMsg (Drinks.ViewCreate.view model.currentDrink)


viewFooter : Html Msg
viewFooter =
    div [ class "flex flex-column center items-center m1" ]
        [ div [ class "h5 mt3 gray", style [ ( "letter-spacing", ".1rem" ) ] ]
            [ text "made with" ]
        , div [ class "flex items-center" ]
            [ a [ class "logo", href "https://github.com/malwilley/drink-roulette", target "_blank" ]
                [ Common.Icons.elm [] ]
            , Common.Icons.plus []
            , a [ class "logo", href "https://github.com/bsomes/trashed-panda-backend/", target "_blank" ]
                [ Common.Icons.gopher [] ]
            ]
        ]


viewOverlay : Model -> Html Msg
viewOverlay model =
    div
        [ classList
            [ ( "overlay", True )
            , ( "overlay--show", model.sidebar /= Closed )
            ]
        , onClick OverlayClick
        ]
        []


viewSidebarIcon : (List (Svg.Attribute Msg) -> Svg Msg) -> Msg -> Model -> Svg Msg
viewSidebarIcon icon msg model =
    icon
        [ Svg.Attributes.class <| "clickable width-2 height-2 fill-white lg-hide"
        , onClick msg
        ]


getSidebarClass : Sidebar -> Model -> String
getSidebarClass sidebar model =
    if model.sidebar == sidebar then
        " sidebar--show"
    else
        ""
