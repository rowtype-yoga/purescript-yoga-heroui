module HeroUI.Menu where

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

type MenuProps r =
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

menu
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | MenuProps () }
  => { | givenProps }
  -> kids
  -> JSX
menu props kids = runFn4 createElementTransformImpl
  { variant: variantToString, color: colorToString, selectionMode: selectionModeToString }
  Raw.menu
  props
  kids

type MenuSectionProps r =
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

menuSection
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | MenuSectionProps () }
  => { | givenProps }
  -> kids
  -> JSX
menuSection = runFn3 createElementImpl Raw.menuSection

type MenuItemProps r =
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

menuItem
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | MenuItemProps () }
  => { | givenProps }
  -> kids
  -> JSX
menuItem = runFn3 createElementImpl Raw.menuItem
