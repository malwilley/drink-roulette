module Common.Icons exposing (..)

import Html
import Svg exposing (..)
import Svg.Attributes exposing (..)


{-| elm logo
-}
elm : List (Svg.Attribute msg) -> Svg msg
elm attrs =
    svg ([ enableBackground "new 0 0 323.141 322.95", viewBox "0 0 323.141 322.95", x "0px", y "0px" ] ++ attrs)
        [ g []
            [ node "polygon"
                [ points "161.649,152.782 231.514,82.916 91.783,82.916" ]
                []
            , text "  "
            , node "polygon"
                [ points "8.867,0 79.241,70.375 232.213,70.375 161.838,0" ]
                []
            , text "  "
            , node "rect"
                [ height "108.167", transform "matrix(0.7071 0.7071 -0.7071 0.7071 186.4727 -127.2386)", width "107.676", x "192.99", y "107.392" ]
                []
            , text "  "
            , node "polygon"
                [ points "323.298,143.724 323.298,0 179.573,0" ]
                []
            , text "  "
            , node "polygon"
                [ points "152.781,161.649 0,8.868 0,314.432" ]
                []
            , text "  "
            , node "polygon"
                [ points "255.522,246.655 323.298,314.432 323.298,178.879" ]
                []
            , text "  "
            , node "polygon"
                [ points "161.649,170.517 8.869,323.298 314.43,323.298" ]
                []
            , text ""
            ]
        ]


{-| golang logo
-}
gopher : List (Svg.Attribute msg) -> Svg msg
gopher attrs =
    svg ([ enableBackground "new 0 0 438.004 592.145", fill "none", stroke "white", viewBox "0 0 438.004 592.145", x "0px", y "0px" ] ++ attrs)
        [ g [] [ Svg.path [ d "M45.352,291.011c-13.378,1.876-28.958,5.754-37.066,10.684c-7.337,4.463-6.374,17.6-1.154,24.099            c5.509,6.862,11.974,6.495,19.779,2.905c5.123-2.357,11.293-7.609,17.667-13.492c0.16-5.126,0.339-10.256,0.543-15.375            C45.242,296.793,45.317,293.857,45.352,291.011z", strokeLinecap "round", strokeLinejoin "round", strokeMiterlimit "10", strokeWidth "6" ] [], text "    ", Svg.path [ d "            M429.717,297.195c-7.5-4.56-21.389-8.217-34.018-10.226c0.316,6.816,0.751,14.31,1.339,22.763c0.106,1.527,0.211,3.033,0.313,4.529            c4.959,4.379,9.68,8.068,13.74,9.937c7.807,3.591,14.27,3.958,19.779-2.904C436.091,314.795,437.055,301.656,429.717,297.195z", strokeLinecap "round", strokeLinejoin "round", strokeMiterlimit "10", strokeWidth "6" ] [], text "    ", Svg.path [ d "            M55.17,564.844c-9.854,17.521,15.9,31.951,29.25,19.801c10.908-9.928,19.518-18.348,38.256-21.098            c-14.35-5.906-27-13.281-37.752-21.871C71.807,546.805,61.188,554.146,55.17,564.844z", strokeLinecap "round", strokeLinejoin "round", strokeMiterlimit "10", strokeWidth "6" ] [], text "    ", Svg.path [ d "            M353.745,579.846c11.037,14.283,38.46,1.312,30.443-17.121c-5.267-12.111-15.218-22.156-27.677-28.195            c-8.158,7.618-17.849,14.689-29.308,20.867C339.883,561.402,346.096,569.946,353.745,579.846z", strokeLinecap "round", strokeLinejoin "round", strokeMiterlimit "10", strokeWidth "6" ] [], text "    ", Svg.path [ d "            M5.048,322.396c3.333-2.397,5.688-4.991,11.784-8.097", strokeLinecap "round", strokeLinejoin "round", strokeMiterlimit "10", strokeWidth "6" ] [], text "    ", Svg.path [ d "            M432.955,317.896c-3.333-2.397-5.688-4.991-11.783-8.097", strokeLinecap "round", strokeLinejoin "round", strokeMiterlimit "10", strokeWidth "6" ] [], text "    ", Svg.path [ d "            M60.871,584.57c0.9-4.951,3.6-13.275,11.7-20.476", strokeLinecap "round", strokeLinejoin "round", strokeMiterlimit "10", strokeWidth "6" ] [], text "    ", Svg.path [ d "            M376.05,582.961c-0.026-5.031-1.304-15.266-8.866-22.195", strokeLinecap "round", strokeLinejoin "round", strokeMiterlimit "10", strokeWidth "6" ] [], text "    ", Svg.path [ d "            M41.071,74.477c0-6.969,5.641-12.618,12.6-12.618c4.081,0,7.697,1.951,10,4.964c5.569-9.111,12.283-16.97,19.913-23.729            c-3.78-3.658-9.922-6.33-19.563-7.625c-31.05-4.174-46.917,11.166-50.542,31.725c-3.498,19.838,7.171,41.143,31.004,46.682            c2.46-9.685,5.474-18.569,8.95-26.793C46.585,86.954,41.071,81.365,41.071,74.477z", strokeLinecap "round", strokeLinejoin "round", strokeMiterlimit "10", strokeWidth "6" ] [], text "    ", Svg.path [ d "M53.671,61.859c-6.959,0-12.6,5.649-12.6,12.618c0,6.888,5.514,12.477,12.362,12.605            c2.479-5.866,5.191-11.399,8.112-16.638c0.687-1.231,1.4-2.434,2.126-3.622C61.368,63.81,57.751,61.859,53.671,61.859z" ] [], text "    ", Svg.path [ d "            M413.979,59.094c-3.625-20.56-19.492-35.899-50.541-31.725c-10.765,1.447-17.166,4.61-20.789,8.945            c6.867,5.93,13.257,12.745,19.272,20.518c0.292,0.377,0.57,0.758,0.857,1.136c2.296-3.095,5.963-5.109,10.108-5.109            c6.959,0,12.6,5.649,12.6,12.618c0,6.109-4.335,11.202-10.093,12.366c4.277,8.283,7.745,17.199,10.521,27.142            C407.677,98.434,417.33,78.095,413.979,59.094z", strokeLinecap "round", strokeLinejoin "round", strokeMiterlimit "10", strokeWidth "6" ] [], text "    ", Svg.path [ d "M385.486,65.477c0-6.969-5.641-12.618-12.6-12.618c-4.146,0-7.812,2.014-10.108,5.109            c4.815,6.345,9.007,12.886,12.615,19.875C381.151,76.679,385.486,71.586,385.486,65.477z" ] [], text "    ", Svg.path [ d "            M362.778,57.968c-0.287-0.378-0.565-0.759-0.857-1.136c-6.016-7.773-12.405-14.588-19.272-20.518            c-29.797-25.728-68.582-34.79-124.728-33.123c-48.682,1.447-100.473,9.906-134.337,39.903c-7.63,6.758-14.343,14.617-19.913,23.729            c-0.726,1.188-1.439,2.391-2.126,3.622c-2.921,5.239-5.633,10.771-8.112,16.638c-3.476,8.224-6.49,17.108-8.95,26.793            c-4.767,18.77-7.463,40.533-7.462,66.257c0.002,45.133,8.866,67.528,8.332,110.879c-0.035,2.846-0.11,5.782-0.231,8.821            c-0.204,5.119-0.383,10.249-0.543,15.375c-1.653,53.107-1.062,105.862-1.499,142.036c-0.401,33.204,14.646,62.704,41.845,84.433            c10.752,8.59,23.402,15.965,37.752,21.871c25.113,10.337,55.418,16.186,89.844,16.186c50.265,0,87.456-9.652,114.684-24.336            c11.459-6.178,21.149-13.249,29.308-20.867c20.359-19.008,31.17-41.422,36.009-61.896c11.47-48.523,9.966-84.08,4.831-158.371            c-0.103-1.496-0.207-3.002-0.313-4.529c-0.588-8.453-1.022-15.947-1.339-22.763c-1.733-37.343,0.064-54.317-0.479-96.937            c-0.463-36.271-3.195-63.161-9.306-85.047c-2.776-9.942-6.244-18.858-10.521-27.142C371.785,70.854,367.594,64.312,362.778,57.968z            ", strokeLinecap "round", strokeLinejoin "round", strokeMiterlimit "10", strokeWidth "6" ] [], text "        ", node "ellipse" [ cx "144.121", cy "91.595", rx "54.9", ry "53.1", strokeLinecap "round", strokeLinejoin "round", strokeMiterlimit "10", strokeWidth "6" ] [], text "    ", node "circle" [ cx "115.321", cy "94.294", r "18.9" ] [], text "    ", node "circle" [ cx "123.421", cy "98.794", fill "#FFFFFF", r "5.4" ] [], text "        ", node "ellipse" [ cx "281.821", cy "85.294", rx "54.9", ry "53.1", strokeLinecap "round", strokeLinejoin "round", strokeMiterlimit "10", strokeWidth "6" ] [], text "    ", node "circle" [ cx "253.021", cy "87.995", r "18.9" ] [], text "    ", node "circle" [ cx "261.121", cy "92.495", fill "#FFFFFF", r "5.4" ] [], text "    ", Svg.path [ d "            M214.968,170.343c-10.784,0.188-12.401,4.999-21.685,6.657c-0.328,5.727-0.745,13.566-1.163,22.896c-0.9,20.1,24.6,15.6,24.6,3.6            c0-9.129,0-25.714,0-33.132C216.16,170.343,215.583,170.333,214.968,170.343z", strokeLinecap "round", strokeLinejoin "round", strokeMiterlimit "10", strokeWidth "6" ] [], text "    ", Svg.path [ d "            M216.72,203.495c0,12,25.5,16.5,24.6-3.6c-0.429-9.582-0.857-17.59-1.189-23.353c-11.689-0.533-13.115-5.813-23.411-6.179            C216.72,177.78,216.72,194.365,216.72,203.495z", strokeLinecap "round", strokeLinejoin "round", strokeMiterlimit "10", strokeWidth "6" ] [], text "    ", Svg.path [ d "            M254.674,150.297c-4.354-4.685-9.521-7.238-16.425-8.471c-3.664,5.366-12.791,9.169-23.479,9.169            c-10.278,0-19.112-3.518-23.034-8.56c-7.391,1.417-12.753,4.185-17.15,9.26c-8.627,9.959-4.437,24.891,7.156,25.695            c4.957,0.344,8.624,0.131,11.541-0.391c9.284-1.658,10.901-6.469,21.685-6.657c0.615-0.01,1.192,0,1.752,0.02            c10.295,0.366,11.721,5.646,23.411,6.179c2.312,0.105,5.024,0.026,8.289-0.316C259.979,175.018,263.645,159.949,254.674,150.297z", strokeLinecap "round", strokeLinejoin "round", strokeMiterlimit "10", strokeWidth "6" ] [], text "    ", Svg.path [ d "M214.771,150.995c10.688,0,19.814-3.803,23.479-9.169c1.107-1.622,1.722-3.385,1.722-5.231c0-7.953-11.281-14.4-25.2-14.4            c-13.917,0-25.2,6.447-25.2,14.4c0,2.08,0.778,4.054,2.166,5.84C195.658,147.477,204.493,150.995,214.771,150.995z" ] [], text "" ] ]


{-| nothing special, just a plus sign
-}
plus : List (Svg.Attribute msg) -> Svg msg
plus attrs =
    svg ([ width "10", height "10", fill "gray" ] ++ attrs)
        [ rect [ x "4", y "0", height "10", width "2" ] []
        , rect [ x "0", y "4", height "2", width "10" ] []
        ]


{-| close by Tom Walsh of from the Noun Project
-}
close : List (Svg.Attribute msg) -> Svg msg
close attrs =
    svg (viewBox "-20 -20 140 140" :: attrs)
        [ Svg.path [ d "M59.1,50l34.6-34.6c2.4-2.4,2.4-6.3,0-8.7c-2.4-2.4-6.3-2.4-8.7,0L50.4,41.3L15.8,6.8  c-2.4-2.4-6.3-2.4-8.7,0c-2.4,2.4-2.4,6.3,0,8.7L41.7,50L7.2,84.6c-2.4,2.4-2.4,6.3,0,8.7c2.4,2.4,6.3,2.4,8.7,0l34.6-34.6  l34.6,34.6c2.4,2.4,6.3,2.4,8.7,0c2.4-2.4,2.4-6.3,0-8.7L59.1,50z" ] [] ]


{-| bottle by Amy Morgan from the Noun Project
-}
bottle : List (Svg.Attribute msg) -> Svg msg
bottle attrs =
    svg (viewBox "0 0 100 100" :: attrs)
        [ g [ transform "translate(0,-952.36218)" ]
            [ Svg.path [ d "M 48 14 C 46.466751 14 44.953616 14.49447 43.8125 15.5625 C 42.671384 16.63053 42 18.24694 42 20 A 2.0002 2.0002 0 0 0 42.09375 20.625 L 43 23.34375 L 43 35.46875 C 42.275057 37.02862 41.333506 37.28754 39.625 38.46875 C 38.717739 39.096 37.671697 40.02881 37 41.4375 C 36.328303 42.84619 36 44.63261 36 47 L 36 80 C 36 83.2894 38.710595 86 42 86 L 58 86 C 61.289405 86 64 83.2894 64 80 L 64 47 C 64 44.63261 63.671697 42.84619 63 41.4375 C 62.328303 40.02881 61.282261 39.096 60.375 38.46875 C 58.666494 37.28754 57.724943 37.02862 57 35.46875 L 57 23.34375 L 57.90625 20.625 A 2.0002 2.0002 0 0 0 58 20 C 58 18.24694 57.328616 16.63053 56.1875 15.5625 C 55.046384 14.49447 53.533249 14 52 14 L 48 14 z M 48 18 L 52 18 C 52.68275 18 53.163866 18.21464 53.46875 18.5 C 53.741418 18.7552 53.895444 19.17867 53.9375 19.84375 L 53.09375 22.375 A 2.0002 2.0002 0 0 0 53 23 L 53 36 A 2.0002 2.0002 0 0 0 53.15625 36.75 C 54.415858 39.89902 56.939523 40.9304 58.125 41.75 C 58.717739 42.1598 59.046697 42.49898 59.375 43.1875 C 59.703303 43.87602 60 45.0156 60 47 L 60 52 L 40 52 L 40 47 C 40 45.0156 40.296697 43.87602 40.625 43.1875 C 40.953303 42.49898 41.282261 42.1598 41.875 41.75 C 43.060477 40.9304 45.584142 39.89902 46.84375 36.75 A 2.0002 2.0002 0 0 0 47 36 L 47 23 A 2.0002 2.0002 0 0 0 46.90625 22.375 L 46.0625 19.84375 C 46.10456 19.17867 46.258582 18.7552 46.53125 18.5 C 46.836134 18.21464 47.31725 18 48 18 z M 40 56 L 60 56 L 60 70 L 40 70 L 40 56 z M 40 74 L 60 74 L 60 80 C 60 81.1426 59.142591 82 58 82 L 42 82 C 40.857409 82 40 81.1426 40 80 L 40 74 z ", transform "translate(0,952.36218)" ] []
            ]
        ]


{-| soda can by Nick Bluth from the Noun Project
-}
can : List (Svg.Attribute msg) -> Svg msg
can attrs =
    svg (viewBox "-10 -10 120 120" :: attrs)
        [ Svg.path [ d "M73.1,15.5c0-0.1-0.1-0.1-0.1-0.2c0,0-1.5-2.4-1.9-4.9c0.2-0.4,0.4-0.8,0.4-1.3c0.1-1.6-1.1-3.1-2.7-3.3  c-4.9-0.4-11.4-0.7-18.1-0.7c-6.8,0-13,0.2-17.7,0.7c-1.6,0.2-2.9,1.6-2.7,3.3c0.1,0.6,0.3,1.1,0.6,1.6c-0.2,1.2-0.8,1.9-1.5,2.7  c-0.4,0.4-0.7,0.8-1,1.4c-1.4,2.1-2.2,4.6-2.2,7.2v61.4c0,2.3,1.2,4.4,3.1,5.6c0.6,0.6,1.1,1.1,1.5,1.4c0.6,0.5,0.6,0.5,0.8,1.2  c0.8,1.9,2.7,3.8,17.3,3.8c0.5,0,0.9,0,1.4,0c0.5,0,1,0,1.6,0c15.3,0,17.3-1.8,18.1-3.8l0.1-0.4c0.4-0.9,0.4-0.9,1.2-1.8l0.4-0.4  c2-1.2,3.2-3.3,3.2-5.6V22C74.9,19.7,74.3,17.5,73.1,15.5z M69.9,22v8.5c-16.8,0.6-21.9,12-26,21.3c-3.2,7.3-5.9,13.2-12.7,14.1V22  c0-0.2,0-0.3,0-0.5c8.6-0.5,31.2-0.6,38.6,0C69.9,21.7,69.9,21.8,69.9,22z M31.2,68.9C40.1,68,43.4,60.4,46.7,53  c4.1-9.3,8.4-18.9,23.2-19.5v4C58.6,38.3,54.4,47,50.2,55.4c-4.1,8.6-8.1,16.6-19,17.5V68.9z M32.8,17.3c0.1-0.2,0.3-0.4,0.5-0.7  c0.9-1.1,2.5-2.9,2.7-6.1c4.1-0.3,9.2-0.5,14.7-0.5c5.6,0,11,0.2,15.4,0.5c0.3,3.4,2,6.3,2.6,7.2c0,0,0,0.1,0.1,0.1  c0.1,0.2,0.2,0.3,0.3,0.5c-8.2-0.5-27.9-0.4-36.9,0c0.2-0.3,0.3-0.6,0.5-0.9C32.7,17.5,32.7,17.4,32.8,17.3z M66.5,89.7L66.4,90  c-1,0.8-7.8,1.4-16,1.3c-7.5,0.1-14-0.5-15-1.3c-0.4-0.9-0.7-1.4-1.1-1.9c3.1,0.3,10.5,0.9,16.6,0.9c6.3,0,13.6-0.6,16.3-0.9  C67,88.5,66.8,88.9,66.5,89.7z M68.3,85c-0.1,0-0.2,0-0.3,0c-0.1,0-9.4,1-17.1,1c-7.6,0-17.7-1-17.8-1c-0.1,0-0.2,0-0.3,0  c-0.9,0-1.6-0.7-1.6-1.6v-7.5c12.8-0.9,17.5-10.6,21.7-19.2c4-8.3,7.5-15.5,17-16.2v42.8C69.9,84.3,69.2,85,68.3,85z" ] []
        ]


{-| lemon by Kirill Kolchenko from the Noun Project
-}
lemon : List (Svg.Attribute msg) -> Svg msg
lemon attrs =
    svg (viewBox "0 0 100 100" :: attrs)
        [ g []
            [ Svg.path [ d "M44,76C44,76,44,76,44,76c-5,0-9.8-1-13.9-2.9c-2.2-1-4.1-2.3-5.8-3.8c-0.9,0.2-1.9,0.3-2.8,0.3c-4.5,0-8.1-2.1-9.3-5.4    c-1.5-4.1,0.9-8.9,5.7-11.8c0.3-2.5,1-4.9,2.1-7.3c3.8-8,11.5-14.7,21.3-18.3c4.9-1.8,9.8-2.7,14.7-2.7c7.9,0,15,2.5,19.8,6.8    c0.8-0.1,1.7-0.2,2.5-0.2c4.5,0,8.1,2.1,9.3,5.4c1.5,4.1-0.8,8.9-5.6,11.7c-1.3,10.6-10.6,20.8-23.4,25.6C53.9,75.1,48.9,76,44,76    z M25,64.9c0.6,0,1.1,0.2,1.5,0.6c1.5,1.5,3.3,2.8,5.4,3.8c3.5,1.6,7.6,2.5,12.1,2.5c0,0,0,0,0,0c4.4,0,8.9-0.8,13.2-2.5    C69,64.9,77.4,55.7,78,46.3c0.1-0.7,0.5-1.4,1.2-1.8c3.4-1.7,5.4-4.8,4.6-7c-0.6-1.6-2.7-2.7-5.3-2.7c-0.9,0-1.8,0.1-2.7,0.3    c-0.7,0.2-1.5,0-2-0.6c-4-4.1-10.4-6.4-17.6-6.4c-4.4,0-8.9,0.8-13.2,2.5c-8.6,3.2-15.7,9.2-18.9,16.2c-1.1,2.3-1.7,4.7-1.8,7    c0,0.8-0.5,1.4-1.2,1.8c-3.5,1.7-5.5,4.8-4.7,7.1c0.6,1.6,2.7,2.7,5.3,2.7c0.9,0,1.9-0.1,2.9-0.4C24.6,64.9,24.8,64.9,25,64.9z" ] []
            ]
        , g []
            [ circle [ cx "35.8", cy "65.1", r "1.9" ] []
            , circle [ cx "43.7", cy "66.8", r "1.9" ] []
            , circle [ cx "52", cy "65.7", r "1.9" ] []
            , circle [ cx "59.5", cy "61.7", r "1.9" ] []
            , circle [ cx "41", cy "60.1", r "1.9" ] []
            , circle [ cx "48.7", cy "60.1", r "1.9" ] []
            ]
        ]


{-| search history by Karthik Srinivas from the Noun Project
-}
history : List (Svg.Attribute msg) -> Svg msg
history attrs =
    svg (viewBox "-10 -10 120 120" :: attrs)
        [ Svg.path [ d "M29,33.55L9.91,41.06c-2.28.9-4.1-.37-4.05-2.82L6.27,17.75C6.32,15.3,8,14.44,10,15.84l7.23,5A43.62,43.62,0,0,1,42.41,6.73,44.43,44.43,0,0,1,51.07,6,44,44,0,0,1,92.47,38q0.59,2.09,1,4.26,0.2,1.11.34,2.22c0,0.11,0,.21,0,0.32,0.08,0.64.15,1.28,0.19,1.92,0,0,0,.05,0,0.08a44,44,0,0,1-33.63,46l-0.25.06q-1.09.25-2.2,0.45a44.53,44.53,0,0,1-7.85.7,43.65,43.65,0,0,1-25-7.89C25,86,24.92,86,24.84,85.89A43.82,43.82,0,0,1,6.9,57.76a3.34,3.34,0,1,1,6.57-1.18,37.33,37.33,0,0,0,39.42,30.6H53c0.58,0,1.16-.11,1.75-0.18h0.14q0.94-.12,1.89-0.29A37.33,37.33,0,0,0,86,60.14l0.07-.25c0.11-.41.21-0.81,0.31-1.22,0.05-.22.11-0.45,0.16-0.67s0.11-.55.17-0.82,0.14-.73.2-1.1c0-.13,0-0.27.06-0.41a37.53,37.53,0,0,0-4.3-23.84l-0.14-.26c-0.2-.36-0.42-0.72-0.64-1.07l-0.37-.6-0.47-.7c-0.21-.31-0.41-0.61-0.63-0.91l-0.26-.35c-0.3-.4-0.59-0.8-0.9-1.19l0,0A37.55,37.55,0,0,0,61.94,14.63l-0.1,0c-0.45-.15-0.91-0.29-1.37-0.42L60,14l-1-.26-0.88-.21-0.63-.13-1.28-.24-0.24,0A37.37,37.37,0,0,0,22.78,24.72l6.69,4.66C31.48,30.78,31.26,32.65,29,33.55ZM66.87,66.87a3,3,0,0,0,0-4.24L53,48.76V25a3,3,0,0,0-6,0V50a3,3,0,0,0,.88,2.12L62.63,66.87A3,3,0,0,0,66.87,66.87Z" ] []
        ]


{-| upload by Landan Lloyd from the Noun Project
-}
load : List (Svg.Attribute msg) -> Svg msg
load attrs =
    svg (viewBox "0 0 100 100" :: attrs)
        [ g [ fillRule "evenodd" ]
            [ Svg.path
                [ d "M52.0440897,43.8847054 C50.8854039,42.7017585 49.0132064,42.703755 47.8530305,43.8988363 L37.9298426,54.1205764 C35.1098647,56.9486345 39.3408287,61.1917216 42.1608066,58.3636635 L45.5936309,54.90862 C46.3752882,54.1219034 47.0089466,54.3887776 47.0089466,55.491349 L47.0089466,69.2473409 C47.0089466,70.9001418 48.3516441,72.2400017 50.0004366,72.2400017 L50.0004366,72.2400017 C51.6525909,72.2400017 52.9919266,70.8911266 52.9919266,69.2473409 L52.9919266,55.491349 C52.9919266,54.3828001 53.6256059,54.1220556 54.4069511,54.90862 L57.8390694,58.3636635 C60.6600445,61.1917216 64.8900113,56.9486345 62.0700334,54.1205764 L52.0440897,43.8847054 Z"
                ]
                []
            , Svg.path
                [ d "M65,32.9970707 C65,33.5509732 64.5526348,34 64.0018463,34 L35.9981537,34 C35.4468886,34 35,33.5621186 35,32.9970707 L35,27 C35,25.3431458 33.6568542,24 32,24 C30.3431458,24 29,25.3431458 29,27 L29,36.0046024 C29,38.2033792 30.7932289,40 33.0004194,40 L66.9995806,40 C69.1974875,40 71,38.2154932 71,36.0046024 L71,27 C71,25.3431458 69.6568542,24 68,24 C66.3431458,24 65,25.3431458 65,27 L65,32.9970707 Z"
                , transform "translate(50.000000, 32.000000) rotate(180.000000) translate(-50.000000, -32.000000)"
                ]
                []
            ]
        ]


{-| Modified from https://codepen.io/abergin/pen/XpwRpE
-}
liquidBoxLoader : Html.Html a
liquidBoxLoader =
    Html.div [ class "box-loader" ]
        [ svg []
            [ defs []
                [ Svg.filter [ id "goo" ]
                    [ feGaussianBlur [ in_ "SourceGraphic", stdDeviation "1.5", result "blur" ] []
                    , feColorMatrix
                        [ in_ "blur"
                        , mode "matrix"
                        , values "1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 5 -2"
                        , result "gooey"
                        ]
                        []
                    , feComposite [ in_ "SourceGraphic", in2 "gooey", operator "atop" ] []
                    ]
                ]
            ]
        ]
