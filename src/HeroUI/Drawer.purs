module HeroUI.Drawer where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps, createElementImpl)
import Data.Function.Uncurried (runFn3, runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Placement, Radius, Size, placementToString, radiusToString, sizeToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type DrawerProps r =
  ( size :: Size
  , radius :: Radius
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

drawer
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | DrawerProps () }
  => { | givenProps }
  -> kids
  -> JSX
drawer props kids = runFn4 createElementTransformImpl
  { size: sizeToString, radius: radiusToString, placement: placementToString }
  Raw.drawer props kids

type DrawerContentProps r =
  ( className :: String | r )

drawerContent
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | DrawerContentProps () }
  => { | givenProps }
  -> kids
  -> JSX
drawerContent = runFn3 createElementImpl Raw.drawerContent

type DrawerHeaderProps r =
  ( className :: String | r )

drawerHeader
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | DrawerHeaderProps () }
  => { | givenProps }
  -> kids
  -> JSX
drawerHeader = runFn3 createElementImpl Raw.drawerHeader

type DrawerBodyProps r =
  ( className :: String | r )

drawerBody
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | DrawerBodyProps () }
  => { | givenProps }
  -> kids
  -> JSX
drawerBody = runFn3 createElementImpl Raw.drawerBody

type DrawerFooterProps r =
  ( className :: String | r )

drawerFooter
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | DrawerFooterProps () }
  => { | givenProps }
  -> kids
  -> JSX
drawerFooter = runFn3 createElementImpl Raw.drawerFooter
