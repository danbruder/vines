module Ui exposing (centralMessage, layout)

import Css
import Css.Global
import Dict exposing (Dict)
import Gen.Route as Route exposing (Route)
import Heroicons.Outline
import Html.Styled as Html exposing (..)
import Html.Styled.Attributes as Attr exposing (..)
import Svg.Attributes
import Tailwind.Breakpoints as Breakpoints
import Tailwind.Utilities as Tw exposing (..)


centralMessage : String -> Html msg
centralMessage message =
    div
        [ css
            [ px_2
            , pl_3
            , text_sm
            , flex
            , justify_center
            , h_56
            , pt_16
            , h_screen
            ]
        ]
        [ text message ]


layout :
    { title : String
    , children : List (Html msg)
    , route : Route
    }
    -> Html msg
layout config =
    div []
        []
