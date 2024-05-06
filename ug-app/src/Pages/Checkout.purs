module Pages.Checkout where

import Prelude

import Cart (Cart(..), CartItem(..))
import Data.Foldable (for_, sum)
import Data.Int (toNumber)
import Data.Maybe (Maybe(..), maybe)
import Data.Nullable (null)
import Data.Number.Format as NF
import Deku.Core (Nut, fixed, text, text_)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Combinators (runOn)
import Deku.DOM.Listeners as DL
import Deku.Hooks ((<#~>))
import Deku.Ionic.Alert as Alert
import Deku.Ionic.BackButton as IBB
import Deku.Ionic.Button as IB
import Deku.Ionic.Buttons as IBS
import Deku.Ionic.Content as IC
import Deku.Ionic.Enums as E
import Deku.Ionic.Footer as IF
import Deku.Ionic.Header as IH
import Deku.Ionic.List as IL
import Deku.Ionic.Router as IR
import Deku.Ionic.Title as ITi
import Deku.Ionic.Toolbar as IT
import Effect (Effect)
import Effect.Aff (launchAff_)
import FRP.Poll (Poll)

newtype KitchenGridEntry = KitchenGridEntry
  { name :: String
  , description :: String
  , imageUrl :: String
  }

checkout :: { router :: Poll (Maybe _), setCart :: _ -> Effect Unit | _ } -> _
checkout { cart, router, setCart } = IR.ionRoute_ @{} \_ _ -> fixed
  [ IH.ionHeader_
      [ IT.ionToolbar [ IT.color_ $ E.customColor "ugmain" ]
          [ IBS.ionButtons [ DA.slot_ "start" ]
              [ IBB.ionBackButton [ IBB.defaultHref_ "/" ] []
              ]
          , ITi.ionTitle_
              [ text_ "Your order"
              ]
          ]
      ]
  , IC.ionContent []
      [ cart <#~> \(Cart { items }) -> IL.ionList []
          (map renderItem items)
      ]
  , IF.ionFooter [ IF.translucent_ true ]
      [ IT.ionToolbar_
          [ IB.ionButton
              [ IB.color_ E.dark
              , IB.expand_ E.buttonexpandBlock
              , runOn DL.click $ router <#> \r -> do
                  launchAff_ $ Alert.alert "Order placed" Nothing Nothing
                    [ { handler: do
                          setCart $ Cart { items: [] }
                          for_ r \r' -> IR.push r' "/" null null
                      , text: "OK"
                      }
                    ]
              ]
              [ D.div [ DA.klass_ "w-full flex flex-row justify-between" ]
                  [ D.div_
                      [ text_ "Pay now"
                      ]
                  , D.div_
                      [ text_ "€"
                      , text $ cart <#> \(Cart { items }) -> NF.toStringWith (NF.fixed 2) $ (_ / 100.0) $ toNumber $ sum
                          $ map
                              (\(CartItem { price }) -> price)
                              items
                      ]
                  ]
              ]
          ]
      ]
  ]

renderItem :: CartItem -> Nut
renderItem (CartItem { title, description, imageUrl, price, kitchenHeaderUrl }) =
  D.div [ DA.klass_ "p-4" ]
    [ D.div [ DA.klass_ "flex items-center flex-row" ]
        [ D.span [ DA.klass_ "pr-2 text-gray-500" ]
            [ text_ "From"
            ]
        , D.img [ DA.src_ kitchenHeaderUrl, DA.klass_ "w-12" ] []
        ]
    , D.div
        [ DA.klass_ "flex items-end" ]
        [ D.div
            [ DA.klass_ "flex-1" ]
            [ D.h3
                [ DA.klass_ "text-lg font-semibold" ]
                [ text_ title ]
            , description # maybe mempty \d -> D.p
                [ DA.klass_ "text-gray-700 text-sm line-clamp-2" ]
                [ text_ d ]
            ]
        , D.div
            [ DA.klass_ "w-1/3" ]
            [ imageUrl # maybe mempty \url -> D.img
                [ DA.src_ url
                , DA.alt_ title
                , DA.klass_ "rounded-lg"
                ]
                []
            ]
        ]
    , D.div_
        [ D.span [ DA.klass_ "pr-2 text-red-500 font-semibold" ]
            [ text_
                ( "€" <> NF.toStringWith (NF.fixed 2)
                    (toNumber price / 100.0)
                )
            ]
        ]
    ]