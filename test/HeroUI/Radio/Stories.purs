module HeroUI.Radio.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Radio (radioGroup, radio)
import HeroUI.Provider (provider)
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

data Color = Default | Primary | Secondary | Success | Warning | Danger

derive instance Generic Color _

data Size = Small | Medium | Large

derive instance Generic Size _

data Orientation = Horizontal | Vertical

derive instance Generic Orientation _

toColor :: Color -> T.Color
toColor = case _ of
  Default -> T.Default
  Primary -> T.Primary
  Secondary -> T.Secondary
  Success -> T.Success
  Warning -> T.Warning
  Danger -> T.Danger

toSize :: Size -> T.Size
toSize = case _ of
  Small -> T.Sm
  Medium -> T.Md
  Large -> T.Lg

toOrientation :: Orientation -> T.Orientation
toOrientation = case _ of
  Horizontal -> T.Horizontal
  Vertical -> T.Vertical

mkRadio :: { color :: Color, size :: Size, orientation :: Orientation } -> JSX
mkRadio = component "RadioStory" \props -> React.do
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg" }
        [ radioGroup
            { label: text "Select a plan"
            , color: toColor props.color
            , size: toSize props.size
            , orientation: toOrientation props.orientation
            }
            [ radio { value: "free" } (text "Free")
            , radio { value: "pro" } (text "Pro")
            , radio { value: "enterprise" } (text "Enterprise")
            ]
        ]
    ]

default :: JSX
default = story "default" mkRadio
  { color: enum Primary
  , size: enum Medium
  , orientation: enum Vertical
  }
