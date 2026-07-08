module HeroUI.Navbar.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
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
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg" }
        [ N.navbar
            { maxWidth: toMaxWidth props.maxWidth
            , isBordered: props.isBordered
            , isMenuDefaultOpen: true
            }
            [ N.navbarContent { justify: N.JustifyStart }
                [ N.navbarMenuToggle { srOnlyText: "Open navigation" } (text "")
                , N.navbarBrand {} (text "ACME")
                ]
            , N.navbarContent { justify: N.JustifyCenter }
                [ N.navbarItem {} [ link { color: T.Default, href: "#" } (text "Home") ]
                , N.navbarItem { isActive: true } [ link { color: T.Primary, href: "#" } (text "Products") ]
                , N.navbarItem {} [ link { color: T.Default, href: "#" } (text "About") ]
                ]
            , N.navbarMenu {}
                [ N.navbarMenuItem {} [ link { color: T.Default, href: "#" } (text "Profile") ]
                , N.navbarMenuItem { isActive: true } [ link { color: T.Primary, href: "#" } (text "Dashboard") ]
                , N.navbarMenuItem {} [ link { color: T.Default, href: "#" } (text "Settings") ]
                ]
            ]
        ]
    ]

default :: JSX
default = story "default" mkNavbar
  { maxWidth: enum Large
  , isBordered: true
  }
