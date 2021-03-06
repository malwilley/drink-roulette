module Drinks.ViewDrinkSvg exposing (..)

import Html exposing (..)
import Svg exposing (..)
import Svg.Keyed
import Svg.Attributes exposing (..)
import Common.Models exposing (..)
import Drinks.Models exposing (..)
import Drinks.Messages exposing (Msg(..))


type alias DrinkDimensions =
    { width : Float
    , height : Float
    , thickness : Float
    , base : Float
    , room : Float
    , pad : Float
    , animationTime : Float
    }


drinkDim : DrinkDimensions
drinkDim =
    { width = 50
    , height = 100
    , thickness = 3
    , base = 15
    , room = 8
    , pad = 2
    , animationTime = 1.2
    }


viewSvg : Drink -> Animation -> Html Msg
viewSvg drink animation =
    Svg.Keyed.node "svg"
        [ class "drink-svg", viewBox ("0 0 " ++ toString drinkDim.width ++ " " ++ toString drinkDim.height) ]
        ((drawGlass drinkDim) ++ (drawIngredients drinkDim drink.ingredients [] animation))


drawGlass : DrinkDimensions -> List ( String, Svg Msg )
drawGlass dim =
    [ ( "0"
      , rect
            [ class "glass"
            , x "0"
            , y "0"
            , width (toString dim.thickness)
            , height (toString dim.height)
            ]
            []
      )
    , ( "1"
      , rect
            [ class "glass"
            , x (toString (dim.width - dim.thickness))
            , y "0"
            , width (toString dim.thickness)
            , height (toString dim.height)
            ]
            []
      )
    , ( "2"
      , rect
            [ class "glass"
            , x "0"
            , y (toString (dim.height - dim.base))
            , width (toString dim.width)
            , height (toString dim.base)
            ]
            []
      )
    ]


drawIngredients : DrinkDimensions -> List IngredientProportion -> List ( String, Svg Msg ) -> Animation -> List ( String, Svg Msg )
drawIngredients dim ips svgs animation =
    case ips of
        [] ->
            svgs

        hd :: tl ->
            let
                svg =
                    ( toString hd.proportion, drawIngredient dim (1 - (List.sum <| List.map (\ip -> ip.proportion) ips)) hd animation )
            in
                drawIngredients dim tl (svg :: svgs) animation


drawIngredient : DrinkDimensions -> Float -> IngredientProportion -> Animation -> Svg Msg
drawIngredient dim fracUsed ip animation =
    let
        ( posY, ingHeight ) =
            ( calcPositionY dim fracUsed ip
            , calcIngredientHeight dim ip
            )
    in
        rect
            [ class ("fill-" ++ ip.ingredient.color)
            , x (toString (dim.thickness + dim.pad))
            , y (toString posY)
            , width (toString (dim.width - (2 * (dim.thickness + dim.pad))))
            , height
                (case animation of
                    Animated ->
                        "0"

                    Static ->
                        toString ingHeight
                )
            , strokeWidth "0"
            ]
            (case animation of
                Animated ->
                    [ animate
                        [ attributeName "height"
                        , from "0"
                        , to (toString ingHeight)
                        , dur (toString <| dim.animationTime * ip.proportion)
                        , begin (toString <| dim.animationTime * fracUsed)
                        , fill "freeze"
                        ]
                        []
                    , animate
                        [ attributeName "y"
                        , from (toString <| posY + ingHeight)
                        , to (toString posY)
                        , dur (toString <| dim.animationTime * ip.proportion)
                        , begin (toString <| dim.animationTime * fracUsed)
                        , fill "freeze"
                        ]
                        []
                    ]

                Static ->
                    []
            )


calcPositionY : DrinkDimensions -> Float -> IngredientProportion -> Float
calcPositionY dim fracUsed ip =
    let
        ( usableHeight, ingHeight ) =
            ( calcUsableHeight dim, calcIngredientHeight dim ip )
    in
        usableHeight * (1 - fracUsed) + dim.room - ingHeight


calcIngredientHeight : DrinkDimensions -> IngredientProportion -> Float
calcIngredientHeight dim ip =
    (calcUsableHeight dim) * ip.proportion - dim.pad


calcUsableHeight : DrinkDimensions -> Float
calcUsableHeight dim =
    dim.height - dim.base - dim.pad - dim.room
