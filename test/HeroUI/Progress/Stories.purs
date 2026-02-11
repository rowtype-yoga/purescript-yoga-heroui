module HeroUI.Progress.Stories (linear, circular) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Progress as Prog
import HeroUI.Provider (provider)
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum, slider)
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

mkProgress :: { value :: Number, color :: Color, size :: Size } -> JSX
mkProgress = component "ProgressStory" \props -> React.do
  pure $ provider {} [ div { className: "dark bg-background text-foreground p-6 rounded-lg w-64" }
    [ Prog.progress
        { value: props.value
        , color: toColor props.color
        , size: toSize props.size
        , showValueLabel: true
        }
        (text "")
    ]
  ]

linear :: JSX
linear = story "linear" mkProgress
  { value: slider { value: 65.0, min: 0.0, max: 100.0, step: 1.0 }
  , color: enum Primary
  , size: enum Medium
  }

mkCircular :: { value :: Number, color :: Color } -> JSX
mkCircular = component "CircularProgressStory" \props -> React.do
  pure $ provider {} [ div { className: "dark bg-background text-foreground p-6 rounded-lg flex items-center gap-4" }
    [ Prog.circularProgress
        { value: props.value
        , color: toColor props.color
        , showValueLabel: true
        }
        (text "")
    ]
  ]

circular :: JSX
circular = story "circular" mkCircular
  { value: slider { value: 70.0, min: 0.0, max: 100.0, step: 1.0 }
  , color: enum Success
  }
