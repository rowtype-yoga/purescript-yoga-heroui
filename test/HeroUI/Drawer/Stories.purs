module HeroUI.Drawer.Stories (default) where

import Prelude hiding (div)

import Data.Tuple.Nested ((/\))

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import React.Basic.Hooks as React
import React.Basic.Events (handler_)
import HeroUI.Drawer (drawer, drawerContent, drawerHeader, drawerBody, drawerFooter)
import HeroUI.Provider (provider)
import HeroUI.Button as Btn
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div, p)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)
import Effect.Uncurried (mkEffectFn1)

data Size = Small | Medium | Large
derive instance Generic Size _

data Placement = Top | Right_ | Bottom | Left_
derive instance Generic Placement _

toSize :: Size -> T.ModalSize
toSize = case _ of
  Small -> T.ModalSizeSm
  Medium -> T.ModalSizeMd
  Large -> T.ModalSizeLg

toPlacement :: Placement -> T.Placement
toPlacement = case _ of
  Top -> T.PlacementTop
  Right_ -> T.PlacementRight
  Bottom -> T.PlacementBottom
  Left_ -> T.PlacementLeft

mkDrawer :: { size :: Size, placement :: Placement } -> JSX
mkDrawer = component "DrawerStory" \props -> React.do
  isOpen /\ setIsOpen <- React.useState' false
  pure $ provider {} [ div { className: "dark bg-background text-foreground p-6 rounded-lg" }
    [ Btn.button { onPress: handler_ (setIsOpen true) } (text "Open Drawer")
    , drawer
        { isOpen
        , size: toSize props.size
        , placement: toPlacement props.placement
        , onOpenChange: mkEffectFn1 setIsOpen
        }
        [ drawerContent {}
            [ drawerHeader {} (text "Drawer Title")
            , drawerBody {} [ p {} (text "This is the drawer body content.") ]
            , drawerFooter {}
                [ Btn.button { color: T.Primary, onPress: handler_ (setIsOpen false) } (text "Close")
                ]
            ]
        ]
    ]
  ]

default :: JSX
default = story "default" mkDrawer
  { size: enum Medium
  , placement: enum Right_
  }
