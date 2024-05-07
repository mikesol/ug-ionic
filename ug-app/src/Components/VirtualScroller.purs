module Components.VirtualScroller where

import Prelude

import Data.Foldable (for_)
import Data.Maybe (fromMaybe)
import Deku.Core (Nut)
import Deku.Toplevel (runInElement)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, mkEffectFn1)
import Web.DOM (Element)
import Web.DOM.Document (createElement)
import Web.DOM.Element (setAttribute, toNode, toParentNode)
import Web.DOM.Node (appendChild, parentElement)
import Web.DOM.ParentNode (firstElementChild)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toDocument)
import Web.HTML.Window (document)

foreign import virtualScrollerImpl :: forall a. Element -> Array a -> EffectFn1 a Element -> Effect Unit

virtualScroller :: forall a. Element -> Array a -> (a -> Nut) -> Effect Unit
virtualScroller el items render = do
  w <- window
  d <- document w
  e <- createElement "div" (toDocument d)
  err <- createElement "div" (toDocument d)
  setAttribute "style" "display:none;" e
  p <- parentElement (toNode el)
  for_ p (toNode >>> appendChild (toNode e))
  virtualScrollerImpl el items $ mkEffectFn1 \a -> do
    let n = render a
    runInElement e n
    fec <- firstElementChild (toParentNode e)
    pure $ fromMaybe err fec