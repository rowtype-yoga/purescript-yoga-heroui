module HeroUI.Alert.Stories (info, warning) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Alert (alert)
import HeroUI.Provider (provider)
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

data Color = Default | Primary | Secondary | Success | Warning | Danger

derive instance Generic Color _

data Variant = Solid | Bordered | Flat | Faded

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
  Faded -> T.Faded

mkAlert :: { title :: String, description :: String, color :: Color, variant :: Variant } -> JSX
mkAlert = component "AlertStory" \props -> React.do
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg max-w-md" }
        [ alert
            { title: text props.title
            , description: text props.description
            , color: toColor props.color
            , variant: toVariant props.variant
            }
            (text "")
        ]
    ]

info :: JSX
info = story "info" mkAlert
  { title: "Heads up!"
  , description: "You can add components to your app using the CLI."
  , color: enum Primary
  , variant: enum Flat
  }

warning :: JSX
warning = story "warning" mkAlert
  { title: "Warning"
  , description: "Your session will expire in 5 minutes."
  , color: enum Warning
  , variant: enum Bordered
  }
