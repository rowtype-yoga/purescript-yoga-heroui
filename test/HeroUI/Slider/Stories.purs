module HeroUI.Slider.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Slider as S
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

mkSlider :: { color :: Color, size :: Size, showSteps :: Boolean } -> JSX
mkSlider = component "SliderStory" \props -> React.do
  pure $ provider {} [ div { className: "dark bg-background text-foreground p-6 rounded-lg max-w-md" }
    [ S.slider
        { label: text "Volume"
        , color: toColor props.color
        , size: toSize props.size
        , step: 10.0
        , minValue: 0.0
        , maxValue: 100.0
        , showSteps: props.showSteps
        }
        (text "")
    ]
  ]

default :: JSX
default = story "default" mkSlider
  { color: enum Primary
  , size: enum Medium
  , showSteps: true
  }
