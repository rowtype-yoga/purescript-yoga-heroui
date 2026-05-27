module HeroUI.Input.Stories (basic, textarea_) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Input as Inp
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

mkInput :: { label :: String, placeholder :: String, color :: Color, variant :: Variant, size :: Size } -> JSX
mkInput = component "InputStory" \props -> React.do
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg max-w-xs" }
        [ Inp.input
            { label: text props.label
            , placeholder: props.placeholder
            , color: toColor props.color
            , variant: toVariant props.variant
            , size: toSize props.size
            }
            (text "")
        ]
    ]

basic :: JSX
basic = story "basic" mkInput
  { label: "Email"
  , placeholder: "Enter your email"
  , color: enum Default
  , variant: enum Flat
  , size: enum Medium
  }

mkTextarea :: { label :: String, placeholder :: String, color :: Color, variant :: Variant } -> JSX
mkTextarea = component "TextareaStory" \props -> React.do
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg max-w-xs" }
        [ Inp.textarea
            { label: text props.label
            , placeholder: props.placeholder
            , color: toColor props.color
            , variant: toVariant props.variant
            }
            (text "")
        ]
    ]

textarea_ :: JSX
textarea_ = story "textarea" mkTextarea
  { label: "Description"
  , placeholder: "Enter a description..."
  , color: enum Default
  , variant: enum Flat
  }
