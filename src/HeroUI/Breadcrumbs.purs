module HeroUI.Breadcrumbs where

import Prelude
import React.Basic (JSX)
import React.Basic.Events (EventHandler)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Color, Radius, Size, UnderlineStyle, Variant, colorToString, radiusToString, sizeToString, underlineToString, variantToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type BreadcrumbsProps r =
  ( variant :: Variant
  , color :: Color
  , size :: Size
  , radius :: Radius
  , underline :: UnderlineStyle
  , separator :: JSX
  , maxItems :: Int
  , itemsBeforeCollapse :: Int
  , itemsAfterCollapse :: Int
  , hideSeparator :: Boolean
  , isDisabled :: Boolean
  , disableAnimation :: Boolean
  , itemClasses :: Foreign
  , classNames :: Foreign
  , className :: String
  , onAction :: EffectFn1 Foreign Unit
  | r
  )

breadcrumbs
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | BreadcrumbsProps () }
  => { | givenProps }
  -> kids
  -> JSX
breadcrumbs props kids = runFn4 createElementTransformImpl
  { variant: variantToString, color: colorToString, size: sizeToString, radius: radiusToString, underline: underlineToString }
  Raw.breadcrumbs props kids

type BreadcrumbItemProps r =
  ( color :: Color
  , size :: Size
  , underline :: UnderlineStyle
  , startContent :: JSX
  , endContent :: JSX
  , separator :: JSX
  , isCurrent :: Boolean
  , isLast :: Boolean
  , hideSeparator :: Boolean
  , isDisabled :: Boolean
  , disableAnimation :: Boolean
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

breadcrumbItem
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | BreadcrumbItemProps () }
  => { | givenProps }
  -> kids
  -> JSX
breadcrumbItem props kids = runFn4 createElementTransformImpl
  { color: colorToString, size: sizeToString, underline: underlineToString }
  Raw.breadcrumbItem props kids
