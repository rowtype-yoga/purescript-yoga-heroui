module HeroUI.Table.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Table (table, tableHeader, tableColumn, tableBody, tableRow, tableCell)
import HeroUI.Provider (provider)
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

data Color = Default | Primary | Secondary | Success | Warning | Danger

derive instance Generic Color _

toColor :: Color -> T.Color
toColor = case _ of
  Default -> T.Default
  Primary -> T.Primary
  Secondary -> T.Secondary
  Success -> T.Success
  Warning -> T.Warning
  Danger -> T.Danger

mkTable :: { color :: Color, isStriped :: Boolean, isCompact :: Boolean } -> JSX
mkTable = component "TableStory" \props -> React.do
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg" }
        [ table
            { color: toColor props.color
            , isStriped: props.isStriped
            , isCompact: props.isCompact
            }
            [ tableHeader {}
                [ tableColumn { key: "name" } (text "Name")
                , tableColumn { key: "role" } (text "Role")
                , tableColumn { key: "status" } (text "Status")
                ]
            , tableBody {}
                [ tableRow { key: "1" }
                    [ tableCell {} (text "Tony Reichert")
                    , tableCell {} (text "CEO")
                    , tableCell {} (text "Active")
                    ]
                , tableRow { key: "2" }
                    [ tableCell {} (text "Zoey Lang")
                    , tableCell {} (text "Technical Lead")
                    , tableCell {} (text "Paused")
                    ]
                , tableRow { key: "3" }
                    [ tableCell {} (text "Jane Fisher")
                    , tableCell {} (text "Senior Developer")
                    , tableCell {} (text "Active")
                    ]
                ]
            ]
        ]
    ]

default :: JSX
default = story "default" mkTable
  { color: enum Default
  , isStriped: false
  , isCompact: false
  }
