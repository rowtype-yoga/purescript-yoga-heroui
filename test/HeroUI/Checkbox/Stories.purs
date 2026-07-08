module HeroUI.Checkbox.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Checkbox (checkbox, checkboxGroup)
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

mkCheckbox :: { color :: Color, size :: Size, defaultSelected :: Boolean } -> JSX
mkCheckbox = component "CheckboxStory" \props -> React.do
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg flex flex-col items-start gap-4" }
        [ checkbox
            { color: toColor props.color
            , size: toSize props.size
            , defaultSelected: props.defaultSelected
            }
            (text "I agree to the terms")
        , checkboxGroup
            { color: toColor props.color
            , size: toSize props.size
            , label: "Notification channels"
            , orientation: T.Vertical
            }
            [ checkbox { value: "email" } (text "Email")
            , checkbox { value: "sms" } (text "SMS")
            , checkbox { value: "push" } (text "Push")
            ]
        ]
    ]

default :: JSX
default = story "default" mkCheckbox
  { color: enum Primary
  , size: enum Medium
  , defaultSelected: false
  }
