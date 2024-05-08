module Pages.Intro where

import Prelude

import Assets.SVG as SVG
import Cart (Cart(..), CartItem(..))
import Data as Data
import Data.Array (length)
import Data.Array.NonEmpty as NAE
import Data.Foldable (sum)
import Data.FunctorWithIndex (mapWithIndex)
import Data.Int (toNumber)
import Data.Number.Format as NF
import Deku.Core (fixed, text, text_)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Ionic.Badge as IBa
import Deku.Ionic.Button as IB
import Deku.Ionic.Buttons as IBs
import Deku.Ionic.Card as ICard
import Deku.Ionic.CardContent as ICC
import Deku.Ionic.Content as IC
import Deku.Ionic.Enums as E
import Deku.Ionic.Footer as IF
import Deku.Ionic.Header as IH
import Deku.Ionic.Icon as IIc
import Deku.Ionic.Img as IMG
import Deku.Ionic.Item as II
import Deku.Ionic.Label as ILa
import Deku.Ionic.List as IL
import Deku.Ionic.Note as IN
import Deku.Ionic.Router as IR
import Deku.Ionic.Toolbar as IT
import Effect (Effect)
import Effect.Console (log)
import FRP.Poll (Poll)

newtype KitchenGridEntry = KitchenGridEntry
  { name :: String
  , description :: String
  , imageUrl :: String
  }

intro :: _ -> _
intro { cart, setCurrentKitchen } = IR.ionRoute_ @{} \{ kitchens, checkout } _ -> fixed
  [ IH.ionHeader_
      [ IT.ionToolbar [ IT.color_ $ E.customColor "ugmain" ]
          [ IBs.ionButtons [ IBs.slot_ "secondary" ]
              [ IB.ionButton_ [ IIc.ionIcon [ DA.style_ "font-size:40px;", IIc.src_ SVG.logo ] [] ]
              ]
          , IBs.ionButtons [ IBs.slot_ "primary" ]
              [ IB.ionButton_ [ IIc.ionIcon [ IIc.src_ SVG.roomService ] [] ]
              , IB.ionButton_ [ IIc.ionIcon [ IIc.src_ SVG.userCircle ] [] ]
              ]
          ]
      ]
  , IC.ionContent []
      [ D.div [ DA.klass_ "bg-ugmain ion-padding" ]
          [ D.div [ DA.klass_ "flex flex-row items-center" ]
              [ IIc.ionIcon [ IIc.name_ "location" ] []
              , D.span [ DA.klass_ "text-md px-1 font-semibold" ] [ text_ "UG Hakaniemi" ]
              , IBa.ionBadge [ DA.klass_ "px-4 py-1 mx-2", IBa.color_ E.success, IBa.slot_ "end" ]
                  [ text_ "7.00 - 22.00"
                  ]
              ]
          ]
      , D.div [ DA.klass_ "bg-ugmain ion-padding" ]
          [ D.p [ DA.klass_ "text-2xl font-bold" ] [ text_ "Good afternoon, Mike." ]
          , D.p [ DA.klass_ "text-lg font-medium" ] [ text_ "Let's get you something to eat." ]
          ]
      , D.div [ DA.klass_ "ion-padding" ]
          [ D.p [ DA.klass_ "text-xl font-bold" ] [ text_ "Your orders" ]
          , D.p [ DA.klass_ "text-md font-light" ] [ text_ "You have 1 active order" ]
          ]
      , ICard.ionCard_
          [ ICC.ionCardContent_
              [ IL.ionList_
                  [ II.ionItem_
                      [ IN.ionNote_
                          [ text_ "#10973"
                          ]
                      , IN.ionNote [ IBa.slot_ "end" ]
                          [ text_ "12 hr. ago"
                          ]
                      ]
                  , II.ionItem_
                      [ ILa.ionLabel_
                          [ text_ "Hummus Brothers (1)"
                          ]
                      , IBa.ionBadge [ DA.klass_ "px-2 py-1", IBa.color_ E.success, IBa.slot_ "end" ]
                          [ text_ "Completed"
                          ]
                      ]
                  , II.ionItem_
                      [ IN.ionNote_
                          [ text_ "Total"
                          ]
                      , IN.ionNote [ DA.klass_ "font-medium", IN.color_ E.dark, IBa.slot_ "end" ]
                          [ text_ "€ 14,50"
                          ]
                      ]
                  ]
              ]
          ]
      , D.div [ DA.klass_ "max-w-screen-lg mx-auto px-4 grid grid-cols-2 gap-4" ]
          $ NAE.toArray
              ( mapWithIndex
                  ( \kitchen (Data.Kitchen { slug, name, imageUrl }) -> D.div_
                      [ kitchens (pure {} :: Poll _) [ DL.click_ (\_ -> setCurrentKitchen kitchen) :: Poll _ ]
                          [ D.img
                              [ DA.src_ imageUrl
                              , DA.alt_ name
                              , DA.klass_ "rounded-lg"
                              ]
                              []
                          ]
                      , D.div_
                          [ D.p
                              [ DA.klass_ "font-semibold" ]
                              [ text_ name ]
                          , D.p
                              [ DA.klass_ "text-sm text-gray-600"
                              ]
                              [ text_ slug ]
                          ]
                      ]
                  )
                  Data.kitchens
              )
      ]
  , IF.ionFooter [ IF.translucent_ true ]
      [ IT.ionToolbar_
          [ checkout (pure {} :: Poll _) []
              [ IB.ionButton
                  [ IB.color_ E.dark
                  , IB.expand_ E.buttonexpandBlock
                  , IB.disabled $ cart <#> \(Cart { items }) -> length items == 0
                  ]
                  [ D.div [ DA.klass_ "w-full flex flex-row justify-between" ]
                      [ D.div_
                          [ D.span [ DA.klass_ "px-1 mx-2 border-solid border rounded-full border-slate-50" ]
                              [ text $ cart <#> \(Cart { items }) -> show $ length items
                              ]
                          , text_ "Your order"
                          ]
                      , D.div_
                          [ text_ "€"
                          , text $ cart <#> \(Cart { items }) -> NF.toStringWith (NF.fixed 2) $ (_ / 100.0) $ toNumber
                              $ sum
                              $ map
                                  (\(CartItem { price }) -> price)
                                  items
                          ]
                      ]
                  ]
              ]
          ]
      ]
  ]
