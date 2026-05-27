module HeroUI.Input where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX)
import Data.Function.Uncurried (runFn4)
import Effect.Uncurried (EffectFn1)
import Foreign (Foreign)
import HeroUI.Types (Color, LabelPlacement, Radius, Size, ValidationBehavior, Variant, colorToString, labelPlacementToString, radiusToString, sizeToString, validationBehaviorToString, variantToString)
import HeroUI.Internal (class CoerceHeroProps, createElementTransformImpl)
import HeroUI.Raw as Raw

data InputType
  = InputTypeText
  | InputTypeEmail
  | InputTypePassword
  | InputTypeNumber
  | InputTypeTel
  | InputTypeUrl
  | InputTypeSearch
  | InputTypeDate
  | InputTypeTime
  | InputTypeDateTimeLocal
  | InputTypeMonth
  | InputTypeWeek
  | InputTypeFile
  | InputTypeCheckbox
  | InputTypeRadio
  | InputTypeHidden
  | InputTypeColor
  | InputTypeRange

derive instance Eq InputType
derive instance Ord InputType

inputTypeToString :: InputType -> String
inputTypeToString = case _ of
  InputTypeText -> "text"
  InputTypeEmail -> "email"
  InputTypePassword -> "password"
  InputTypeNumber -> "number"
  InputTypeTel -> "tel"
  InputTypeUrl -> "url"
  InputTypeSearch -> "search"
  InputTypeDate -> "date"
  InputTypeTime -> "time"
  InputTypeDateTimeLocal -> "datetime-local"
  InputTypeMonth -> "month"
  InputTypeWeek -> "week"
  InputTypeFile -> "file"
  InputTypeCheckbox -> "checkbox"
  InputTypeRadio -> "radio"
  InputTypeHidden -> "hidden"
  InputTypeColor -> "color"
  InputTypeRange -> "range"

type InputProps r =
  ( variant :: Variant
  , color :: Color
  , size :: Size
  , radius :: Radius
  , label :: JSX
  , value :: String
  , defaultValue :: String
  , placeholder :: String
  , description :: JSX
  , errorMessage :: JSX
  , validate :: Foreign
  , validationBehavior :: ValidationBehavior
  , startContent :: JSX
  , endContent :: JSX
  , labelPlacement :: LabelPlacement
  , fullWidth :: Boolean
  , isClearable :: Boolean
  , isRequired :: Boolean
  , isReadOnly :: Boolean
  , isDisabled :: Boolean
  , isInvalid :: Boolean
  , baseRef :: Foreign
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  , type :: InputType
  , name :: String
  , id :: String
  , form :: String
  , autoComplete :: String
  , autoFocus :: Boolean
  , min :: String
  , max :: String
  , step :: String
  , minLength :: Int
  , maxLength :: Int
  , pattern :: String
  , onChange :: EffectFn1 Foreign Unit
  , onValueChange :: EffectFn1 String Unit
  , onClear :: EffectFn1 Foreign Unit
  | r
  )

input
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceHeroProps { | givenProps } { | nonDataProps } { | InputProps () }
  => { | givenProps }
  -> kids
  -> JSX
input props kids = runFn4 createElementTransformImpl
  { variant: variantToString, color: colorToString, size: sizeToString, radius: radiusToString, validationBehavior: validationBehaviorToString, labelPlacement: labelPlacementToString, type: inputTypeToString }
  Raw.input props kids

type TextareaProps r =
  ( minRows :: Int
  , maxRows :: Int
  , cacheMeasurements :: Boolean
  , variant :: Variant
  , color :: Color
  , size :: Size
  , radius :: Radius
  , label :: JSX
  , value :: String
  , defaultValue :: String
  , placeholder :: String
  , startContent :: JSX
  , endContent :: JSX
  , description :: JSX
  , errorMessage :: JSX
  , validate :: Foreign
  , validationBehavior :: ValidationBehavior
  , labelPlacement :: LabelPlacement
  , fullWidth :: Boolean
  , isRequired :: Boolean
  , isReadOnly :: Boolean
  , isDisabled :: Boolean
  , isClearable :: Boolean
  , isInvalid :: Boolean
  , disableAutosize :: Boolean
  , disableAnimation :: Boolean
  , classNames :: Foreign
  , className :: String
  , name :: String
  , onChange :: EffectFn1 Foreign Unit
  , onValueChange :: EffectFn1 String Unit
  , onClear :: EffectFn1 Foreign Unit
  , onHeightChange :: EffectFn1 Foreign Unit
  | r
  )

textarea
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceHeroProps { | givenProps } { | nonDataProps } { | TextareaProps () }
  => { | givenProps }
  -> kids
  -> JSX
textarea props kids = runFn4 createElementTransformImpl
  { variant: variantToString, color: colorToString, size: sizeToString, radius: radiusToString, validationBehavior: validationBehaviorToString, labelPlacement: labelPlacementToString }
  Raw.textarea props kids
