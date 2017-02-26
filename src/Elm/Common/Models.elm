module Common.Models exposing (..)


type HttpResult a
    = Succeed a
    | Fetching
    | Fail String


type Animation
    = Animated
    | Static
