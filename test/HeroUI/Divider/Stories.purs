module HeroUI.Divider.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Divider (divider)
import HeroUI.Provider (provider)
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div, p)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

data Orientation = Horizontal | Vertical
derive instance Generic Orientation _

toOrientation :: Orientation -> T.Orientation
toOrientation = case _ of
  Horizontal -> T.Horizontal
  Vertical -> T.Vertical

mkDivider :: { orientation :: Orientation } -> JSX
mkDivider = component "DividerStory" \props -> React.do
  pure $ provider {} [ div { className: "dark bg-background text-foreground p-6 rounded-lg max-w-md space-y-4" }
    [ p {} (text "Above the divider")
    , divider { orientation: toOrientation props.orientation } (text "")
    , p {} (text "Below the divider")
    ]
  ]

default :: JSX
default = story "default" mkDivider
  { orientation: enum Horizontal
  }
