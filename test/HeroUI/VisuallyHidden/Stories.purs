module HeroUI.VisuallyHidden.Stories (default) where

import Prelude hiding (div)

import React.Basic (JSX)
import HeroUI.VisuallyHidden (visuallyHidden)
import HeroUI.Provider (provider)
import Yoga.React (component)
import Yoga.React.DOM.HTML (div, span)
import Yoga.React.DOM.Internal (text)
import YogaStories.Story (story)

mkVisuallyHidden :: { label :: String } -> JSX
mkVisuallyHidden = component "VisuallyHiddenStory" \props -> React.do
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg flex items-center gap-4" }
        [ span {} [ text "Visible text" ]
        , visuallyHidden {} [ text props.label ]
        , span {} [ text "(hidden label exists for screen readers)" ]
        ]
    ]

default :: JSX
default = story "default" mkVisuallyHidden
  { label: "Accessible label" }
