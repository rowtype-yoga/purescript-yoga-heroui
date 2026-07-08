module HeroUI.Button.Stories (primary, sizes) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Button as Btn
import HeroUI.Provider (provider)
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

data Color = Default | Primary | Secondary | Success | Warning | Danger

derive instance Generic Color _

data Variant = Solid | Bordered | Light | Flat | Faded | Shadow | Ghost

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
  Ghost -> T.Ghost

toSize :: Size -> T.Size
toSize = case _ of
  Small -> T.Sm
  Medium -> T.Md
  Large -> T.Lg

mkButton :: { label :: String, color :: Color, variant :: Variant, size :: Size, isDisabled :: Boolean } -> JSX
mkButton = component "ButtonStory" \props -> React.do
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg flex flex-col items-start gap-4" }
        [ Btn.button
            { color: toColor props.color
            , variant: toVariant props.variant
            , size: toSize props.size
            , isDisabled: props.isDisabled
            }
            (text props.label)
        , Btn.buttonGroup
            { color: toColor props.color
            , variant: toVariant props.variant
            , size: toSize props.size
            , isDisabled: props.isDisabled
            }
            [ Btn.button {} (text "One")
            , Btn.button {} (text "Two")
            , Btn.button {} (text "Three")
            ]
        ]
    ]

primary :: JSX
primary = story "primary" mkButton
  { label: "Click me"
  , color: enum Primary
  , variant: enum Solid
  , size: enum Medium
  , isDisabled: false
  }

sizes :: JSX
sizes = story "sizes" mkButton
  { label: "Button"
  , color: enum Default
  , variant: enum Solid
  , size: enum Large
  , isDisabled: false
  }
