module Main where

import Prelude

import App (app)
import Cart (Cart(..))
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Effect (useHot, useState')
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = do
  _ /\ setCart /\ cart <- useHot $ Cart { items: [ ] }
  _ /\ setRouter /\ router <- useHot Nothing
  setRouteChanged /\ routeChanged <- useState'
  app { setCart, cart, setRouter, router, routeChanged, setRouteChanged } >>= runInBody