module Common.Util exposing (..)

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
