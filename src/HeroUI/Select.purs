module HeroUI.Select where

import Prelude
import React.Basic (JSX)
import React.Basic.Events (EventHandler)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps, createElementImpl)
import Data.Function.Uncurried (runFn3, runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Color, LabelPlacement, Radius, SelectionMode, Size, Variant, colorToString, labelPlacementToString, radiusToString, selectionModeToString, sizeToString, variantToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type SelectProps r =
  ( items :: Foreign
  , selectionMode :: SelectionMode
  , selectedKeys :: Array String
  , disabledKeys :: Array String
  , defaultSelectedKeys :: Array String
  , variant :: Variant
  , color :: Color
  , size :: Size
  , radius :: Radius
  , placeholder :: String
  , labelPlacement :: LabelPlacement
  , label :: JSX
  , description :: JSX
  , errorMessage :: JSX
  , startContent :: JSX
  , endContent :: JSX
  , selectorIcon :: JSX
  , scrollRef :: Foreign
  , spinnerRef :: Foreign
  , maxListboxHeight :: Int
  , itemHeight :: Int
  , isVirtualized :: Boolean
  , fullWidth :: Boolean
  , isOpen :: Boolean
  , defaultOpen :: Boolean
  , isRequired :: Boolean
  , isDisabled :: Boolean
  , isMultiline :: Boolean
  , isInvalid :: Boolean
  , isClearable :: Boolean
  , showScrollIndicators :: Boolean
  , autoFocus :: Boolean
  , disallowEmptySelection :: Boolean
  , disableAnimation :: Boolean
  , disableSelectorIconRotation :: Boolean
  , hideEmptyContent :: Boolean
  , popoverProps :: Foreign
  , listboxProps :: Foreign
  , scrollShadowProps :: Foreign
  , classNames :: Foreign
  , className :: String
  , onClose :: EffectFn1 Foreign Unit
  , onOpenChange :: EffectFn1 Boolean Unit
  , onSelectionChange :: EffectFn1 Foreign Unit
  , onClear :: EffectFn1 Foreign Unit
  , onChange :: EffectFn1 Foreign Unit
  , renderValue :: Foreign
  | r
  )

select
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | SelectProps () }
  => { | givenProps }
  -> kids
  -> JSX
select props kids = runFn4 createElementTransformImpl
  { selectionMode: selectionModeToString, variant: variantToString, color: colorToString, size: sizeToString, radius: radiusToString, labelPlacement: labelPlacementToString }
  Raw.select props kids

type SelectItemProps r =
  ( key :: String
  , title :: JSX
  , textValue :: String
  , description :: JSX
  , startContent :: JSX
  , endContent :: JSX
  , selectedIcon :: Foreign
  , href :: String
  , target :: String
  , isDisabled :: Boolean
  , isSelected :: Boolean
  , isReadOnly :: Boolean
  , hideSelectedIcon :: Boolean
  , showDivider :: Boolean
  , classNames :: Foreign
  , className :: String
  , onPress :: EventHandler
  , onPressStart :: EventHandler
  , onPressEnd :: EventHandler
  , onPressChange :: EffectFn1 Boolean Unit
  , onPressUp :: EventHandler
  , onKeyDown :: EventHandler
  , onKeyUp :: EventHandler
  | r
  )

selectItem
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | SelectItemProps () }
  => { | givenProps }
  -> kids
  -> JSX
selectItem = runFn3 createElementImpl Raw.selectItem

type SelectSectionProps r =
  ( title :: String
  , items :: Foreign
  , hideSelectedIcon :: Boolean
  , showDivider :: Boolean
  , dividerProps :: Foreign
  , classNames :: Foreign
  , className :: String
  | r
  )

selectSection
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | SelectSectionProps () }
  => { | givenProps }
  -> kids
  -> JSX
selectSection = runFn3 createElementImpl Raw.selectSection
