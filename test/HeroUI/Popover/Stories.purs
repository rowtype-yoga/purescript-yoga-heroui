module HeroUI.Popover.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Popover (popover, popoverTrigger, popoverContent)
import HeroUI.Provider (provider)
import HeroUI.Button as Btn
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div, p)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

data Placement = Top | Bottom | Left_ | Right_

derive instance Generic Placement _

data Color = Default | Primary | Secondary | Success | Warning | Danger

derive instance Generic Color _

toPlacement :: Placement -> T.Placement
toPlacement = case _ of
  Top -> T.PlacementTop
  Bottom -> T.PlacementBottom
  Left_ -> T.PlacementLeft
  Right_ -> T.PlacementRight

toColor :: Color -> T.Color
toColor = case _ of
  Default -> T.Default
  Primary -> T.Primary
  Secondary -> T.Secondary
  Success -> T.Success
  Warning -> T.Warning
  Danger -> T.Danger

mkPopover :: { placement :: Placement, color :: Color, showArrow :: Boolean } -> JSX
mkPopover = component "PopoverStory" \props -> React.do
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg flex items-center justify-center p-16" }
        [ popover
            { placement: toPlacement props.placement
            , color: toColor props.color
            , showArrow: props.showArrow
            }
            [ popoverTrigger {}
                [ Btn.button {} (text "Open Popover")
                ]
            , popoverContent {}
                [ div { className: "p-4" }
                    [ p {} (text "This is the popover content") ]
                ]
            ]
        ]
    ]

default :: JSX
default = story "default" mkPopover
  { placement: enum Bottom
  , color: enum Default
  , showArrow: true
  }
