module Example4 where

import Prelude

import Control.Monad.State (lift)
import Ecs (Entity(..), SystemT, get, set)
import Effect (Effect)
import Effect.Console (logShow)
import Model (Position(..), World)

subSystem :: SystemT World Effect Int
subSystem = do
  set (Entity 0) (Position 42)
  Position p <- get (Entity 0)
  pure p

example4 :: SystemT World Effect Unit
example4 = do
  value <- subSystem
  lift $ logShow value
