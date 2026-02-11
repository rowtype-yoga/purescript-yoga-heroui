module HeroUI.Spacer.Stories (default) where

import Prelude hiding (div)

import React.Basic (JSX)
import HeroUI.Spacer (spacer)
import HeroUI.Provider (provider)
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Story (story)

mkSpacer :: {} -> JSX
mkSpacer = component "SpacerStory" \_ -> React.do
  pure $ provider {} [ div { className: "dark bg-background text-foreground p-6 rounded-lg flex items-center" }
    [ div { className: "bg-primary text-white p-4 rounded" } (text "Left")
    , spacer { x: 4.0 } (text "")
    , div { className: "bg-secondary text-white p-4 rounded" } (text "Right")
    ]
  ]

default :: JSX
default = story "default" mkSpacer {}
