module HeroUI.Listbox where

import Prelude
import React.Basic (JSX)
import React.Basic.Events (EventHandler)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps, createElementImpl)
import Data.Function.Uncurried (runFn3, runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Color, SelectionBehavior, SelectionMode, Variant, colorToString, selectionBehaviorToString, selectionModeToString, variantToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type ListboxProps r =
  ( items :: Foreign
  , variant :: Variant
  , color :: Color
  , selectionMode :: SelectionMode
  , selectedKeys :: Array String
  , disabledKeys :: Array String
  , defaultSelectedKeys :: Array String
  , disallowEmptySelection :: Boolean
  , shouldHighlightOnFocus :: Boolean
  , autoFocus :: Foreign
  , topContent :: JSX
  , bottomContent :: JSX
  , emptyContent :: JSX
  , shouldFocusWrap :: Boolean
  , isVirtualized :: Boolean
  , virtualization :: Foreign
  , hideEmptyContent :: Boolean
  , hideSelectedIcon :: Boolean
  , disableAnimation :: Boolean
  , selectionBehavior :: SelectionBehavior
  , classNames :: Foreign
  , itemClasses :: Foreign
  , className :: String
  , onAction :: EffectFn1 Foreign Unit
  , onSelectionChange :: EffectFn1 Foreign Unit
  | r
  )

listbox
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | ListboxProps () }
  => { | givenProps }
  -> kids
  -> JSX
listbox props kids = runFn4 createElementTransformImpl
  { variant: variantToString, color: colorToString, selectionMode: selectionModeToString, selectionBehavior: selectionBehaviorToString }
  Raw.listbox props kids

type ListboxSectionProps r =
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

listboxSection
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | ListboxSectionProps () }
  => { | givenProps }
  -> kids
  -> JSX
listboxSection = runFn3 createElementImpl Raw.listboxSection

type ListboxItemProps r =
  ( key :: String
  , title :: JSX
  , textValue :: String
  , description :: JSX
  , shortcut :: JSX
  , startContent :: JSX
  , endContent :: JSX
  , selectedIcon :: Foreign
  , href :: String
  , target :: String
  , rel :: String
  , download :: Foreign
  , ping :: String
  , referrerPolicy :: String
  , shouldHighlightOnFocus :: Boolean
  , hideSelectedIcon :: Boolean
  , showDivider :: Boolean
  , isDisabled :: Boolean
  , isSelected :: Boolean
  , isReadOnly :: Boolean
  , classNames :: Foreign
  , className :: String
  , onAction :: EffectFn1 Foreign Unit
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

listboxItem
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | ListboxItemProps () }
  => { | givenProps }
  -> kids
  -> JSX
listboxItem = runFn3 createElementImpl Raw.listboxItem
