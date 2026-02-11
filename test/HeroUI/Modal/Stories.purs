module HeroUI.Modal.Stories (default) where

import Prelude hiding (div)

import Data.Tuple.Nested ((/\))

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import React.Basic.Hooks as React
import React.Basic.Events (handler_)
import HeroUI.Modal (modal, modalContent, modalHeader, modalBody, modalFooter)
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

data Backdrop = Transparent | Opaque | Blur
derive instance Generic Backdrop _

toSize :: Size -> T.Size
toSize = case _ of
  Small -> T.Sm
  Medium -> T.Md
  Large -> T.Lg

toBackdrop :: Backdrop -> T.Backdrop
toBackdrop = case _ of
  Transparent -> T.Transparent
  Opaque -> T.Opaque
  Blur -> T.Blur

mkModal :: { size :: Size, backdrop :: Backdrop } -> JSX
mkModal = component "ModalStory" \props -> React.do
  isOpen /\ setIsOpen <- React.useState' false
  pure $ provider {} [ div { className: "dark bg-background text-foreground p-6 rounded-lg" }
    [ Btn.button { onPress: handler_ (setIsOpen true), color: T.Primary } (text "Open Modal")
    , modal
        { isOpen
        , size: toSize props.size
        , backdrop: toBackdrop props.backdrop
        , onOpenChange: mkEffectFn1 setIsOpen
        }
        [ modalContent {}
            [ modalHeader {} (text "Modal Title")
            , modalBody {} [ p {} (text "This is the modal body content.") ]
            , modalFooter {}
                [ Btn.button { color: T.Danger, variant: T.Light, onPress: handler_ (setIsOpen false) } (text "Close")
                , Btn.button { color: T.Primary, onPress: handler_ (setIsOpen false) } (text "Action")
                ]
            ]
        ]
    ]
  ]

default :: JSX
default = story "default" mkModal
  { size: enum Medium
  , backdrop: enum Opaque
  }
