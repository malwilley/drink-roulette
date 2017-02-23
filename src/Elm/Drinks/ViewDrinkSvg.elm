module Drinks.ViewDrinkSvg exposing (..)

import Html exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)
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


viewSvg : Drink -> Html Msg
viewSvg drink =
    svg [ class "drink-svg", viewBox ("0 0 " ++ toString drinkDim.width ++ " " ++ toString drinkDim.height) ]
        (List.append (drawGlass drinkDim) (drawIngredients drinkDim drink.ingredients []))


drawGlass : DrinkDimensions -> List (Svg Msg)
drawGlass dim =
    [ rect
        [ class "glass"
        , x "0"
        , y "0"
        , width (toString dim.thickness)
        , height (toString dim.height)
        ]
        []
    , rect
        [ class "glass"
        , x (toString (dim.width - dim.thickness))
        , y "0"
        , width (toString dim.thickness)
        , height (toString dim.height)
        ]
        []
    , rect
        [ class "glass"
        , x "0"
        , y (toString (dim.height - dim.base))
        , width (toString dim.width)
        , height (toString dim.base)
        ]
        []
    ]


drawIngredients : DrinkDimensions -> List IngredientProportion -> List (Svg Msg) -> List (Svg Msg)
drawIngredients dim ips svgs =
    case ips of
        [] ->
            svgs

        hd :: tl ->
            let
                svg =
                    drawIngredient dim (1 - (List.sum (List.map (\ip -> ip.proportion) ips))) hd
            in
                drawIngredients dim tl (svg :: svgs)


drawIngredient : DrinkDimensions -> Float -> IngredientProportion -> Svg Msg
drawIngredient dim fracUsed ip =
    let
        ( posY, ingHeight ) =
            ( calcPositionY dim fracUsed ip
            , calcIngredientHeight dim ip
            )
    in
        rect
            [ x (toString (dim.thickness + dim.pad))
            , y (toString posY)
            , width (toString (dim.width - (2 * (dim.thickness + dim.pad))))
            , height "0"
            , strokeWidth "0"
            , fill ip.ingredient.color
            ]
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
