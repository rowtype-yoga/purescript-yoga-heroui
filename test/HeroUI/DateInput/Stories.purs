module HeroUI.DateInput.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.DateInput (dateInput)
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

mkDateInput :: { variant :: Variant, size :: Size } -> JSX
mkDateInput = component "DateInputStory" \props -> React.do
  pure $ provider {} [ div { className: "dark bg-background text-foreground p-6 rounded-lg max-w-xs" }
    [ dateInput
        { label: text "Birth date"
        , variant: toVariant props.variant
        , size: toSize props.size
        }
        (text "")
    ]
  ]

default :: JSX
default = story "default" mkDateInput
  { variant: enum Flat
  , size: enum Medium
  }
