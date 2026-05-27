module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Aff (launchAff_)
import Test.HeroUI.IssuesSpec as IssuesSpec
import Test.JsdomSetup (registerJsdom)
import Test.Spec.Reporter (consoleReporter)
import Test.Spec.Runner (runSpec)

main :: Effect Unit
main = do
  registerJsdom
  launchAff_ $ runSpec [ consoleReporter ] IssuesSpec.spec
