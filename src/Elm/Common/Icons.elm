module Common.Icons exposing (..)

import Svg exposing (..)
import Svg.Attributes exposing (..)


{-| bottle by Amy Morgan from the Noun Project
-}
bottle : String -> Svg a
bottle iconClass =
    svg [ class iconClass, viewBox "0 0 100 100" ]
        [ g [ transform "translate(0,-952.36218)" ]
            [ Svg.path [ d "M 48 14 C 46.466751 14 44.953616 14.49447 43.8125 15.5625 C 42.671384 16.63053 42 18.24694 42 20 A 2.0002 2.0002 0 0 0 42.09375 20.625 L 43 23.34375 L 43 35.46875 C 42.275057 37.02862 41.333506 37.28754 39.625 38.46875 C 38.717739 39.096 37.671697 40.02881 37 41.4375 C 36.328303 42.84619 36 44.63261 36 47 L 36 80 C 36 83.2894 38.710595 86 42 86 L 58 86 C 61.289405 86 64 83.2894 64 80 L 64 47 C 64 44.63261 63.671697 42.84619 63 41.4375 C 62.328303 40.02881 61.282261 39.096 60.375 38.46875 C 58.666494 37.28754 57.724943 37.02862 57 35.46875 L 57 23.34375 L 57.90625 20.625 A 2.0002 2.0002 0 0 0 58 20 C 58 18.24694 57.328616 16.63053 56.1875 15.5625 C 55.046384 14.49447 53.533249 14 52 14 L 48 14 z M 48 18 L 52 18 C 52.68275 18 53.163866 18.21464 53.46875 18.5 C 53.741418 18.7552 53.895444 19.17867 53.9375 19.84375 L 53.09375 22.375 A 2.0002 2.0002 0 0 0 53 23 L 53 36 A 2.0002 2.0002 0 0 0 53.15625 36.75 C 54.415858 39.89902 56.939523 40.9304 58.125 41.75 C 58.717739 42.1598 59.046697 42.49898 59.375 43.1875 C 59.703303 43.87602 60 45.0156 60 47 L 60 52 L 40 52 L 40 47 C 40 45.0156 40.296697 43.87602 40.625 43.1875 C 40.953303 42.49898 41.282261 42.1598 41.875 41.75 C 43.060477 40.9304 45.584142 39.89902 46.84375 36.75 A 2.0002 2.0002 0 0 0 47 36 L 47 23 A 2.0002 2.0002 0 0 0 46.90625 22.375 L 46.0625 19.84375 C 46.10456 19.17867 46.258582 18.7552 46.53125 18.5 C 46.836134 18.21464 47.31725 18 48 18 z M 40 56 L 60 56 L 60 70 L 40 70 L 40 56 z M 40 74 L 60 74 L 60 80 C 60 81.1426 59.142591 82 58 82 L 42 82 C 40.857409 82 40 81.1426 40 80 L 40 74 z ", transform "translate(0,952.36218)" ] []
            ]
        ]


{-| soda can by Nick Bluth from the Noun Project
-}
can : String -> Svg a
can iconClass =
    svg [ class iconClass, viewBox "-10 -10 120 120" ]
        [ Svg.path [ d "M73.1,15.5c0-0.1-0.1-0.1-0.1-0.2c0,0-1.5-2.4-1.9-4.9c0.2-0.4,0.4-0.8,0.4-1.3c0.1-1.6-1.1-3.1-2.7-3.3  c-4.9-0.4-11.4-0.7-18.1-0.7c-6.8,0-13,0.2-17.7,0.7c-1.6,0.2-2.9,1.6-2.7,3.3c0.1,0.6,0.3,1.1,0.6,1.6c-0.2,1.2-0.8,1.9-1.5,2.7  c-0.4,0.4-0.7,0.8-1,1.4c-1.4,2.1-2.2,4.6-2.2,7.2v61.4c0,2.3,1.2,4.4,3.1,5.6c0.6,0.6,1.1,1.1,1.5,1.4c0.6,0.5,0.6,0.5,0.8,1.2  c0.8,1.9,2.7,3.8,17.3,3.8c0.5,0,0.9,0,1.4,0c0.5,0,1,0,1.6,0c15.3,0,17.3-1.8,18.1-3.8l0.1-0.4c0.4-0.9,0.4-0.9,1.2-1.8l0.4-0.4  c2-1.2,3.2-3.3,3.2-5.6V22C74.9,19.7,74.3,17.5,73.1,15.5z M69.9,22v8.5c-16.8,0.6-21.9,12-26,21.3c-3.2,7.3-5.9,13.2-12.7,14.1V22  c0-0.2,0-0.3,0-0.5c8.6-0.5,31.2-0.6,38.6,0C69.9,21.7,69.9,21.8,69.9,22z M31.2,68.9C40.1,68,43.4,60.4,46.7,53  c4.1-9.3,8.4-18.9,23.2-19.5v4C58.6,38.3,54.4,47,50.2,55.4c-4.1,8.6-8.1,16.6-19,17.5V68.9z M32.8,17.3c0.1-0.2,0.3-0.4,0.5-0.7  c0.9-1.1,2.5-2.9,2.7-6.1c4.1-0.3,9.2-0.5,14.7-0.5c5.6,0,11,0.2,15.4,0.5c0.3,3.4,2,6.3,2.6,7.2c0,0,0,0.1,0.1,0.1  c0.1,0.2,0.2,0.3,0.3,0.5c-8.2-0.5-27.9-0.4-36.9,0c0.2-0.3,0.3-0.6,0.5-0.9C32.7,17.5,32.7,17.4,32.8,17.3z M66.5,89.7L66.4,90  c-1,0.8-7.8,1.4-16,1.3c-7.5,0.1-14-0.5-15-1.3c-0.4-0.9-0.7-1.4-1.1-1.9c3.1,0.3,10.5,0.9,16.6,0.9c6.3,0,13.6-0.6,16.3-0.9  C67,88.5,66.8,88.9,66.5,89.7z M68.3,85c-0.1,0-0.2,0-0.3,0c-0.1,0-9.4,1-17.1,1c-7.6,0-17.7-1-17.8-1c-0.1,0-0.2,0-0.3,0  c-0.9,0-1.6-0.7-1.6-1.6v-7.5c12.8-0.9,17.5-10.6,21.7-19.2c4-8.3,7.5-15.5,17-16.2v42.8C69.9,84.3,69.2,85,68.3,85z" ] []
        ]


{-| lemon by Kirill Kolchenko from the Noun Project
-}
lemon : String -> Svg a
lemon iconClass =
    svg [ class iconClass, viewBox "0 0 100 100" ]
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
history : String -> Svg a
history iconClass =
    svg [ class iconClass, viewBox "-10 -10 120 120" ]
        [ Svg.path [ d "M29,33.55L9.91,41.06c-2.28.9-4.1-.37-4.05-2.82L6.27,17.75C6.32,15.3,8,14.44,10,15.84l7.23,5A43.62,43.62,0,0,1,42.41,6.73,44.43,44.43,0,0,1,51.07,6,44,44,0,0,1,92.47,38q0.59,2.09,1,4.26,0.2,1.11.34,2.22c0,0.11,0,.21,0,0.32,0.08,0.64.15,1.28,0.19,1.92,0,0,0,.05,0,0.08a44,44,0,0,1-33.63,46l-0.25.06q-1.09.25-2.2,0.45a44.53,44.53,0,0,1-7.85.7,43.65,43.65,0,0,1-25-7.89C25,86,24.92,86,24.84,85.89A43.82,43.82,0,0,1,6.9,57.76a3.34,3.34,0,1,1,6.57-1.18,37.33,37.33,0,0,0,39.42,30.6H53c0.58,0,1.16-.11,1.75-0.18h0.14q0.94-.12,1.89-0.29A37.33,37.33,0,0,0,86,60.14l0.07-.25c0.11-.41.21-0.81,0.31-1.22,0.05-.22.11-0.45,0.16-0.67s0.11-.55.17-0.82,0.14-.73.2-1.1c0-.13,0-0.27.06-0.41a37.53,37.53,0,0,0-4.3-23.84l-0.14-.26c-0.2-.36-0.42-0.72-0.64-1.07l-0.37-.6-0.47-.7c-0.21-.31-0.41-0.61-0.63-0.91l-0.26-.35c-0.3-.4-0.59-0.8-0.9-1.19l0,0A37.55,37.55,0,0,0,61.94,14.63l-0.1,0c-0.45-.15-0.91-0.29-1.37-0.42L60,14l-1-.26-0.88-.21-0.63-.13-1.28-.24-0.24,0A37.37,37.37,0,0,0,22.78,24.72l6.69,4.66C31.48,30.78,31.26,32.65,29,33.55ZM66.87,66.87a3,3,0,0,0,0-4.24L53,48.76V25a3,3,0,0,0-6,0V50a3,3,0,0,0,.88,2.12L62.63,66.87A3,3,0,0,0,66.87,66.87Z" ] []
        ]