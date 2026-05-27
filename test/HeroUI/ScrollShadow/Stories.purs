module HeroUI.ScrollShadow.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.ScrollShadow (scrollShadow)
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

mkScrollShadow :: { orientation :: Orientation } -> JSX
mkScrollShadow = component "ScrollShadowStory" \props -> React.do
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg max-w-xs" }
        [ scrollShadow
            { orientation: toOrientation props.orientation
            , className: "h-48"
            }
            [ p {} (text "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
            , p {} (text "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
            , p {} (text "Ut enim ad minim veniam, quis nostrud exercitation ullamco.")
            , p {} (text "Duis aute irure dolor in reprehenderit in voluptate velit.")
            , p {} (text "Excepteur sint occaecat cupidatat non proident.")
            , p {} (text "Sunt in culpa qui officia deserunt mollit anim id est laborum.")
            , p {} (text "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
            , p {} (text "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
            ]
        ]
    ]

default :: JSX
default = story "default" mkScrollShadow
  { orientation: enum Vertical
  }
