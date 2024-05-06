module Pages.Kitchens where

import Prelude

import Assets.Image as Image
import Assets.SVG as SVG
import Cart (Cart(..), CartItem(..))
import Components.Swiper (Swiper, activeIndex, onEvent, slideTo, swiper)
import Components.Swiper as Swiper
import Data as Data
import Data.Array (drop, fold, length, replicate, take, (..))
import Data.Array as Array
import Data.Array.NonEmpty as NAE
import Data.Compactable (compact)
import Data.Foldable (for_, sum)
import Data.Function (on)
import Data.FunctorWithIndex (mapWithIndex)
import Data.Int (toNumber)
import Data.Map as Map
import Data.Maybe (Maybe(..), fromMaybe, fromMaybe', maybe)
import Data.Newtype (class Newtype, unwrap)
import Data.Number.Format as NF
import Data.Options ((:=))
import Data.String as String
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested ((/\))
import Deku.Core (Nut, fixed, text, text_, useHot, useRant, useState, useState')
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners (runOn, runOn_)
import Deku.DOM.Listeners as DL
import Deku.DOM.Self as Self
import Deku.Do as Deku
import Deku.Hooks ((<#~>))
import Deku.Ionic.BackButton as IBB
import Deku.Ionic.Button as IB
import Deku.Ionic.Buttons as IBS
import Deku.Ionic.Buttons as IBs
import Deku.Ionic.Content as IC
import Deku.Ionic.Enums as E
import Deku.Ionic.Footer as IF
import Deku.Ionic.Header as IH
import Deku.Ionic.Icon as IIc
import Deku.Ionic.Img as IMG
import Deku.Ionic.Modal as IM
import Deku.Ionic.Router as IR
import Deku.Ionic.Select as IS
import Deku.Ionic.SelectOption as ISO
import Deku.Ionic.Title as ITi
import Deku.Ionic.Toolbar as IT
import Effect (Effect)
import Effect.Console (logShow)
import FRP.Event as Event
import FRP.Poll (Poll)
import Untagged.Union (asOneOf)
import Web.CSSOMView (ScrollBehavior(..), ScrollLogicalPosition(..))
import Web.CSSOMView.Element (scrollIntoView)
import Yoga.JSON (readJSON_, write)

newtype MenuItemResolved = MenuItemResolved
  { id :: Int, title :: String, description :: Maybe String, imageUrl :: Maybe String }

derive instance Newtype MenuItemResolved _

newtype ModalItem = ModalItem
  { title :: String
  , description :: Maybe String
  , imageUrl :: Maybe String
  , headerUrl :: String
  , menuId :: Int
  , kitchenId :: Int
  , sectionId :: Int
  , itemId :: Int
  , price :: Int
  , kitchenName :: String
  }

derive instance Newtype ModalItem _

data DietaryInfo = Vegan | LactoseFree | GlutenFree

dietaryInfoToString :: DietaryInfo -> String
dietaryInfoToString Vegan = "V"
dietaryInfoToString LactoseFree = "LF"
dietaryInfoToString GlutenFree = "GF"

kitchens :: _ -> _
kitchens { cart, setCart, routeChanged } = IR.ionRoute_ @{ kitchen :: Int } \{ checkout } { kitchen } -> Deku.do
  setMainSlider /\ mainSlider <- useState'
  fixed
    [ IH.ionHeader_
        [ IT.ionToolbar [ IT.color_ $ E.customColor "ugmain" ]
            [ IBS.ionButtons [ DA.slot_ "start" ]
                [ IBB.ionBackButton [ IBB.defaultHref_ "/" ] []
                ]
            , IBs.ionButtons [ IBs.slot_ "primary" ]
                [ IB.ionButton_ [ IIc.ionIcon [ IIc.src_ SVG.roomService ] [] ]
                , IB.ionButton_ [ IIc.ionIcon [ IIc.src_ SVG.userCircle ] [] ]
                ]
            , ITi.ionTitle_
                [ IIc.ionIcon [ DA.style_ "font-size:40px;", IIc.src_ SVG.logo ] []
                ]
            ]
        , D.div
            [ DA.klass_ "bg-ugmain swiper w-full topSwiper" ]
            [ D.div
                [ DA.klass_ "swiper-wrapper" ]
                ( mapWithIndex (topSlide mainSlider) $ NAE.toArray Data.kitchens
                )
            , D.div
                [ DA.klass_ "swiper-pagination" ]
                []
            ]

        ]
    , IC.ionContent_ [ swiperComponent { cart, setCart, routeChanged } ]
    , IF.ionFooter
        [ IF.translucent_ true
        , Self.self_ \_ -> do
            ts <- swiper "topSwiper" $
              Swiper.slidesPerView := asOneOf "auto"
                <> Swiper.centeredSlides := true
                <> Swiper.initialSlide := kitchen
            ms <- swiper "mainSwiper" $
              Swiper.initialSlide := kitchen
            _ <- onEvent ms "slideChange" do
              msai <- activeIndex ms
              tsai <- activeIndex ts
              when (tsai /= msai) do
                slideTo ts msai
            _ <- onEvent ts "slideChange" do
              msai <- activeIndex ms
              tsai <- activeIndex ts
              when (tsai /= msai) do
                slideTo ms tsai
            setMainSlider ms
        ]
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

swiperComponent :: _ -> Nut
swiperComponent { cart, setCart, routeChanged } =
  D.div [ DA.klass_ "w-full h-full" ]
    [ D.div
        [ DA.klass_ "swiper mainSwiper w-full h-full" ]
        [ D.div
            [ DA.klass_ "swiper-wrapper" ]
            (NAE.toArray $ map (mainSlide { cart, setCart, routeChanged }) Data.kitchens)
        ]
    ]

menuItemSlide :: _ -> Data.Section -> Nut
menuItemSlide { menuHeaderMap } (Data.Section { id, title }) =
  D.div
    [ DA.klass_ "swiper-slide !w-auto px-2 py-2 m-2 font-semibold text-sm text-gray-500"
    , runOn DL.click $ menuHeaderMap <#> \mp -> do
        for_ (Map.lookup id mp) \elt -> scrollIntoView (Just { behavior: Smooth, block: Start, inline: Nearest }) elt
    ]
    [ text_ title ]

topSlide :: Poll Swiper -> Int -> Data.Kitchen -> Nut
topSlide ps n (Data.Kitchen { headerUrl }) =
  D.div
    [ DA.klass_ "bg-ugmain swiper-slide !w-24 !h-16"
    , DL.click $
        ( ps <#> \ms _ -> do
            slideTo ms n
        )
    ]
    [ D.div [ DA.klass_ "grid grid-cols-1 place-items-center w-full h-full" ]
        [ D.div [ DA.klass_ "w-16" ] [ IMG.ionImg [ DA.src_ headerUrl ] [] ] ]
    ]

mainSlide :: _ -> Data.Kitchen -> Nut
mainSlide { cart, setCart, routeChanged } k = Deku.do
  let Data.Kitchen kitchen = k
  setMenuIndex /\ menuIndex <- useState 0
  setMenuHeaderMap /\ menuHeaderMapElts <- useState Nothing
  menuHeaderMap <- useRant
    (Event.fold (\b -> maybe Map.empty (\(Tuple id e) -> Map.insert id e b)) Map.empty menuHeaderMapElts)
  NAE.fromArray kitchen.menus # maybe (D.div__ "The restaurant is now closed") \menus -> D.div
    [ DA.klass_ "swiper-slide overflow-y-scroll" ]
    [ D.div_
        [ IMG.ionImg
            [ DA.src_ kitchen.imageUrl
            , DA.alt_ "Banner Image"
            , DA.klass_ "w-full h-48 object-cover"
            ]
            []
        ]
    , D.div
        [ DA.klass_ "text-left p-4" ]
        [ D.h1
            [ DA.klass_ "text-3xl font-bold mb-2" ]
            [ text_ kitchen.name ]
        , D.p
            [ DA.klass_ "text-gray-600" ]
            [ text_ kitchen.description ]
        ]
    , D.div
        [ DA.klass_ "px-4 flex flex-row items-center" ]
        [ D.div
            [ DA.klass_ "text-sm text-gray-500 pr-4" ]
            [ text_ "8.00-20.00" ]
        , D.div_
            [ IS.ionSelect
                [ IS.interface_ E.popover
                , IS.placeholder_ "Menu"
                , IS.onIonChange_ \ic -> do
                    v <- IS.value ic
                    for_ (readJSON_ v) setMenuIndex
                ]
                $ NAE.toArray
                $ mapWithIndex (\i (Data.Menu menu) -> ISO.ionSelectOption [ ISO.value_ (show i) ] [ text_ menu.title ])
                    menus
            ]
        ]
    , D.div
        [ DA.klass_ "swiper w-full menuItemSwiper"
        ]
        [ menuIndex <#~> \mIx -> do
            let Data.Menu { sections } = fromMaybe' (\_ -> NAE.head menus) (NAE.index menus mIx)
            D.div
              [ DA.klass_ "swiper-wrapper" ]
              (map (menuItemSlide { menuHeaderMap }) sections)
        , D.div
            [ DA.klass_ "swiper-pagination" ]
            []
        ]
    , D.div
        [ DA.klass_ "hidden"
        , Self.self_ \_ -> do
            void $ swiper "menuItemSwiper" $
              Swiper.slidesPerView := asOneOf "auto"
                <> Swiper.nested := true
                <> Swiper.initialSlide := 0
        ]
        []
    , menuIndex <#~> \mIx -> do
        let Data.Menu { sections, id: menuId } = fromMaybe' (\_ -> NAE.head menus) (NAE.index menus mIx)
        let
          rc = renderCategory
            { setMenuHeaderMap
            , headerUrl: kitchen.headerUrl
            , kitchenId: kitchen.id
            , kitchenName: kitchen.name
            , menuId
            , cart
            , setCart
            , routeChanged
            }
        D.div
          [ DA.klass_ "px-4 mt-4" ]
          ( (map (rc true) (take 1 sections)) <>
              [ routeChanged <#~> \_ -> fixed (map (rc false) (drop 1 sections))
              ]
          )
    ]

renderCategory :: _ -> Boolean -> Data.Section -> Nut
renderCategory
  { setMenuHeaderMap
  , headerUrl
  , kitchenId
  , menuId
  , kitchenName
  , cart
  , setCart
  , routeChanged
  }
  isFirst
  (Data.Section { id, title, description, items }) = do
  let source = Array.nubBy (compare `on` (unwrap >>> _.title)) $ resolveItems items
  let
    ri = renderItem
      { headerUrl
      , kitchenId
      , sectionId: id
      , menuId
      , kitchenName
      , cart
      , setCart
      }
  D.div_
    ( [ D.div
          [ DA.klass_ "sticky top-0 bg-white"
          , Self.self_ \e -> do
              setMenuHeaderMap (Just (Tuple id e))
          ]
          [ D.h2
              [ DA.klass_ "font-bold text-xl mb-1" ]
              [ text_ title ]
          , description # maybe mempty \d -> D.div
              [ DA.klass_ "text-lg mb-2 text-gray-500" ]
              [ text_ d ]
          ]
      -- the data source has lots of duplicates, so nub them
      ] <>
        if not isFirst then map ri source
        else
          ( (map ri (take 3 source)) <>
              [ routeChanged <#~> \_ -> fixed (map ri (drop 3 source))
              ]
          )
    )

resolveItems :: Array Data.Item -> Array MenuItemResolved
resolveItems = compact <<< map resolveItem
  where
  resolveItem (Data.Item { id, title, description, imageUrl }) = case title of
    Just t -> Just $ MenuItemResolved { id, title: t, description, imageUrl }
    Nothing -> Nothing

modalId kitchenId sectionId menuId itemId = "modal_" <> show kitchenId <> "_" <> show sectionId <> "_" <> show menuId
  <> "_"
  <> show itemId

renderItem
  :: _
  -> MenuItemResolved
  -> Nut
renderItem
  { headerUrl
  , kitchenId
  , sectionId
  , menuId
  , kitchenName
  , cart
  , setCart
  }
  ( MenuItemResolved
      { id: itemId
      , title
      , description
      , imageUrl
      }
  ) =
  let
    price = description # maybe 600 \d -> if String.length d > 30 then 1350 else 600
  in
    D.div_
      [ D.div
          [ DA.klass_ "flex items-end", DA.id_ $ modalId kitchenId sectionId menuId itemId ]
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
              [ imageUrl # maybe mempty \url -> IMG.ionImg
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
          -- , D.span
          --     [ DA.klass_ "text-md text-gray-500" ]
          --     [ text_ $ fold $ map dietaryInfoToString dietaryInfo ]
          ]
      , makeModal
          { cart
          , setCart
          , item: ModalItem
              { title
              , description
              , imageUrl
              , headerUrl
              , kitchenId
              , menuId
              , sectionId
              , itemId
              , kitchenName
              , price
              }
          }
      ]

makeModal
  :: { cart :: Poll Cart, setCart :: Cart -> Effect Unit, item :: ModalItem } -> Nut
makeModal { item, cart, setCart } = Deku.do
  setModalElt /\ modalElt <- useHot Nothing
  let ModalItem { kitchenId, sectionId, menuId, itemId } = item
  IM.ionModal
    [ IM.initialBreakpoint_ 0.90
    , IM.trigger_ $ modalId kitchenId sectionId menuId itemId
    , Self.selfT_ \m -> do
        IM.breakpoints m [ 0.0, 0.9 ]
        setModalElt (Just m)
    ]
    [ item #
        \( ModalItem
             { title, description, imageUrl, headerUrl, kitchenName, price, kitchenId, menuId, sectionId, itemId }
         ) ->
          D.div [ DA.klass_ "flex flex-col h-[90%]" ]
            [ D.div_
                [ imageUrl # maybe mempty \url -> IMG.ionImg
                    [ DA.src_ url
                    , DA.alt_ title
                    , DA.klass_ "w-full"
                    ]
                    []
                ]
            , D.div [ DA.klass_ "p-4 grow overflow-y-scroll" ]
                [ IMG.ionImg
                    [ DA.src_ headerUrl
                    , DA.alt_ title
                    , DA.klass_ "w-1/4"
                    ]
                    []
                , D.h1
                    [ DA.klass_ "text-2xl font-bold mt-4" ]
                    [ text_ title ]
                , D.div [ DA.klass_ "mt-4 text-red-500 font-semibold" ]
                    [ text_
                        ( "€" <> NF.toStringWith (NF.fixed 2)
                            ( toNumber (description # maybe 600 \d -> if String.length d > 30 then 1350 else 600) /
                                100.0
                            )
                        )
                    ]
                , description # maybe mempty \d -> D.p
                    [ DA.klass_ "text-lg text-gray-500 mt-4" ]
                    [ text_ d ]
                ]
            , Deku.do
                setQuantity /\ quantity <- useState 1
                D.div [ DA.klass_ "flex space-x-2 w-full p-4 bg-white" ]
                  [ D.div
                      [ DA.klass_ "flex items-center justify-center border-2 border-gray-300 rounded-md w-1/3"
                      ]
                      [ D.button
                          [ DA.klass_ "px-4 py-2 text-xl font-semibold text-gray-700"
                          , runOn DL.click $ quantity <#> \q -> if (q > 1) then setQuantity (q - 1) else mempty
                          ]
                          [ text_ "-" ]
                      , D.span [ DA.klass_ "px-4 py-2 text-lg font-semibold text-gray-900" ]
                          [ text $ show <$> quantity ]
                      , D.button
                          [ DA.klass_ "px-4 py-2 text-xl font-semibold text-gray-700"
                          , runOn DL.click $ quantity <#> \q -> setQuantity (q + 1)
                          ]
                          [ text_ "+" ]
                      ]
                  , D.div [ DA.klass_ "grow" ]
                      [ IB.ionButton
                          [ IB.color_ E.dark
                          , IB.expand_ E.buttonexpandBlock
                          , runOn DL.click $ ({ q: _, c: _, m: _ } <$> quantity <*> cart <*> modalElt) <#>
                              \{ q, c: Cart { items }, m } -> do
                                setCart $ Cart
                                  { items:
                                      replicate q
                                        ( CartItem
                                            { kitchenId
                                            , kitchenName
                                            , kitchenHeaderUrl: headerUrl
                                            , menuId
                                            , sectionId
                                            , itemId
                                            , imageUrl
                                            , title
                                            , description
                                            , price
                                            }
                                        ) <> items
                                  }
                                for_ m \m' -> IM.dismiss m' (write {}) "add-to-cart"
                          ]
                          [ text_ "Add to order"
                          ]
                      ]
                  ]
            ]
    ]
