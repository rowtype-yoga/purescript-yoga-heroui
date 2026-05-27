module HeroUI.Kbd.Stories (default) where

import Prelude hiding (div)

import React.Basic (JSX)
import HeroUI.Kbd (kbd)
import HeroUI.Provider (provider)
import HeroUI.Kbd as K
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Story (story)

mkKbd :: {} -> JSX
mkKbd = component "KbdStory" \_ -> React.do
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg flex items-center gap-4" }
        [ kbd { keys: [ K.Command ] } (text "K")
        , kbd { keys: [ K.Command, K.Shift ] } (text "N")
        , kbd { keys: [ K.Ctrl, K.Alt ] } (text "Delete")
        ]
    ]

default :: JSX
default = story "default" mkKbd {}
