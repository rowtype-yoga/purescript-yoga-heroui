module HeroUI.Accordion where

import Prelude
import React.Basic (JSX)
import React.Basic.Events (EventHandler)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps, createElementImpl)
import Data.Function.Uncurried (runFn3, runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (SelectionBehavior, SelectionMode, Variant, variantToString, selectionModeToString, selectionBehaviorToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type AccordionProps r =
  ( variant :: Variant
  , selectionMode :: SelectionMode
  , selectionBehavior :: SelectionBehavior
  , isCompact :: Boolean
  , isDisabled :: Boolean
  , showDivider :: Boolean
  , dividerProps :: Foreign
  , hideIndicator :: Boolean
  , disableAnimation :: Boolean
  , disableIndicatorAnimation :: Boolean
  , disallowEmptySelection :: Boolean
  , keepContentMounted :: Boolean
  , fullWidth :: Boolean
  , motionProps :: Foreign
  , selectedKeys :: Array String
  , defaultSelectedKeys :: Array String
  , disabledKeys :: Array String
  , itemClasses :: Foreign
  , classNames :: Foreign
  , className :: String
  , onSelectionChange :: EffectFn1 Foreign Unit
  | r
  )

accordion
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | AccordionProps () }
  => { | givenProps }
  -> kids
  -> JSX
accordion props kids = runFn4 createElementTransformImpl
  { variant: variantToString, selectionMode: selectionModeToString, selectionBehavior: selectionBehaviorToString }
  Raw.accordion props kids

type AccordionItemProps r =
  ( title :: JSX
  , subtitle :: JSX
  , indicator :: Foreign
  , startContent :: JSX
  , motionProps :: Foreign
  , isCompact :: Boolean
  , isDisabled :: Boolean
  , keepContentMounted :: Boolean
  , hideIndicator :: Boolean
  , disableAnimation :: Boolean
  , disableIndicatorAnimation :: Boolean
  , headingComponent :: String
  , classNames :: Foreign
  , className :: String
  , onPress :: EventHandler
  , onPressStart :: EventHandler
  , onPressEnd :: EventHandler
  , onPressChange :: EffectFn1 Boolean Unit
  , onPressUp :: EventHandler
  , onKeyDown :: EventHandler
  , onKeyUp :: EventHandler
  , onFocus :: EventHandler
  , onBlur :: EventHandler
  , onFocusChange :: EffectFn1 Boolean Unit
  , onClick :: EventHandler
  | r
  )

accordionItem
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | AccordionItemProps () }
  => { | givenProps }
  -> kids
  -> JSX
accordionItem = runFn3 createElementImpl Raw.accordionItem
