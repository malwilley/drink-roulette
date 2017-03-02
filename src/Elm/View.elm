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
        ]


viewHeader : Model -> Html Msg
viewHeader model =
    header [ class "flex justify-between items-center p2" ]
        [ model |> viewSidebarIcon Ingredients Common.Icons.bottle IngSidebarToggle
        , h1 [ class "white m0 mx-auto bold" ] [ text "Drink Roulette" ]
        , model |> viewSidebarIcon History Common.Icons.history HistorySidebarToggle
        ]


viewStage : Model -> Html Msg
viewStage model =
    div [ class "flex items-stretch", style [ ( "height", "650px" ) ] ]
        [ div
            [ class <| "center px3 flex flex-column flex-stretch flex-auto flex-basis-0 sidebar--left " ++ (getSidebarClass Ingredients model) ]
            [ Html.map IngredientsMsg (viewSelected model.ingredients) ]
        , div [ class "px3 flex flex-column items-stretch justify-between flex-auto flex-basis-0" ]
            [ Html.map IngredientsMsg (viewSearchBar model.ingredients)
            , Html.map DrinkMsg (Drinks.ViewDrink.view model.currentDrink)
            ]
        , div [ class <| "center px3 flex flex-column flex-stretch flex-auto flex-basis-0 sidebar--right " ++ getSidebarClass History model ]
            [ Html.map DrinkMsg (Drinks.ViewHistory.view model.currentDrink) ]
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
            [ a [ href "https://github.com/malwilley/drink-roulette", target "_blank" ]
                [ img [ class "logo", src "src/img/elm.svg" ] [] ]
            , img [ src "src/img/plus.svg", style [ ( "width", "8px" ) ] ] []
            , a [ href "https://github.com/bsomes/trashed-panda-backend/", target "_blank" ]
                [ img [ class "logo", src "src/img/gopher.svg" ] [] ]
            ]
        ]


viewSidebarIcon : Sidebar -> (List (Svg.Attribute Msg) -> Svg Msg) -> Msg -> Model -> Svg Msg
viewSidebarIcon sidebar icon msg model =
    icon
        [ Svg.Attributes.class <|
            "clickable width-2 fill-white lg-hide"
                ++ getSidebarIconClass sidebar model
        , onClick msg
        ]


getSidebarClass : Sidebar -> Model -> String
getSidebarClass sidebar model =
    if model.sidebar == sidebar then
        " sidebar--show"
    else
        ""


getSidebarIconClass : Sidebar -> Model -> String
getSidebarIconClass sidebar model =
    if model.sidebar == sidebar then
        " z3 fill-black"
    else
        " fill-white"
