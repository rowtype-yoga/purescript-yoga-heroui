module HeroUI.Tabs.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Tabs (tabs, tab)
import HeroUI.Provider (provider)
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div, p)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

data Color = Default | Primary | Secondary | Success | Warning | Danger
derive instance Generic Color _

data Variant = Solid | Bordered | Light | Underlined
derive instance Generic Variant _

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

toVariant :: Variant -> T.Variant
toVariant = case _ of
  Solid -> T.Solid
  Bordered -> T.Bordered
  Light -> T.Light
  Underlined -> T.Underlined

toSize :: Size -> T.Size
toSize = case _ of
  Small -> T.Sm
  Medium -> T.Md
  Large -> T.Lg

mkTabs :: { color :: Color, variant :: Variant, size :: Size } -> JSX
mkTabs = component "TabsStory" \props -> React.do
  pure $ provider {} [ div { className: "dark bg-background text-foreground p-6 rounded-lg" }
    [ tabs
        { color: toColor props.color
        , variant: toVariant props.variant
        , size: toSize props.size
        }
        [ tab { title: text "Photos" } [ p {} (text "Photos tab content") ]
        , tab { title: text "Music" } [ p {} (text "Music tab content") ]
        , tab { title: text "Videos" } [ p {} (text "Videos tab content") ]
        ]
    ]
  ]

default :: JSX
default = story "default" mkTabs
  { color: enum Primary
  , variant: enum Solid
  , size: enum Medium
  }
