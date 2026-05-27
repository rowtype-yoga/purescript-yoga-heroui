module HeroUI.Image.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import HeroUI.Image (image)
import HeroUI.Provider (provider)
import HeroUI.Types as T
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

data Radius = None | Small | Medium | Large | Full

derive instance Generic Radius _

data Shadow = None_ | Small_ | Medium_ | Large_

derive instance Generic Shadow _

toRadius :: Radius -> T.Radius
toRadius = case _ of
  None -> T.RadiusNone
  Small -> T.RadiusSm
  Medium -> T.RadiusMd
  Large -> T.RadiusLg
  Full -> T.RadiusFull

toShadow :: Shadow -> T.ShadowSize
toShadow = case _ of
  None_ -> T.ShadowNone
  Small_ -> T.ShadowSm
  Medium_ -> T.ShadowMd
  Large_ -> T.ShadowLg

mkImage :: { radius :: Radius, shadow :: Shadow, isZoomed :: Boolean, isBlurred :: Boolean } -> JSX
mkImage = component "ImageStory" \props -> React.do
  pure $ provider {}
    [ div { className: "dark bg-background text-foreground p-6 rounded-lg max-w-xs" }
        [ image
            { src: "https://heroui.com/images/hero-card-complete.jpeg"
            , alt: "HeroUI demo image"
            , width: 300
            , radius: toRadius props.radius
            , shadow: toShadow props.shadow
            , isZoomed: props.isZoomed
            , isBlurred: props.isBlurred
            }
            (text "")
        ]
    ]

default :: JSX
default = story "default" mkImage
  { radius: enum Medium
  , shadow: enum Small_
  , isZoomed: false
  , isBlurred: false
  }
