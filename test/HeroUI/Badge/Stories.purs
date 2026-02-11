module HeroUI.Badge.Stories (basic, colors) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Badge (badge)
import HeroUI.Provider (provider)
import HeroUI.Avatar (avatar)
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

data Color = Default | Primary | Secondary | Success | Warning | Danger
derive instance Generic Color _

data Variant = Solid | Flat | Faded
derive instance Generic Variant _

toColor :: Color -> T.Color
toColor = case _ of
  Default -> T.Default
  Primary -> T.Primary
  Secondary -> T.Secondary
  Success -> T.Success
  Warning -> T.Warning
  Danger -> T.Danger

toVariant :: Variant -> T.Variant
toVariant = case _ of
  Solid -> T.Solid
  Flat -> T.Flat
  Faded -> T.Faded

mkBadge :: { content :: String, color :: Color, variant :: Variant } -> JSX
mkBadge = component "BadgeStory" \props -> React.do
  pure $ provider {} [ div { className: "dark bg-background text-foreground p-6 rounded-lg flex items-center gap-4" }
    [ badge { content: text props.content, color: toColor props.color, variant: toVariant props.variant }
        [ avatar { name: "User" } (text "") ]
    ]
  ]

basic :: JSX
basic = story "basic" mkBadge
  { content: "5"
  , color: enum Danger
  , variant: enum Solid
  }

colors :: JSX
colors = story "colors" mkBadge
  { content: "New"
  , color: enum Primary
  , variant: enum Flat
  }
