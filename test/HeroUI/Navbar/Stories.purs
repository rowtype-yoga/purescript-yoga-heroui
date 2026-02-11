module HeroUI.Navbar.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Navbar (navbar, navbarBrand, navbarContent, navbarItem)
import HeroUI.Provider (provider)
import HeroUI.Link (link)
import HeroUI.Navbar as N
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

data MaxWidth = Small | Medium | Large | XL | Full
derive instance Generic MaxWidth _

toMaxWidth :: MaxWidth -> N.MaxWidth
toMaxWidth = case _ of
  Small -> N.MaxSm
  Medium -> N.MaxMd
  Large -> N.MaxLg
  XL -> N.MaxXl
  Full -> N.MaxFull

mkNavbar :: { maxWidth :: MaxWidth, isBordered :: Boolean } -> JSX
mkNavbar = component "NavbarStory" \props -> React.do
  pure $ provider {} [ div { className: "dark bg-background text-foreground p-6 rounded-lg" }
    [ navbar { maxWidth: toMaxWidth props.maxWidth, isBordered: props.isBordered }
        [ navbarBrand {} (text "ACME")
        , navbarContent {}
            [ navbarItem {} [ link { color: T.Default, href: "#" } (text "Home") ]
            , navbarItem { isActive: true } [ link { color: T.Primary, href: "#" } (text "Products") ]
            , navbarItem {} [ link { color: T.Default, href: "#" } (text "About") ]
            ]
        ]
    ]
  ]

default :: JSX
default = story "default" mkNavbar
  { maxWidth: enum Large
  , isBordered: true
  }
