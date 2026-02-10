module HeroUI.Popover where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps, createElementImpl)
import Data.Function.Uncurried (runFn3, runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Backdrop, Color, Placement, Radius, ShadowSize, Size, backdropToString, colorToString, placementToString, radiusToString, shadowToString, sizeToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

data TriggerType = TriggerDialog | TriggerMenu | TriggerListbox | TriggerTree | TriggerGrid

derive instance Eq TriggerType
derive instance Ord TriggerType

triggerTypeToString :: TriggerType -> String
triggerTypeToString = case _ of
  TriggerDialog -> "dialog"
  TriggerMenu -> "menu"
  TriggerListbox -> "listbox"
  TriggerTree -> "tree"
  TriggerGrid -> "grid"

type PopoverProps r =
  ( size :: Size
  , color :: Color
  , radius :: Radius
  , shadow :: ShadowSize
  , backdrop :: Backdrop
  , placement :: Placement
  , state :: Foreign
  , isOpen :: Boolean
  , defaultOpen :: Boolean
  , offset :: Int
  , containerPadding :: Int
  , crossOffset :: Int
  , triggerType :: TriggerType
  , showArrow :: Boolean
  , shouldFlip :: Boolean
  , triggerScaleOnOpen :: Boolean
  , shouldBlockScroll :: Boolean
  , shouldCloseOnScroll :: Boolean
  , isKeyboardDismissDisabled :: Boolean
  , shouldCloseOnBlur :: Boolean
  , motionProps :: Foreign
  , portalContainer :: Foreign
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  , onOpenChange :: EffectFn1 Boolean Unit
  , shouldCloseOnInteractOutside :: Foreign
  , onClose :: EffectFn1 Foreign Unit
  | r
  )

popover
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | PopoverProps () }
  => { | givenProps }
  -> kids
  -> JSX
popover props kids = runFn4 createElementTransformImpl
  { size: sizeToString, color: colorToString, radius: radiusToString, shadow: shadowToString, backdrop: backdropToString, placement: placementToString, triggerType: triggerTypeToString }
  Raw.popover props kids

type PopoverTriggerProps r =
  ( className :: String | r )

popoverTrigger
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | PopoverTriggerProps () }
  => { | givenProps }
  -> kids
  -> JSX
popoverTrigger = runFn3 createElementImpl Raw.popoverTrigger

type PopoverContentProps r =
  ( className :: String | r )

popoverContent
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | PopoverContentProps () }
  => { | givenProps }
  -> kids
  -> JSX
popoverContent = runFn3 createElementImpl Raw.popoverContent
