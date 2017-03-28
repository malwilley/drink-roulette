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
import Ingredients.Models exposing (getNumSelectedIngredients)
import Drinks.Models exposing (getNumDrinks)
import Common.Icons
import Drinks.ViewHistory
import Drinks.ViewDrink
import Drinks.ViewCreate


view : Model -> Html Msg
view model =
    div [ class ("flex justify-center" ++ (model |> getBodyClass)) ]
        [ div [ id "main-container", class "flex flex-column items-stretch col col-12" ]
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
        [ viewSidebarIcon Common.Icons.bottle IngSidebarToggle (getNumSelectedIngredients model.ingredients)
        , h1 [ class "white m0 mx-auto bold" ] [ text "Drink Roulette" ]
        , viewSidebarIcon Common.Icons.history HistorySidebarToggle (getNumDrinks model.currentDrink)
        ]


viewStage : Model -> Html Msg
viewStage model =
    div [ id "stage", class "flex-auto flex items-stretch" ]
        [ div
            [ class <|
                "px2 flex flex-column flex-stretch flex-auto flex-basis-0 sidebar--left "
                    ++ getSidebarClass Ingredients model
            ]
            [ div [ class "flex justify-start py2 lg-hide" ]
                [ viewSidebarIcon Common.Icons.close OverlayClick 0 ]
            , Html.map IngredientsMsg (viewSelected model.ingredients)
            ]
        , div [ class "px3 flex flex-column items-stretch justify-between flex-auto flex-basis-0" ]
            [ Html.map IngredientsMsg (viewSearchBar model.ingredients)
            , Html.map DrinkMsg (Drinks.ViewDrink.view model.currentDrink)
            ]
        , div
            [ class <|
                "px2 flex flex-column flex-stretch flex-auto flex-basis-0 sidebar--right "
                    ++ getSidebarClass History model
            ]
            [ div [ class "flex justify-end py2 lg-hide" ]
                [ viewSidebarIcon Common.Icons.close OverlayClick 0 ]
            , Html.map DrinkMsg (Drinks.ViewHistory.view model.currentDrink)
            ]
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


viewSidebarIcon : (List (Svg.Attribute Msg) -> Svg Msg) -> Msg -> Int -> Svg Msg
viewSidebarIcon icon msg badgeNum =
    div [ class "relative lg-hide" ]
        [ icon
            [ Svg.Attributes.class <| "clickable width-2 height-2 fill-white"
            , onClick msg
            ]
        , viewSidebarIconBadge badgeNum
        ]


viewSidebarIconBadge : Int -> Html Msg
viewSidebarIconBadge num =
    case num of
        0 ->
            div [] []

        _ ->
            i [ class "badge bg-tan white" ] [ text (toString num) ]


getSidebarClass : Sidebar -> Model -> String
getSidebarClass sidebar model =
    if model.sidebar == sidebar then
        " sidebar--show"
    else
        ""


getBodyClass : Model -> String
getBodyClass model =
    case model.sidebar of
        Closed ->
            ""

        _ ->
            " height-full overflow-hidden"
