module Drinks.ViewDrink exposing (..)

import Html exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Drinks.Models exposing (..)
import Drinks.Messages exposing (Msg(..))


view : Model -> Html Msg
view model =
    case model of
        NoDrink ->
            div [] [ Html.text "?" ]

        Success drink ->
            viewDrink drink

        Error msg ->
            div []
                [ h1 [ class "red" ] []
                ]


type alias DrinkDimensions =
    { width : Int
    , height : Int
    , thickness : Int
    , base : Int
    , room : Int
    , pad : Int
    }


drinkDim : DrinkDimensions
drinkDim =
    { width = 50
    , height = 100
    , thickness = 3
    , base = 15
    , room = 8
    , pad = 2
    }


viewDrink : Drink -> Html Msg
viewDrink drink =
    svg [ viewBox ("0 0 " ++ toString drinkDim.width ++ " " ++ toString drinkDim.height) ]
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
        ( usableHeight, ingHeight ) =
            ( getUsableHeight dim, getIngredientHeight dim ip.proportion )
    in
        rect
            [ x (toString (dim.thickness + dim.pad))
            , y (toString (toFloat usableHeight * (1 - fracUsed) + toFloat dim.room - ingHeight))
            , width (toString (dim.width - (2 * (dim.thickness + dim.pad))))
            , height (toString (ingHeight))
            , strokeWidth "0"
            , fill "white"
            ]
            []


getUsableHeight : DrinkDimensions -> Int
getUsableHeight dim =
    dim.height - dim.base - dim.pad - dim.room


getIngredientHeight : DrinkDimensions -> Float -> Float
getIngredientHeight dim proportion =
    toFloat (getUsableHeight dim) * proportion - (toFloat dim.pad)



{--
drawIngredient : DrinkDimensions -> Int -> Int -> String -> Svg Msg
drawIngredient dim fillFraction ingFraction colorStr =
    let
      usableHeight = dim.height *
    rect
        [ x (toString (dim.thickness + dim.pad))
        , y (toString (fillFraction * ))
        ]
        []
--}
