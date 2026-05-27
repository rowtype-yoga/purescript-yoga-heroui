module HeroUI.Chip.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Chip (chip)
import HeroUI.Provider (provider)
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

data Color = Default | Primary | Secondary | Success | Warning | Danger

derive instance Generic Color _

data Variant = Solid | Bordered | Light | Flat | Faded | Shadow | Dot

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
  Shadow -> T.Shadow
  Dot -> T.Dot

toSize :: Size -> T.Size
toSize = case _ of
  Small -> T.Sm
  Medium -> T.Md
  Large -> T.Lg

mkChip :: { label :: String, color :: Color, variant :: Variant, size :: Size } -> JSX
mkChip = component "ChipStory" \props -> React.do
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg flex items-center gap-4" }
        [ chip { color: toColor props.color, variant: toVariant props.variant, size: toSize props.size } (text props.label) ]
    ]

default :: JSX
default = story "default" mkChip
  { label: "Chip"
  , color: enum Primary
  , variant: enum Solid
  , size: enum Medium
  }
