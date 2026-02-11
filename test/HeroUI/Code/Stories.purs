module HeroUI.Code.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Code (code)
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

mkCode :: { color :: Color, size :: Size } -> JSX
mkCode = component "CodeStory" \props -> React.do
  pure $ provider {} [ div { className: "dark bg-background text-foreground p-6 rounded-lg" }
    [ code { color: toColor props.color, size: toSize props.size } (text "npm install @heroui/react")
    ]
  ]

default :: JSX
default = story "default" mkCode
  { color: enum Default
  , size: enum Medium
  }
