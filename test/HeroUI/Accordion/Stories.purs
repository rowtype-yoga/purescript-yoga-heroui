module HeroUI.Accordion.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Accordion (accordion, accordionItem)
import HeroUI.Provider (provider)
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div, p)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

data Variant = Light | Bordered | Shadow | Splitted

derive instance Generic Variant _

toVariant :: Variant -> T.Variant
toVariant = case _ of
  Light -> T.Light
  Bordered -> T.Bordered
  Shadow -> T.Shadow
  Splitted -> T.Splitted

mkAccordion :: { variant :: Variant } -> JSX
mkAccordion = component "AccordionStory" \props -> React.do
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg max-w-md" }
        [ accordion { variant: toVariant props.variant }
            [ accordionItem { title: text "Accordion Item 1" } [ p {} (text "Content for the first item.") ]
            , accordionItem { title: text "Accordion Item 2" } [ p {} (text "Content for the second item.") ]
            , accordionItem { title: text "Accordion Item 3" } [ p {} (text "Content for the third item.") ]
            ]
        ]
    ]

default :: JSX
default = story "default" mkAccordion
  { variant: enum Light
  }
