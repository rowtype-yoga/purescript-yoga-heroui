module HeroUI.Calendar.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Calendar (FirstDayOfWeek(..), calendar, rangeCalendar)
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

mkCalendar :: { color :: Color } -> JSX
mkCalendar = component "CalendarStory" \props -> React.do
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg flex flex-wrap gap-6" }
        [ calendar
            { color: toColor props.color
            , firstDayOfWeek: Mon
            , visibleMonths: 1
            }
            (text "")
        , rangeCalendar
            { color: toColor props.color
            , firstDayOfWeek: Mon
            , visibleMonths: 2
            }
            (text "")
        ]
    ]

default :: JSX
default = story "default" mkCalendar
  { color: enum Primary
  }
