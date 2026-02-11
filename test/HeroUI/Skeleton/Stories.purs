module HeroUI.Skeleton.Stories (default) where

import Prelude hiding (div)

import React.Basic (JSX)
import HeroUI.Skeleton (skeleton)
import HeroUI.Provider (provider)
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Story (story)

mkSkeleton :: { isLoaded :: Boolean } -> JSX
mkSkeleton = component "SkeletonStory" \props -> React.do
  pure $ provider {} [ div { className: "dark bg-background text-foreground p-6 rounded-lg flex flex-col gap-4 max-w-xs" }
    [ skeleton { isLoaded: props.isLoaded, className: "rounded-lg" }
        [ div { className: "h-24 bg-secondary rounded-lg" } (text "") ]
    , skeleton { isLoaded: props.isLoaded, className: "w-3/5 rounded-lg" }
        [ div { className: "h-3 bg-secondary rounded-lg" } (text "") ]
    , skeleton { isLoaded: props.isLoaded, className: "w-4/5 rounded-lg" }
        [ div { className: "h-3 bg-secondary rounded-lg" } (text "") ]
    , skeleton { isLoaded: props.isLoaded, className: "w-2/5 rounded-lg" }
        [ div { className: "h-3 bg-secondary rounded-lg" } (text "") ]
    ]
  ]

default :: JSX
default = story "default" mkSkeleton
  { isLoaded: false
  }
