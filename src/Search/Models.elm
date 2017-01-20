module Search.Models exposing (..)

type alias Model =
  { query : Query
  , focus : FocusBool
  }

type alias Query = String
type alias FocusBool = Bool
