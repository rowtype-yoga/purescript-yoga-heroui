module HeroUI.User.Stories (default) where

import Prelude hiding (div)

import React.Basic (JSX)
import HeroUI.User (user)
import HeroUI.Provider (provider)
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Story (story)

mkUser :: { name :: String } -> JSX
mkUser = component "UserStory" \props -> React.do
  pure $ provider {} [ div { className: "dark bg-background text-foreground p-6 rounded-lg" }
    [ user { name: props.name, description: text "Product Designer" } (text "")
    ]
  ]

default :: JSX
default = story "default" mkUser
  { name: "Jane Doe"
  }
