module HeroUI.InputOTP.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.InputOTP (inputOtp)
import HeroUI.Provider (provider)
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

data Color = Default | Primary | Secondary | Success | Warning | Danger

derive instance Generic Color _

data Variant = Flat | Bordered | Underlined | Faded

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
  Flat -> T.Flat
  Bordered -> T.Bordered
  Underlined -> T.Underlined
  Faded -> T.Faded

toSize :: Size -> T.Size
toSize = case _ of
  Small -> T.Sm
  Medium -> T.Md
  Large -> T.Lg

mkInputOTP :: { length :: Int, color :: Color, variant :: Variant, size :: Size } -> JSX
mkInputOTP = component "InputOTPStory" \props -> React.do
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg" }
        [ inputOtp
            { length: props.length
            , color: toColor props.color
            , variant: toVariant props.variant
            , size: toSize props.size
            }
            (text "")
        ]
    ]

default :: JSX
default = story "default" mkInputOTP
  { length: 4
  , color: enum Default
  , variant: enum Flat
  , size: enum Medium
  }
