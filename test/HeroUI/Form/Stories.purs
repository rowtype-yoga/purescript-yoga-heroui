module HeroUI.Form.Stories (default) where

import Prelude hiding (div)

import React.Basic (JSX)
import HeroUI.Form (form)
import HeroUI.Provider (provider)
import HeroUI.Input (input)
import HeroUI.Button as Btn
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Story (story)

mkForm :: {} -> JSX
mkForm = component "FormStory" \_ -> React.do
  pure $ provider {} [ div { className: "dark bg-background text-foreground p-6 rounded-lg max-w-sm" }
    [ form {}
        [ div { className: "flex flex-col gap-4" }
            [ input { label: text "Name", placeholder: "Enter your name", isRequired: true } (text "")
            , input { label: text "Email", placeholder: "Enter your email", isRequired: true } (text "")
            , Btn.button { color: T.Primary } (text "Submit")
            ]
        ]
    ]
  ]

default :: JSX
default = story "default" mkForm {}
