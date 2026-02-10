module HeroUI.Modal where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps, createElementImpl)
import Data.Function.Uncurried (runFn3, runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Backdrop, Placement, Radius, ScrollBehavior, ShadowSize, Size, backdropToString, placementToString, radiusToString, scrollBehaviorToString, shadowToString, sizeToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type ModalProps r =
  ( size :: Size
  , radius :: Radius
  , shadow :: ShadowSize
  , backdrop :: Backdrop
  , scrollBehavior :: ScrollBehavior
  , placement :: Placement
  , isOpen :: Boolean
  , defaultOpen :: Boolean
  , isDismissable :: Boolean
  , isKeyboardDismissDisabled :: Boolean
  , shouldBlockScroll :: Boolean
  , hideCloseButton :: Boolean
  , closeButton :: JSX
  , motionProps :: Foreign
  , portalContainer :: Foreign
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  , onOpenChange :: EffectFn1 Boolean Unit
  , onClose :: EffectFn1 Foreign Unit
  | r
  )

modal
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | ModalProps () }
  => { | givenProps }
  -> kids
  -> JSX
modal props kids = runFn4 createElementTransformImpl
  { size: sizeToString, radius: radiusToString, shadow: shadowToString, backdrop: backdropToString, scrollBehavior: scrollBehaviorToString, placement: placementToString }
  Raw.modal props kids

type ModalContentProps r =
  ( className :: String | r )

modalContent
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | ModalContentProps () }
  => { | givenProps }
  -> kids
  -> JSX
modalContent = runFn3 createElementImpl Raw.modalContent

type ModalHeaderProps r =
  ( className :: String | r )

modalHeader
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | ModalHeaderProps () }
  => { | givenProps }
  -> kids
  -> JSX
modalHeader = runFn3 createElementImpl Raw.modalHeader

type ModalBodyProps r =
  ( className :: String | r )

modalBody
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | ModalBodyProps () }
  => { | givenProps }
  -> kids
  -> JSX
modalBody = runFn3 createElementImpl Raw.modalBody

type ModalFooterProps r =
  ( className :: String | r )

modalFooter
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | ModalFooterProps () }
  => { | givenProps }
  -> kids
  -> JSX
modalFooter = runFn3 createElementImpl Raw.modalFooter
