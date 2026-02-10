module HeroUI.Form where

import React.Basic (JSX)
import React.Basic.Events (EventHandler)
import Yoga.React.DOM.Internal (CSS, class IsJSX, class CoerceReactProps)
import Data.Function.Uncurried (runFn4)
import Foreign (Foreign)
import HeroUI.Types (ValidationBehavior, validationBehaviorToString)
import HeroUI.Internal (createElementTransformImpl)
import HeroUI.Raw as Raw

type FormProps r =
  ( validationBehavior :: ValidationBehavior
  , validationErrors :: Foreign
  , action :: Foreign
  , encType :: String
  , method :: String
  , target :: String
  , autoComplete :: String
  , autoCapitalize :: String
  , className :: String
  , style :: CSS
  , onSubmit :: EventHandler
  , onReset :: EventHandler
  | r
  )

form
  :: forall givenProps nonDataProps kids
   . IsJSX kids
  => CoerceReactProps { | givenProps } { | nonDataProps } { | FormProps () }
  => { | givenProps }
  -> kids
  -> JSX
form props kids = runFn4 createElementTransformImpl
  { validationBehavior: validationBehaviorToString }
  Raw.form props kids
