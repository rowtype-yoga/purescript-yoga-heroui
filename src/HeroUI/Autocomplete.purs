module HeroUI.Autocomplete where

import Prelude
import React.Basic (JSX)
import React.Basic.Events (EventHandler)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps, createElementImpl)
import Data.Function.Uncurried (runFn3, runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Color, LabelPlacement, Radius, Size, ValidationBehavior, Variant, colorToString, labelPlacementToString, radiusToString, sizeToString, validationBehaviorToString, variantToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

data MenuTrigger = MenuTriggerFocus | MenuTriggerInput | MenuTriggerManual

derive instance Eq MenuTrigger
derive instance Ord MenuTrigger

menuTriggerToString :: MenuTrigger -> String
menuTriggerToString = case _ of
  MenuTriggerFocus -> "focus"
  MenuTriggerInput -> "input"
  MenuTriggerManual -> "manual"

type AutocompleteProps r =
  ( label :: JSX
  , name :: String
  , variant :: Variant
  , color :: Color
  , size :: Size
  , radius :: Radius
  , items :: Foreign
  , defaultItems :: Foreign
  , inputValue :: String
  , defaultInputValue :: String
  , allowsCustomValue :: Boolean
  , allowsEmptyCollection :: Boolean
  , shouldCloseOnBlur :: Boolean
  , placeholder :: String
  , description :: JSX
  , menuTrigger :: MenuTrigger
  , labelPlacement :: LabelPlacement
  , selectedKey :: String
  , defaultSelectedKey :: String
  , disabledKeys :: Array String
  , errorMessage :: JSX
  , validate :: Foreign
  , validationBehavior :: ValidationBehavior
  , startContent :: JSX
  , endContent :: JSX
  , autoFocus :: Boolean
  , defaultFilter :: Foreign
  , filterOptions :: Foreign
  , maxListboxHeight :: Int
  , itemHeight :: Int
  , isVirtualized :: Boolean
  , isReadOnly :: Boolean
  , isRequired :: Boolean
  , isInvalid :: Boolean
  , isDisabled :: Boolean
  , fullWidth :: Boolean
  , selectorIcon :: JSX
  , clearIcon :: JSX
  , showScrollIndicators :: Boolean
  , scrollRef :: Foreign
  , inputProps :: Foreign
  , popoverProps :: Foreign
  , listboxProps :: Foreign
  , scrollShadowProps :: Foreign
  , selectorButtonProps :: Foreign
  , clearButtonProps :: Foreign
  , isClearable :: Boolean
  , disableAnimation :: Boolean
  , disableSelectorIconRotation :: Boolean
  , classNames :: Foreign
  , className :: String
  , onOpenChange :: EffectFn1 Boolean Unit
  , onInputChange :: EffectFn1 String Unit
  , onSelectionChange :: EffectFn1 Foreign Unit
  , onClose :: EffectFn1 Foreign Unit
  , onClear :: EffectFn1 Foreign Unit
  , onFocus :: EventHandler
  , onBlur :: EventHandler
  , onFocusChange :: EffectFn1 Boolean Unit
  , onKeyDown :: EventHandler
  , onKeyUp :: EventHandler
  | r
  )

autocomplete
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | AutocompleteProps () }
  => { | givenProps }
  -> kids
  -> JSX
autocomplete props kids = runFn4 createElementTransformImpl
  { variant: variantToString, color: colorToString, size: sizeToString, radius: radiusToString, menuTrigger: menuTriggerToString, labelPlacement: labelPlacementToString, validationBehavior: validationBehaviorToString }
  Raw.autocomplete props kids

type AutocompleteItemProps r =
  ( key :: String
  , textValue :: String
  , description :: JSX
  , startContent :: JSX
  , endContent :: JSX
  , selectedIcon :: Foreign
  , href :: String
  , target :: String
  , rel :: String
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

autocompleteItem
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | AutocompleteItemProps () }
  => { | givenProps }
  -> kids
  -> JSX
autocompleteItem = runFn3 createElementImpl Raw.autocompleteItem

type AutocompleteSectionProps r =
  ( title :: String
  , items :: Foreign
  , hideSelectedIcon :: Boolean
  , showDivider :: Boolean
  , dividerProps :: Foreign
  , classNames :: Foreign
  , className :: String
  | r
  )

autocompleteSection
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | AutocompleteSectionProps () }
  => { | givenProps }
  -> kids
  -> JSX
autocompleteSection = runFn3 createElementImpl Raw.autocompleteSection
