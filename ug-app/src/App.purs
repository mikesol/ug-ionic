module App where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Core (Nut)
import Deku.DOM.Self as Self
import Deku.Effect (useHot)
import Deku.Ionic.App as IA
import Deku.Ionic.Router as IR
import Deku.Ionic.RouterOutlet as IRO
import Effect (Effect)
import Pages.Checkout (checkout)
import Pages.Intro (intro)
import Pages.Kitchens (kitchens)

app :: _ -> Effect Nut
app polls = do
  rtr <- IR.ionRouter
    [ IR.useHash_ false
    , Self.selfT_ \(r :: IR.IonRouter) -> do
        polls.setRouter (Just r)
    ]
    { "": intro polls
    , kitchens: kitchens polls
    , checkout: checkout polls
    }
  pure $ IA.ionApp_
    [ rtr
    , IRO.ionRouterOutlet_ []
    ]