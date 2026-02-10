module HeroUI.Dropdown where

import Prelude
import React.Basic (JSX)
import React.Basic.Events (EventHandler)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps, createElementImpl)
import Data.Function.Uncurried (runFn3, runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Color, SelectionMode, Variant, colorToString, selectionModeToString, variantToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

data DropdownType = DropdownTypeMenu | DropdownTypeListbox

derive instance Eq DropdownType
derive instance Ord DropdownType

dropdownTypeToString :: DropdownType -> String
dropdownTypeToString = case _ of
  DropdownTypeMenu -> "menu"
  DropdownTypeListbox -> "listbox"

data DropdownTriggerAction = TriggerPress | TriggerLongPress

derive instance Eq DropdownTriggerAction
derive instance Ord DropdownTriggerAction

dropdownTriggerActionToString :: DropdownTriggerAction -> String
dropdownTriggerActionToString = case _ of
  TriggerPress -> "press"
  TriggerLongPress -> "longPress"

type DropdownProps r =
  ( type :: DropdownType
  , trigger :: DropdownTriggerAction
  , isDisabled :: Boolean
  , closeOnSelect :: Boolean
  , shouldBlockScroll :: Boolean
  , popoverProps :: Foreign
  , className :: String
  , onOpenChange :: EffectFn1 Boolean Unit
  , shouldCloseOnInteractOutside :: Foreign
  , onClose :: EffectFn1 Foreign Unit
  | r
  )

dropdown
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | DropdownProps () }
  => { | givenProps }
  -> kids
  -> JSX
dropdown props kids = runFn4 createElementTransformImpl
  { type: dropdownTypeToString, trigger: dropdownTriggerActionToString }
  Raw.dropdown props kids

type DropdownTriggerProps r =
  ( className :: String | r )

dropdownTrigger
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | DropdownTriggerProps () }
  => { | givenProps }
  -> kids
  -> JSX
dropdownTrigger = runFn3 createElementImpl Raw.dropdownTrigger

type DropdownMenuProps r =
  ( items :: Foreign
  , variant :: Variant
  , color :: Color
  , selectionMode :: SelectionMode
  , selectedKeys :: Array String
  , disabledKeys :: Array String
  , defaultSelectedKeys :: Array String
  , disallowEmptySelection :: Boolean
  , autoFocus :: Foreign
  , topContent :: JSX
  , bottomContent :: JSX
  , emptyContent :: JSX
  , hideEmptyContent :: Boolean
  , hideSelectedIcon :: Boolean
  , shouldFocusWrap :: Boolean
  , closeOnSelect :: Boolean
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , itemClasses :: Foreign
  , className :: String
  , onAction :: EffectFn1 Foreign Unit
  , onSelectionChange :: EffectFn1 Foreign Unit
  , onClose :: EffectFn1 Foreign Unit
  | r
  )

dropdownMenu
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | DropdownMenuProps () }
  => { | givenProps }
  -> kids
  -> JSX
dropdownMenu props kids = runFn4 createElementTransformImpl
  { variant: variantToString, color: colorToString, selectionMode: selectionModeToString }
  Raw.dropdownMenu props kids

type DropdownSectionProps r =
  ( title :: String
  , items :: Foreign
  , hideSelectedIcon :: Boolean
  , showDivider :: Boolean
  , dividerProps :: Foreign
  , classNames :: Foreign
  , itemClasses :: Foreign
  , className :: String
  | r
  )

dropdownSection
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | DropdownSectionProps () }
  => { | givenProps }
  -> kids
  -> JSX
dropdownSection = runFn3 createElementImpl Raw.dropdownSection

type DropdownItemProps r =
  ( key :: String
  , title :: JSX
  , textValue :: String
  , description :: JSX
  , shortcut :: JSX
  , startContent :: JSX
  , endContent :: JSX
  , selectedIcon :: Foreign
  , showDivider :: Boolean
  , href :: String
  , target :: String
  , rel :: String
  , download :: Foreign
  , ping :: String
  , referrerPolicy :: String
  , isDisabled :: Boolean
  , isSelected :: Boolean
  , isReadOnly :: Boolean
  , hideSelectedIcon :: Boolean
  , closeOnSelect :: Boolean
  , classNames :: Foreign
  , className :: String
  , onAction :: EffectFn1 Foreign Unit
  , onClose :: EffectFn1 Foreign Unit
  , onPress :: EventHandler
  , onPressStart :: EventHandler
  , onPressEnd :: EventHandler
  , onPressChange :: EffectFn1 Boolean Unit
  , onPressUp :: EventHandler
  , onKeyDown :: EventHandler
  , onKeyUp :: EventHandler
  , onClick :: EventHandler
  | r
  )

dropdownItem
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | DropdownItemProps () }
  => { | givenProps }
  -> kids
  -> JSX
dropdownItem = runFn3 createElementImpl Raw.dropdownItem
