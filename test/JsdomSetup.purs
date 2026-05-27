module Test.JsdomSetup where

import Prelude
import Effect (Effect)

foreign import registerJsdomImpl :: Effect Unit

registerJsdom :: Effect Unit
registerJsdom = registerJsdomImpl
