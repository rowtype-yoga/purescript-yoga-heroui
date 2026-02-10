module HeroUI.Tabs where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps, createElementImpl)
import Data.Function.Uncurried (runFn3, runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Color, Placement, Radius, Size, Variant, colorToString, placementToString, radiusToString, sizeToString, variantToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

data KeyboardActivation = KbAutomatic | KbManual

derive instance Eq KeyboardActivation
derive instance Ord KeyboardActivation

keyboardActivationToString :: KeyboardActivation -> String
keyboardActivationToString = case _ of
  KbAutomatic -> "automatic"
  KbManual -> "manual"

type TabsProps r =
  ( variant :: Variant
  , color :: Color
  , size :: Size
  , radius :: Radius
  , fullWidth :: Boolean
  , items :: Foreign
  , disabledKeys :: Array String
  , selectedKey :: String
  , defaultSelectedKey :: String
  , shouldSelectOnPressUp :: Boolean
  , keyboardActivation :: KeyboardActivation
  , disableCursorAnimation :: Boolean
  , isDisabled :: Boolean
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , placement :: Placement
  , isVertical :: Boolean
  , destroyInactiveTabPanel :: Boolean
  , className :: String
  , onSelectionChange :: EffectFn1 Foreign Unit
  | r
  )

tabs
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | TabsProps () }
  => { | givenProps }
  -> kids
  -> JSX
tabs props kids = runFn4 createElementTransformImpl
  { variant: variantToString, color: colorToString, size: sizeToString, radius: radiusToString, keyboardActivation: keyboardActivationToString, placement: placementToString }
  Raw.tabs props kids

type TabProps r =
  ( title :: JSX
  , titleValue :: String
  , href :: String
  , target :: String
  , rel :: String
  , download :: Foreign
  , ping :: String
  , referrerPolicy :: String
  , shouldSelectOnPressUp :: Boolean
  , className :: String
  | r
  )

tab
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | TabProps () }
  => { | givenProps }
  -> kids
  -> JSX
tab = runFn3 createElementImpl Raw.tab
