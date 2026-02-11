module HeroUI.Link.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Link (link)
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

data Underline = None | Active | Hover | Focus | Always
derive instance Generic Underline _

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

toUnderline :: Underline -> T.UnderlineStyle
toUnderline = case _ of
  None -> T.UnderlineNone
  Active -> T.UnderlineActive
  Hover -> T.UnderlineHover
  Focus -> T.UnderlineFocus
  Always -> T.UnderlineAlways

mkLink :: { color :: Color, size :: Size, underline :: Underline, isExternal :: Boolean } -> JSX
mkLink = component "LinkStory" \props -> React.do
  pure $ provider {} [ div { className: "dark bg-background text-foreground p-6 rounded-lg flex items-center gap-4" }
    [ link
        { color: toColor props.color
        , size: toSize props.size
        , underline: toUnderline props.underline
        , isExternal: props.isExternal
        , href: "https://heroui.com"
        }
        (text "HeroUI Link")
    ]
  ]

default :: JSX
default = story "default" mkLink
  { color: enum Primary
  , size: enum Medium
  , underline: enum None
  , isExternal: false
  }
