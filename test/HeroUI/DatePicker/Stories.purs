module HeroUI.DatePicker.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.DatePicker (datePicker)
import HeroUI.Provider (provider)
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

data Variant = Flat | Bordered | Underlined | Faded

derive instance Generic Variant _

data Size = Small | Medium | Large

derive instance Generic Size _

data Color = Default | Primary | Secondary | Success | Warning | Danger

derive instance Generic Color _

toVariant :: Variant -> T.Variant
toVariant = case _ of
  Flat -> T.Flat
  Bordered -> T.Bordered
  Underlined -> T.Underlined
  Faded -> T.Faded

toSize :: Size -> T.Size
toSize = case _ of
  Small -> T.Sm
  Medium -> T.Md
  Large -> T.Lg

toColor :: Color -> T.Color
toColor = case _ of
  Default -> T.Default
  Primary -> T.Primary
  Secondary -> T.Secondary
  Success -> T.Success
  Warning -> T.Warning
  Danger -> T.Danger

mkDatePicker :: { variant :: Variant, size :: Size, color :: Color } -> JSX
mkDatePicker = component "DatePickerStory" \props -> React.do
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg max-w-xs" }
        [ datePicker
            { label: text "Select a date"
            , variant: toVariant props.variant
            , size: toSize props.size
            , color: toColor props.color
            }
            (text "")
        ]
    ]

default :: JSX
default = story "default" mkDatePicker
  { variant: enum Flat
  , size: enum Medium
  , color: enum Primary
  }
