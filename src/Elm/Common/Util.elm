module Common.Util exposing (..)

import String exposing (..)
import Common.Models exposing (..)


httpResultDefault : HttpResult a -> a -> a
httpResultDefault hr default =
    case hr of
        Succeed result ->
            result

        Fetching ->
            default

        Fail _ ->
            default


colorNameToHex : String -> Maybe String
colorNameToHex name =
    let
        str =
            toLower name
    in
        case str of
            "brown" ->
                Just "#302d2c"

            "tan" ->
                Just "#9E865D"

            "yellow" ->
                Just "#AFAF64"

            "light blue" ->
                Just "#64AFAE"

            "purple" ->
                Just "#AB64AF"

            "red" ->
                Just "#AF64640"

            "dark red" ->
                Just "#7A4C4C"

            "orange" ->
                Just "#AF7264"

            str ->
                Nothing
