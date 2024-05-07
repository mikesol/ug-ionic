module Main where

import Prelude

import App (app)
import Cart (Cart(..))
import Control.Monad.ST.Class (liftST)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Effect (useHot, useState')
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (create)

main :: Effect Unit
main = do
  _ /\ setCart /\ cart <- useHot $ Cart { items: [ ] }
  _ /\ setRouter /\ router <- useHot Nothing
  { event: currentKitchen, push: setCurrentKitchen } <- liftST create
  app { setCart, cart, setRouter, router, currentKitchen, setCurrentKitchen } >>= runInBody