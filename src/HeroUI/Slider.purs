module HeroUI.Slider where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Color, Orientation, Radius, Size, colorToString, orientationToString, radiusToString, sizeToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type SliderProps r =
  ( label :: JSX
  , name :: String
  , size :: Size
  , color :: Color
  , radius :: Radius
  , step :: Number
  , value :: Foreign
  , defaultValue :: Foreign
  , minValue :: Number
  , maxValue :: Number
  , orientation :: Orientation
  , fillOffset :: Number
  , showSteps :: Boolean
  , showTooltip :: Boolean
  , marks :: Foreign
  , startContent :: JSX
  , endContent :: JSX
  , formatOptions :: Foreign
  , tooltipValueFormatOptions :: Foreign
  , tooltipProps :: Foreign
  , showOutline :: Boolean
  , hideValue :: Boolean
  , hideThumb :: Boolean
  , disableThumbScale :: Boolean
  , isDisabled :: Boolean
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  , getValue :: Foreign
  , getTooltipValue :: Foreign
  , renderLabel :: Foreign
  , renderValue :: Foreign
  , renderThumb :: Foreign
  , onChange :: EffectFn1 Foreign Unit
  , onChangeEnd :: EffectFn1 Foreign Unit
  | r
  )

slider
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | SliderProps () }
  => { | givenProps }
  -> kids
  -> JSX
slider props kids = runFn4 createElementTransformImpl
  { size: sizeToString, color: colorToString, radius: radiusToString, orientation: orientationToString }
  Raw.slider props kids
