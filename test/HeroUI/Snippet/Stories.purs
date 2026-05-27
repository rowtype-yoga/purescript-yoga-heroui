module HeroUI.Snippet.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Snippet (snippet)
import HeroUI.Provider (provider)
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

data Size = Small | Medium | Large

derive instance Generic Size _

toSize :: Size -> T.Size
toSize = case _ of
  Small -> T.Sm
  Medium -> T.Md
  Large -> T.Lg

mkSnippet :: { size :: Size } -> JSX
mkSnippet = component "SnippetStory" \props -> React.do
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg" }
        [ snippet { size: toSize props.size, codeString: "npm install @heroui/react" } (text "npm install @heroui/react")
        ]
    ]

default :: JSX
default = story "default" mkSnippet
  { size: enum Medium
  }
