module HeroUI.Ripple.Stories (default) where

import Prelude hiding (div)

import React.Basic (JSX)
import HeroUI.Ripple (ripple)
import HeroUI.Provider (provider)
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Story (story)

mkRipple :: {} -> JSX
mkRipple = component "RippleStory" \_ -> React.do
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg flex items-center gap-4" }
        [ div { className: "relative overflow-hidden rounded-lg bg-default-100 p-8 cursor-pointer" }
            [ text "Click for ripple"
            , ripple {} (text "")
            ]
        ]
    ]

default :: JSX
default = story "default" mkRipple {}
