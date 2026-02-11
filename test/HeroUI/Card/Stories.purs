module HeroUI.Card.Stories (basic, pressable) where

import Prelude hiding (div)

import Data.Maybe (Maybe(..))
import React.Basic (JSX)
import HeroUI.Card (card, cardHeader, cardBody, cardFooter)
import HeroUI.Provider (provider)
import HeroUI.Button as Btn
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div, p)
import Yoga.React.DOM.Internal (text)
import YogaStories.Story (story)

mkCard :: { title :: String, body :: String, footer :: Maybe String } -> JSX
mkCard = component "CardStory" \props -> React.do
  pure $ provider {} [ div { className: "dark bg-background text-foreground p-6 rounded-lg max-w-sm" }
    [ card {}
        [ cardHeader {} (text props.title)
        , cardBody {} [ p {} (text props.body) ]
        , case props.footer of
            Nothing -> mempty
            Just f -> cardFooter {} [ Btn.button { color: T.Primary } (text f) ]
        ]
    ]
  ]

basic :: JSX
basic = story "basic" mkCard
  { title: "Card Title"
  , body: "This is a HeroUI card component with header, body, and footer."
  , footer: Just "Action"
  }

pressable :: JSX
pressable = story "pressable" mkCard
  { title: "Simple Card"
  , body: "A minimal card without a footer."
  , footer: Nothing :: Maybe String
  }
