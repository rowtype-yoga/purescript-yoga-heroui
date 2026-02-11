module HeroUI.Pagination.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Pagination (pagination)
import HeroUI.Provider (provider)
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

data Color = Default | Primary | Secondary | Success | Warning | Danger
derive instance Generic Color _

data Variant = Solid | Bordered | Light | Flat | Faded
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
  Flat -> T.Flat
  Faded -> T.Faded

toSize :: Size -> T.Size
toSize = case _ of
  Small -> T.Sm
  Medium -> T.Md
  Large -> T.Lg

mkPagination :: { color :: Color, variant :: Variant, size :: Size, showControls :: Boolean } -> JSX
mkPagination = component "PaginationStory" \props -> React.do
  pure $ provider {} [ div { className: "dark bg-background text-foreground p-6 rounded-lg" }
    [ pagination
        { total: 10
        , initialPage: 1
        , color: toColor props.color
        , variant: toVariant props.variant
        , size: toSize props.size
        , showControls: props.showControls
        }
        (text "")
    ]
  ]

default :: JSX
default = story "default" mkPagination
  { color: enum Primary
  , variant: enum Flat
  , size: enum Medium
  , showControls: true
  }
