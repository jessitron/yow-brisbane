module Main exposing (main)

import Html exposing (Html)
import Html.Attributes
import Html.Events


diagram =
    "elmbp.png"


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = model
        , update = update
        , view = view
        }



-- MODEL


type alias Model =
    { labels : List Label , newLabel : String }


model : Model
model =
    { labels = [ { text = "main", x = 200, y = 400 } ] , newLabel = "" }



-- UPDATE


type Msg
    = Noop
    | NewLabel String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Noop ->
            model

        NewLabel string ->
            { model | newLabel = string }



-- VIEW


view : Model -> Html Msg
view model =
    Html.main_ []
        [ Html.canvas
            [ Html.Attributes.style
                [ ( "backgroundImage", "url(" ++ diagram ++ ")" )
                ]
            ]
            []
        , drawLabels model.labels
        ]


type alias Label =
    { text : String
    , x : Int
    , y : Int
    }


drawLabels : List Label -> Html Msg
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


newLabelInput : Model -> Html Msg
newLabelInput model =
    Html.input
        [ Html.Attributes.id "newLabel"
        , Html.Events.onInput NewLabel
        , Html.Attributes.value model.newLabel
        ]
        []

