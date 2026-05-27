module HeroUI.Toast.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Toast (toast)
import HeroUI.Provider (provider)
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

data Color = Default | Primary | Secondary | Success | Warning | Danger

derive instance Generic Color _

data Variant = Solid | Bordered | Flat

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
  Bordered -> T.Bordered
  Flat -> T.Flat

mkToast :: { color :: Color, variant :: Variant } -> JSX
mkToast = component "ToastStory" \props -> React.do
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg" }
        [ toast
            { title: text "Notification"
            , description: text "This is a toast message."
            , color: toColor props.color
            , variant: toVariant props.variant
            }
            (text "")
        ]
    ]

default :: JSX
default = story "default" mkToast
  { color: enum Success
  , variant: enum Solid
  }
