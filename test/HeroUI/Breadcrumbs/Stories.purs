module HeroUI.Breadcrumbs.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Breadcrumbs (breadcrumbs, breadcrumbItem)
import HeroUI.Provider (provider)
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

data Size = Small | Medium | Large
derive instance Generic Size _

data Variant = Solid | Bordered | Light
derive instance Generic Variant _

toSize :: Size -> T.Size
toSize = case _ of
  Small -> T.Sm
  Medium -> T.Md
  Large -> T.Lg

toVariant :: Variant -> T.Variant
toVariant = case _ of
  Solid -> T.Solid
  Bordered -> T.Bordered
  Light -> T.Light

mkBreadcrumbs :: { size :: Size, variant :: Variant } -> JSX
mkBreadcrumbs = component "BreadcrumbsStory" \props -> React.do
  pure $ provider {} [ div { className: "dark bg-background text-foreground p-6 rounded-lg" }
    [ breadcrumbs { size: toSize props.size, variant: toVariant props.variant }
        [ breadcrumbItem {} (text "Home")
        , breadcrumbItem {} (text "Products")
        , breadcrumbItem {} (text "Electronics")
        , breadcrumbItem { isCurrent: true } (text "Phones")
        ]
    ]
  ]

default :: JSX
default = story "default" mkBreadcrumbs
  { size: enum Medium
  , variant: enum Solid
  }
