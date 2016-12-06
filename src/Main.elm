module Main exposing (main)

import Html exposing (Html)
import Html.Attributes


diagram =
    "elmview.png"


main =
    Html.main_ []
        [ Html.canvas
            [ Html.Attributes.style
                [ ( "backgroundImage", "url(" ++ diagram ++ ")" )
                ]
            ]
            []
        , drawLabels [ { text = "main", x = 200, y = 400 } ]
        ]


type alias Label =
    { text : String
    , x : Int
    , y : Int
    }


drawLabels : List Label -> Html Never
drawLabels labels =
    let
        formatLabel { text, x, y } =
            Html.label
                [ Html.Attributes.style
                    [ ( "position", "absolute" )
                    , ( "top", (toString y) ++ "px" )
                    , ( "left", (toString x) ++ "px" )
                    ]
                ]
                [ Html.text text ]
    in
        Html.div [] (List.map formatLabel labels)
