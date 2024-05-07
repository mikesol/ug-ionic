module Data where

import Prelude

import Assets.Image as Image
import Data.Array.NonEmpty as NAE
import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Data.NonEmpty as NE

newtype Kitchen' a = Kitchen
  { id :: Int
  , name :: String
  , description :: String
  , slug :: String
  , imageUrl :: String
  , headerUrl :: String
  , menus :: Array a
  }

newtype Menu' a = Menu
  { id :: Int
  , title :: String
  , description :: Maybe String
  , sections :: Array a
  }

type Menu = Menu' Section
type Kitchen = Kitchen' Menu

type FlatMenu = Menu' (Either Section Item)
type FlatKitchen = Kitchen' FlatMenu

newtype Section = Section
  { id :: Int
  , title :: String
  , description :: Maybe String
  , items :: Array Item
  }

newtype Item = Item
  { id :: Int
  , imageUrl :: Maybe String
  , title :: Maybe String
  , description :: Maybe String
  }

kitchens :: NAE.NonEmptyArray Kitchen
kitchens =
  NAE.fromNonEmpty $ NE.NonEmpty
    ( Kitchen
        { id: 2
        , name: "Otoro"
        , description:
            "Welcome to the tastes of Nikkei, a unique combination of traditional Japanese dishes made with Peruvian ingredients and its bold flavours. Already a hit in New York’s trendy Manhattan, this special cuisine is now offered for the first time in Finland."
        , imageUrl: Image.otoroLogo
        , headerUrl: Image.otoro
        , slug: "Japanese Cuisine"
        , menus:
            [ Menu
                { id: 16
                , title: "À la carte"
                , description: Nothing
                , sections:
                    [ Section
                        { id: 35
                        , title: "Makimonos"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 145
                                , imageUrl: Nothing
                                , title: Just "Natura"
                                , description: Just """Nasu & Shiitake"""
                                }
                            , Item
                                { id: 147
                                , imageUrl: Just Image.k2_16_35_147
                                , title: Just "Atlantic Roll"
                                , description: Just """Salmon, swimcrab, avocado"""
                                }
                            , Item
                                { id: 146
                                , imageUrl: Just Image.k2_16_35_146
                                , title: Just "Tuna Picante"
                                , description: Just
                                    """Wild-caught Bluefin Tuna, house-made chili oil, red dragon, cucumber, tempura crumbs"""
                                }
                            , Item
                                { id: 445
                                , imageUrl: Nothing
                                , title: Just "Nigiris set: tuna, salmon, iberico"
                                , description: Just """6 units / 2 each"""
                                }
                            , Item
                                { id: 148
                                , imageUrl: Just Image.k2_16_35_148
                                , title: Just "Mediterranean"
                                , description: Just """Tuna or catch of the week, daikon, vegetables """
                                }
                            , Item
                                { id: 448
                                , imageUrl: Just Image.k2_16_35_448
                                , title: Just "Tuna nigiri"
                                , description: Nothing
                                }
                            , Item
                                { id: 446
                                , imageUrl: Just Image.k2_16_35_446
                                , title: Just "Iberico nigiri"
                                , description: Nothing
                                }
                            , Item
                                { id: 447
                                , imageUrl: Just Image.k2_16_35_447
                                , title: Just "Salmon nigiri"
                                , description: Nothing
                                }
                            ]
                        }
                    , Section
                        { id: 36
                        , title: "Ninozen / Sharing Dishes"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 150
                                , imageUrl: Nothing
                                , title: Just "Anticucho nigiris"
                                , description: Just
                                    """4 pieces: tuna (4€), salmon (3€), catch of the week (4€), Iberico (3,50€)"""
                                }
                            , Item
                                { id: 149
                                , imageUrl: Just Image.k2_16_36_149
                                , title: Just "Catch Of The Week"
                                , description: Just """Nigiri. Served with yellow anticucho sauce"""
                                }
                            , Item
                                { id: 151
                                , imageUrl: Just Image.k2_16_36_151
                                , title: Just "Spicy Caramel Pork Belly"
                                , description: Just """Braised pork belly, jalapeño salsa, spicy caramel sauce"""
                                }
                            , Item
                                { id: 274
                                , imageUrl: Just Image.k2_16_36_274
                                , title: Just "Sea Urchin"
                                , description: Just """Gunkans"""
                                }
                            , Item
                                { id: 275
                                , imageUrl: Just Image.k2_16_36_275
                                , title: Just "Avocado"
                                , description: Just """Avocado, soy marinade, rice, nori"""
                                }
                            , Item
                                { id: 278
                                , imageUrl: Just Image.k2_16_36_278
                                , title: Just "Spicy Caramel Pork Belly"
                                , description: Just """Braised pork belly, jalapeño salsa, spicy caramel sauce."""
                                }
                            , Item
                                { id: 271
                                , imageUrl: Just Image.k2_16_36_271
                                , title: Just "Iberico"
                                , description: Just """Nigiri. Served with truffle oil and yuzu"""
                                }
                            , Item
                                { id: 277
                                , imageUrl: Just Image.k2_16_36_277
                                , title: Just "Chutoro"
                                , description: Just """Wild caught tuna tartar, red sauce, negi, chives"""
                                }
                            , Item
                                { id: 273
                                , imageUrl: Just Image.k2_16_36_273
                                , title: Just "Salmon"
                                , description: Just """Nigiri. Served with yellow anticucho sauce"""
                                }
                            , Item
                                { id: 272
                                , imageUrl: Just Image.k2_16_36_272
                                , title: Just "Tuna"
                                , description: Just """Nigiri. Served with yellow anticucho sauce"""
                                }
                            , Item
                                { id: 276
                                , imageUrl: Just Image.k2_16_36_276
                                , title: Just "Ikura"
                                , description: Just """Ikura roe, marinade, nori, rice"""
                                }
                            ]
                        }
                    , Section
                        { id: 37
                        , title: "Mēnkōsu / Main Courses"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 468
                                , imageUrl: Just Image.k2_16_37_468
                                , title: Just "Salmon poke"
                                , description: Just
                                    """Steamed rice, pickled ginger, seaweed salad, bamboo shoots, goma wakame, cucumber. Served with homemade Ponzu sauce."""
                                }
                            , Item
                                { id: 153
                                , imageUrl: Nothing
                                , title: Just "Yellow Tiradito (sashimi style)"
                                , description: Just """Catch of the week, aji amarillo sauce, salsa, lime"""
                                }
                            , Item
                                { id: 152
                                , imageUrl: Just Image.k2_16_37_152
                                , title: Just "Salmon Yuzu (fresh ramen)"
                                , description: Just
                                    """Salmon marinated in yuzu sauce. Handmade noodles, bamboo shoots, ginger, wakame salad, cucumber, cherry tomatoes, marinated egg"""
                                }
                            , Item
                                { id: 428
                                , imageUrl: Nothing
                                , title: Just "Tuna poke"
                                , description: Just
                                    """Steamed rice, pickled ginger, seaweed salad, bamboo shoots, goma wakame, cucumber. Served with homemade Ponzu sauce."""
                                }
                            , Item
                                { id: 470
                                , imageUrl: Just Image.k2_16_37_470
                                , title: Just "Aubergine Miso poke"
                                , description: Just
                                    """Steamed rice, pickled ginger, seaweed salad, bamboo shoots, goma wakame, cucumber. Served with homemade Ponzu sauce."""
                                }
                            , Item
                                { id: 427
                                , imageUrl: Just Image.k2_16_37_427
                                , title: Just "Miso Cheese (hot ramen)"
                                , description: Just
                                    """Handmade noodles, cured spanish cheese, red miso, marinated  egg, enoki & shimeji mushrooms, bamboo, spring onion"""
                                }
                            , Item
                                { id: 429
                                , imageUrl: Just Image.k2_16_37_429
                                , title: Just "Seafood (hot ramen)"
                                , description: Just
                                    """Handmade noodles, octopus & swimcrab meat, marinated egg, pak choy"""
                                }
                            , Item
                                { id: 469
                                , imageUrl: Just Image.k2_16_37_469
                                , title: Just "Chicken Yakitori Poke"
                                , description: Just
                                    """Steamed rice, pickled ginger, seaweed salad, bamboo shoots, goma wakame, cucumber. Served with homemade Ponzu sauce."""
                                }
                            , Item
                                { id: 430
                                , imageUrl: Just Image.k2_16_37_430
                                , title: Just "Iberico (hot ramen)"
                                , description: Just
                                    """Handmade noodles, iberico belly, panceta, bamboo, marinated egg, nori"""
                                }
                            , Item
                                { id: 154
                                , imageUrl: Just Image.k2_16_37_154
                                , title: Just "Wild tuna (fresh ramen)"
                                , description: Just
                                    """Wild caught Bluefin tuna. Handmade noodles, bamboo shoots, ginger, wakame salad, cucumber, cherry tomatoes, marinated egg"""
                                }
                            , Item
                                { id: 155
                                , imageUrl: Just Image.k2_16_37_155
                                , title: Just "Shiitake Cheese (fresh ramen)"
                                , description: Just
                                    """Fresh spanish cheese & pickled shiitake. Handmade noodles, bamboo shoots, ginger, wakame salad, cucumber, cherry tomatoes, marinated egg"""
                                }
                            ]
                        }
                    , Section
                        { id: 38
                        , title: "Desāto / Dessert"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 156
                                , imageUrl: Just Image.k2_16_38_156
                                , title: Just "Dessert"
                                , description: Just """Seasonal ice cream, lychee & coco emulsion, Thai-basil sauce"""
                                }
                            ]
                        }
                    , Section
                        { id: 81
                        , title: "Housemade Bao Brioches"
                        , description: Just """2 pcs"""
                        , items:
                            [ Item
                                { id: 450
                                , imageUrl: Just Image.k2_16_81_450
                                , title: Just "Wild Tuna Bun (2 pcs)"
                                , description: Just
                                    """Wild-caught tuna, cured spanish cheese, crunchy quinoa, wasabi mayo, pickled red onion"""
                                }
                            , Item
                                { id: 449
                                , imageUrl: Just Image.k2_16_81_449
                                , title: Just "Octobun (2 pcs)"
                                , description: Just """Slow-cooked octopus, corn, mango-ají sauce, spring onion"""
                                }
                            , Item
                                { id: 451
                                , imageUrl: Just Image.k2_16_81_451
                                , title: Just "Spicy Caramel Pork Bun (2 pcs)"
                                , description: Just
                                    """Braised pork belly, jalapeño salsa, spicy caramel sauce, housemade pickles"""
                                }
                            , Item
                                { id: 490
                                , imageUrl: Just Image.k2_16_81_490
                                , title: Just "Chili Crab Prawn Bun (2 pcs)"
                                , description: Just
                                    """Spanish prawns, swimcrab, jalapeño dressing, wasabi mayo, chili oil, shichimi togarashi, spring onion"""
                                }
                            ]
                        }
                    , Section
                        { id: 84
                        , title: "makimonos "
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 460
                                , imageUrl: Nothing
                                , title: Just "Atlantic "
                                , description: Just """Salmon, swimcrab"""
                                }
                            , Item
                                { id: 461
                                , imageUrl: Nothing
                                , title: Just "Mediterranean"
                                , description: Just """Tuna or Catch of the week, daikon, vegetables"""
                                }
                            , Item
                                { id: 463
                                , imageUrl: Nothing
                                , title: Just "Natura  - Nasu & Shiitake "
                                , description: Nothing
                                }
                            , Item
                                { id: 459
                                , imageUrl: Nothing
                                , title: Just "Atlantic "
                                , description: Just """Salmon, swimcrab"""
                                }
                            , Item
                                { id: 458
                                , imageUrl: Nothing
                                , title: Just "Mediterranean"
                                , description: Just """Tuna or Catch of the week, daikon, vegetables"""
                                }
                            , Item
                                { id: 464
                                , imageUrl: Nothing
                                , title: Just "Natura  - Nasu & Shiitake "
                                , description: Nothing
                                }
                            , Item
                                { id: 466
                                , imageUrl: Nothing
                                , title: Just "Atlantic "
                                , description: Just """Salmon, swimcrab"""
                                }
                            , Item { id: 456, imageUrl: Nothing, title: Just "Tuna Picante", description: Nothing }
                            , Item
                                { id: 455
                                , imageUrl: Nothing
                                , title: Just "Natura  - Nasu & Shiitake "
                                , description: Nothing
                                }
                            , Item { id: 467, imageUrl: Nothing, title: Just "Tuna Picante", description: Nothing }
                            , Item { id: 453, imageUrl: Nothing, title: Just "Tuna Picante", description: Nothing }
                            , Item
                                { id: 454
                                , imageUrl: Nothing
                                , title: Just "Mediterranean"
                                , description: Just """Tuna or Catch of the week, daikon, vegetables"""
                                }
                            , Item
                                { id: 457
                                , imageUrl: Nothing
                                , title: Just "Natura  - Nasu & Shiitake "
                                , description: Nothing
                                }
                            , Item
                                { id: 465
                                , imageUrl: Nothing
                                , title: Just "Mediterranean"
                                , description: Just """Tuna or Catch of the week, daikon, vegetables"""
                                }
                            , Item
                                { id: 462
                                , imageUrl: Nothing
                                , title: Just "Tuna Picante"
                                , description: Just """Tuna, cucumber, tempura crumbs"""
                                }
                            , Item
                                { id: 452
                                , imageUrl: Nothing
                                , title: Just "Atlantic "
                                , description: Just """Salmon, swimcrab"""
                                }
                            ]
                        }
                    ]
                }
            , Menu
                { id: 17
                , title: "Lunch"
                , description: Just """(No nuts are used in this kitchen)"""
                , sections:
                    [ Section
                        { id: 39
                        , title: "Sets"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 157
                                , imageUrl: Nothing
                                , title: Just "8 pieces + Aka miso soup"
                                , description: Just """6 Uramaki and 2 nigiri """
                                }
                            , Item
                                { id: 158
                                , imageUrl: Just Image.k2_17_39_158
                                , title: Just "12 pieces + Aka miso soup"
                                , description: Just """10 Uramaki and 2 nigiri"""
                                }
                            ]
                        }
                    , Section
                        { id: 40
                        , title: "Poke"
                        , description: Just """All served with homemade Ponzu sauce"""
                        , items:
                            [ Item
                                { id: 160
                                , imageUrl: Just Image.k2_17_40_160
                                , title: Just "Chicken Yakitori Poke"
                                , description: Just
                                    """Steamed rice, pickled ginger, seaweed salad, bamboo shoots, goma wakame, cucumber. Served with Ponzu sauce."""
                                }
                            , Item
                                { id: 161
                                , imageUrl: Just Image.k2_17_40_161
                                , title: Just "Salmon Poke"
                                , description: Just
                                    """Steamed rice, pickled ginger, seaweed salad, bamboo shoots, goma wakame, cucumber. Served with Ponzu sauce."""
                                }
                            , Item
                                { id: 399
                                , imageUrl: Nothing
                                , title: Just "Tuna Poke"
                                , description: Just
                                    """Steamed rice, pickled ginger, seaweed salad, bamboo shoots, goma wakame, cucumber. Served with Ponzu sauce."""
                                }
                            , Item
                                { id: 159
                                , imageUrl: Just Image.k2_17_40_159
                                , title: Just "Aubergine Miso Poke"
                                , description: Just
                                    """Steamed rice, pickled ginger, seaweed salad, bamboo shoots, goma wakame, cucumber. Served with Ponzu sauce."""
                                }
                            ]
                        }
                    , Section
                        { id: 43
                        , title: "Test"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 164
                                , imageUrl: Nothing
                                , title: Just "Test"
                                , description: Just
                                    """Test
"""
                                }
                            ]
                        }
                    , Section
                        { id: 72
                        , title: "Ramen"
                        , description: Nothing
                        , items:
                            [ Item { id: 400, imageUrl: Nothing, title: Nothing, description: Nothing }
                            , Item
                                { id: 484
                                , imageUrl: Just Image.k2_17_72_484
                                , title: Just "Iberico (hot ramen)"
                                , description: Just
                                    """Handmade noodles, iberico chasu, panceta, marinated, bamboo, marinated egg, nori"""
                                }
                            , Item
                                { id: 387
                                , imageUrl: Just Image.k2_17_72_387
                                , title: Just "Salmon  Yuzu (fresh ramen)"
                                , description: Just
                                    """Salmon marinated in yuzu sauce. Handmade noodles, bamboo shoots, ginger, wakame salad, cucumber, cherry tomatoes, bamboo, marinade egg"""
                                }
                            , Item
                                { id: 471
                                , imageUrl: Just Image.k2_17_72_471
                                , title: Just "Wild Tuna (fresh ramen)"
                                , description: Just
                                    """Wild caught Bluefin tuna. Handmade noodles, bamboo shoots, ginger, wakame salad, cucumber, cherry tomatoes, bamboo, marinade egg"""
                                }
                            , Item
                                { id: 482
                                , imageUrl: Just Image.k2_17_72_482
                                , title: Just "Miso Cheese (hot ramen)"
                                , description: Just
                                    """Handmade noodles, cured spanish cheese, red miso, marinatedegg, enoki & shimeji mushrooms, bamboo, spring onion"""
                                }
                            , Item
                                { id: 483
                                , imageUrl: Just Image.k2_17_72_483
                                , title: Just "Seafood (hot ramen)"
                                , description: Just
                                    """Handmade noodles, octopus & swimcrab meat, marinated egg, pak choy"""
                                }
                            , Item
                                { id: 472
                                , imageUrl: Just Image.k2_17_72_472
                                , title: Just "Shiitake Cheese (fresh ramen)"
                                , description: Just
                                    """Fresh spanish cheese & pickled shiitake. Handmade noodles, bamboo shoots, ginger, wakame salad, cucumber, cherry tomatoes, bamboo, marinade egg"""
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    )
    [ Kitchen
        { id: 3
        , name: "Hummus Brothers"
        , description:
            "Hummus Brothers is the first restaurant in Finland that focuses on Hummus and other products produced from chickpeas. Our goal is to introduce some of the most traditional features of enjoying hummus, as well as other Middle East-inspired dishes while retaining the advantages of local production and Finnish values."
        , imageUrl: Image.hummusBrothersLogo
        , headerUrl: Image.hummusBros
        , slug: "Middle Eastern Cuisine"
        , menus:
            [ Menu
                { id: 18
                , title: "À la Carte"
                , description: Nothing
                , sections:
                    [ Section
                        { id: 56
                        , title: "Hummus Plates"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 226
                                , imageUrl: Just Image.k3_18_56_226
                                , title: Just "Marinated Chickpeas"
                                , description: Just
                                    """Hummus with chickpeas cooked in an oriental mix of spices. The most traditional way of enjoying hummus!
Served with a fresh market salad, pickled roots & vegetables, and a warm & fluffy pita bread."""
                                }
                            , Item
                                { id: 229
                                , imageUrl: Just Image.k3_18_56_229
                                , title: Just "Marinated Chickpeas"
                                , description: Just
                                    """Hummus with chickpeas cooked in an oriental mix of spices. The most traditional way of enjoying hummus!
Served with a fresh market salad, pickled roots & vegetables, fried aubergine slices topped with parsley-tahini, and a warm & fluffy pita bread."""
                                }
                            , Item
                                { id: 233
                                , imageUrl: Just Image.k3_18_56_233
                                , title: Just "Fresh Falafel"
                                , description: Just
                                    """Hummus topped with our own fresh and crispy falafel. 
Served with a fresh market salad, pickled roots & vegetables, Moroccon carrots, and a warm & fluffy pita bread."""
                                }
                            , Item
                                { id: 237
                                , imageUrl: Just Image.k3_18_56_237
                                , title: Just "Mushrooms & Onion"
                                , description: Just
                                    """Hummus loaded with mushrooms & onions cooked in soy sauce. A classic on the menu of hummus restaurants around the world.
Served with a fresh market salad, pickled roots & vegetables, chickpeas marinated in oriental spices, and a warm & fluffy pita bread."""
                                }
                            , Item
                                { id: 238
                                , imageUrl: Just Image.k3_18_56_238
                                , title: Just "Chicken Shwarma"
                                , description: Just
                                    """Hummus loaded with sliced chicken thighs, cooked in oriental spices. Best seller. 
Served with a fresh market salad, pickled roots & vegetables, fried aubergine slices topped with parsley-tahini, and a warm & fluffy pita bread."""
                                }
                            , Item
                                { id: 246
                                , imageUrl: Just Image.k3_18_56_246
                                , title: Just "Shakshuka"
                                , description: Just
                                    """Hummus topped with mildly spicy tomato-pepper salsa and a delicious soft-boiled egg on top."""
                                }
                            , Item
                                { id: 242
                                , imageUrl: Just Image.k3_18_56_242
                                , title: Just "Shakshuka"
                                , description: Just
                                    """Hummus topped with mildly spicy tomato-pepper salsa and a delicious soft-boiled egg on top."""
                                }
                            , Item
                                { id: 239
                                , imageUrl: Just Image.k3_18_56_239
                                , title: Just "Marinated Chickpeas"
                                , description: Just
                                    """Hummus with chickpeas cooked in an oriental mix of spices. The most traditional way of enjoying hummus!
Served with a fresh market salad, pickled roots & vegetables, fried aubergine slices topped with parsley-tahini, and a warm & fluffy pita bread."""
                                }
                            , Item
                                { id: 241
                                , imageUrl: Just Image.k3_18_56_241
                                , title: Just "Chicken Shwarma"
                                , description: Just
                                    """Hummus loaded with sliced chicken thighs, cooked in oriental spices. Best seller. 
Served with a fresh market salad, pickled roots & vegetables, fried aubergine slices topped with parsley-tahini, and a warm & fluffy pita bread."""
                                }
                            , Item
                                { id: 236
                                , imageUrl: Just Image.k3_18_56_236
                                , title: Just "Shakshuka"
                                , description: Just
                                    """Hummus topped with mildly spicy tomato-pepper salsa and a delicious soft-boiled egg on top."""
                                }
                            , Item
                                { id: 234
                                , imageUrl: Just Image.k3_18_56_234
                                , title: Just "Fresh Falafel"
                                , description: Just
                                    """Hummus topped with our own fresh and crispy falafel. 
Served with a fresh market salad, pickled roots & vegetables, Moroccon carrots, and a warm & fluffy pita bread."""
                                }
                            , Item
                                { id: 247
                                , imageUrl: Just Image.k3_18_56_247
                                , title: Just "Mushrooms & Onion"
                                , description: Just
                                    """Hummus loaded with mushrooms & onions cooked in soy sauce. A classic on the menu of hummus restaurants around the world.
Served with a fresh market salad, pickled roots & vegetables, chickpeas marinated in oriental spices, and a warm & fluffy pita bread."""
                                }
                            , Item
                                { id: 245
                                , imageUrl: Just Image.k3_18_56_245
                                , title: Just "Fresh Falafel"
                                , description: Just
                                    """Hummus topped with our own fresh and crispy falafel. 
Served with a fresh market salad, pickled roots & vegetables, Moroccon carrots, and a warm & fluffy pita bread."""
                                }
                            , Item
                                { id: 232
                                , imageUrl: Just Image.k3_18_56_232
                                , title: Just "Chicken Shwarma"
                                , description: Just
                                    """Hummus loaded with sliced chicken thighs, cooked in oriental spices. Best seller. 
Served with a fresh market salad, pickled roots & vegetables, fried aubergine slices topped with parsley-tahini, and a warm & fluffy pita bread."""
                                }
                            , Item
                                { id: 431
                                , imageUrl: Just Image.k3_18_56_431
                                , title: Just "Bolognese"
                                , description: Just
                                    """Hummus loaded with minced beef in our home-made creamy tomato sauce. HB Legend! 
Served with a fresh market salad, fried aubergine slices topped with parsley-tahini, and a warm & fluffy pita bread."""
                                }
                            , Item
                                { id: 228
                                , imageUrl: Just Image.k3_18_56_228
                                , title: Just "Shakshuka"
                                , description: Just
                                    """Hummus topped with mildly spicy tomato-pepper salsa and a delicious soft-boiled egg on top. Chef’s recommendation.
Served with a fresh market salad, fried aubergine slices topped with parsley-tahini, and a warm & fluffy pita bread."""
                                }
                            , Item
                                { id: 230
                                , imageUrl: Just Image.k3_18_56_230
                                , title: Just "Mushrooms & Onion"
                                , description: Just
                                    """Hummus loaded with mushrooms & onions cooked in soy sauce. A classic on the menu of hummus restaurants around the world.
Served with a fresh market salad, chickpeas marinated in oriental spices, and a warm & fluffy pita bread."""
                                }
                            , Item
                                { id: 235
                                , imageUrl: Just Image.k3_18_56_235
                                , title: Just "Marinated Chickpeas"
                                , description: Just
                                    """Hummus with chickpeas cooked in an oriental mix of spices. The most traditional way of enjoying hummus!
Served with a fresh market salad, pickled roots & vegetables, fried aubergine slices topped with parsley-tahini, and a warm & fluffy pita bread."""
                                }
                            , Item
                                { id: 231
                                , imageUrl: Just Image.k3_18_56_231
                                , title: Just "Shakshuka"
                                , description: Just
                                    """Hummus topped with mildly spicy tomato-pepper salsa and a delicious soft-boiled egg on top."""
                                }
                            , Item
                                { id: 248
                                , imageUrl: Just Image.k3_18_56_248
                                , title: Just "Chicken Shwarma"
                                , description: Just
                                    """Hummus loaded with sliced chicken thighs, cooked in oriental spices. Best seller. 
Served with a fresh market salad, pickled roots & vegetables, fried aubergine slices topped with parsley-tahini, and a warm & fluffy pita bread."""
                                }
                            , Item
                                { id: 244
                                , imageUrl: Just Image.k3_18_56_244
                                , title: Just "Marinated Chickpeas"
                                , description: Just
                                    """Hummus with chickpeas cooked in an oriental mix of spices. The most traditional way of enjoying hummus!
Served with a fresh market salad, pickled roots & vegetables, fried aubergine slices topped with parsley-tahini, and a warm & fluffy pita bread."""
                                }
                            , Item
                                { id: 240
                                , imageUrl: Just Image.k3_18_56_240
                                , title: Just "Mushrooms & Onion"
                                , description: Just
                                    """Hummus loaded with mushrooms & onions cooked in soy sauce. A classic on the menu of hummus restaurants around the world.
Served with a fresh market salad, pickled roots & vegetables, chickpeas marinated in oriental spices, and a warm & fluffy pita bread."""
                                }
                            , Item
                                { id: 243
                                , imageUrl: Just Image.k3_18_56_243
                                , title: Just "Fresh Falafel"
                                , description: Just
                                    """Hummus topped with our own fresh and crispy falafel. 
Served with a fresh market salad, pickled roots & vegetables, Moroccon carrots, and a warm & fluffy pita bread."""
                                }
                            , Item
                                { id: 227
                                , imageUrl: Just Image.k3_18_56_227
                                , title: Just "Fresh Falafel"
                                , description: Just
                                    """Hummus topped with our own fresh and crispy falafel. 
Served with a fresh market salad, Moroccan carrots, and a warm & fluffy pita bread."""
                                }
                            , Item
                                { id: 384
                                , imageUrl: Just Image.k3_18_56_384
                                , title: Just "Chicken Shwarma"
                                , description: Just
                                    """Hummus loaded with sliced chicken thighs, cooked in oriental spices. Best seller.
Served with a fresh market salad, fried aubergine slices topped with parsley-tahini, and a warm & fluffy pita bread."""
                                }
                            ]
                        }
                    , Section
                        { id: 57
                        , title: "Burgers & Sandwiches"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 249
                                , imageUrl: Just Image.k3_18_57_249
                                , title: Just "HumBurger"
                                , description: Just
                                    """A vegan brioche bun, crispy chickpea patty, hummus, harissa sauce, tomato, harissa-coleslaw, red onion with sumac & parsley, green tahini. 
Served with fries and a fresh market salad."""
                                }
                            , Item
                                { id: 394
                                , imageUrl: Nothing
                                , title: Just "Holiday menu"
                                , description: Just
                                    """This tasting menu represents a traditional family holiday dinner that consists of varying 7-8 appetizers and salads meant for sharing. Includes a small hummus plate and two warm & fluffy pita breads"""
                                }
                            , Item
                                { id: 250
                                , imageUrl: Just Image.k3_18_57_250
                                , title: Just "Chicken Brutal Sandwich"
                                , description: Just
                                    """Grilled oat-flax bread, shwarma spiced chicken, hummus, caramelized peppers & onions in soy, harissa-coleslaw, tomato, red onion with sumac & parsley, green tahini.
Served with fries and a fresh market salad."""
                                }
                            , Item
                                { id: 251
                                , imageUrl: Just Image.k3_18_57_251
                                , title: Just "Smoked Brisket Sandwich"
                                , description: Just
                                    """Grilled oat-flax bread, smoked beef brisket, caramelized peppers & onions in soy, tomato, harissa-mayo, honey mustard, chimichurri.
Served with fries and a fresh market salad."""
                                }
                            , Item
                                { id: 420
                                , imageUrl: Just Image.k3_18_57_420
                                , title: Just "LamBurger"
                                , description: Just
                                    """A 140g patty made of a lamb & beef mixture prepared and seasoned in a traditional East-Mediterranean way, honey mustard, harissa-mayo, chimichurri, pickled red onion, and tahini. Served with fries and a fresh market salad."""
                                }
                            ]
                        }
                    , Section
                        { id: 58
                        , title: "To Share"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 254
                                , imageUrl: Just Image.k3_18_58_254
                                , title: Just "Holiday Menu"
                                , description: Just
                                    """This tasting menu represents a traditional family holiday dinner that consists of varying 6-7 appetizers and salads meant for sharing. Includes a small hummus plate and a warm & fluffy pita bread."""
                                }
                            , Item
                                { id: 253
                                , imageUrl: Just Image.k3_18_58_253
                                , title: Just "Holiday Menu"
                                , description: Just
                                    """This tasting menu represents a traditional family holiday dinner that consists of varying 6-7 appetizers and salads meant for sharing. Includes a small hummus plate and a warm & fluffy pita bread."""
                                }
                            , Item
                                { id: 255
                                , imageUrl: Just Image.k3_18_58_255
                                , title: Just "Holiday Menu"
                                , description: Just
                                    """This tasting menu represents a traditional family holiday dinner that consists of varying 6-7 appetizers and salads meant for sharing. Includes a small hummus plate and a warm & fluffy pita bread."""
                                }
                            , Item
                                { id: 252
                                , imageUrl: Just Image.k3_18_58_252
                                , title: Just "Holiday Menu"
                                , description: Just
                                    """This tasting menu represents a traditional family holiday dinner that consists of varying 7-8 mezes &t tapas, meant for sharing. Includes a small hummus plate, and 2 warm & fluffy pita breads."""
                                }
                            ]
                        }
                    , Section
                        { id: 59
                        , title: "Appetizers & Sides"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 264
                                , imageUrl: Just Image.k3_18_59_264
                                , title: Just "Fries topped with oriental spices"
                                , description: Just """Served with harissa-mayo and ketchup"""
                                }
                            , Item
                                { id: 263
                                , imageUrl: Just Image.k3_18_59_263
                                , title: Just "Olivinade"
                                , description: Just """Olive spread"""
                                }
                            , Item
                                { id: 257
                                , imageUrl: Just Image.k3_18_59_257
                                , title: Just "Fried aubergine slices & parsley tahini"
                                , description: Nothing
                                }
                            , Item
                                { id: 259
                                , imageUrl: Just Image.k3_18_59_259
                                , title: Just "Harissa-Coleslaw"
                                , description: Nothing
                                }
                            , Item
                                { id: 260
                                , imageUrl: Just Image.k3_18_59_260
                                , title: Just "Chickpeas marinated in oriental spices"
                                , description: Nothing
                                }
                            , Item
                                { id: 256
                                , imageUrl: Just Image.k3_18_59_256
                                , title: Just "Fresh Market Salad"
                                , description: Just
                                    """Finely chopped tomatoes, cucumbers, and red onions, parsley, topped with olive oil, lemon, salt, and pepper."""
                                }
                            , Item
                                { id: 395
                                , imageUrl: Just Image.k3_18_59_395
                                , title: Just "Matbucha"
                                , description: Just """Finely chopped & slowly cooked peppers & tomatoes"""
                                }
                            , Item
                                { id: 261
                                , imageUrl: Just Image.k3_18_59_261
                                , title: Just "Moroccan Carrots"
                                , description: Just """Carrots cooked in tomato-harissa sauce"""
                                }
                            , Item
                                { id: 258
                                , imageUrl: Just Image.k3_18_59_258
                                , title: Just "Pickled Roots & Vegetables"
                                , description: Nothing
                                }
                            , Item
                                { id: 383
                                , imageUrl: Just Image.k3_18_59_383
                                , title: Just "Extra Pita"
                                , description: Nothing
                                }
                            , Item
                                { id: 385
                                , imageUrl: Just Image.k3_18_59_385
                                , title: Just "Falafel with parsley tahini (4x)"
                                , description: Nothing
                                }
                            , Item
                                { id: 262
                                , imageUrl: Just Image.k3_18_59_262
                                , title: Just "Baba Ganoush"
                                , description: Just """Smoked eggplant salad"""
                                }
                            ]
                        }
                    , Section
                        { id: 77
                        , title: "For kids"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 412
                                , imageUrl: Just Image.k3_18_77_412
                                , title: Just "Fries with shwarma chicken"
                                , description: Just
                                    """A small plate with fries & chicken and little bit of hummus on the side"""
                                }
                            , Item
                                { id: 411
                                , imageUrl: Just Image.k3_18_77_411
                                , title: Just "Fries topped with oriental spices (not spicy)"
                                , description: Just """Served with harissa-mayo & ketchup"""
                                }
                            ]
                        }
                    ]
                }
            , Menu
                { id: 28
                , title: "Monday Lunch"
                , description: Nothing
                , sections:
                    [ Section
                        { id: 64
                        , title: "Burgers & Sandwiches"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 291
                                , imageUrl: Just Image.k3_28_64_291
                                , title: Just "Marinated Chickpeas"
                                , description: Just
                                    """Hummus with chickpeas cooked in an oriental mix of spices. The most traditional way of enjoying hummus!"""
                                }
                            , Item
                                { id: 292
                                , imageUrl: Just Image.k3_28_64_292
                                , title: Just "Fresh Falafel"
                                , description: Just
                                    """Hummus topped with our own fresh and crispy falafel. 
Served with a fresh market salad, pickled roots & vegetables, Moroccon carrots, and a warm & fluffy pita bread."""
                                }
                            , Item { id: 376, imageUrl: Nothing, title: Nothing, description: Nothing }
                            , Item
                                { id: 293
                                , imageUrl: Just Image.k3_28_64_293
                                , title: Just "Chicken Brutal Sandwich"
                                , description: Just
                                    """Grilled oat-flax bread, shwarma spiced chicken, hummus, caramelized peppers & onions in soy, harissa-coleslaw, tomato, red onion with sumac & parsley, green tahini. Served with fries and a fresh market salad."""
                                }
                            ]
                        }
                    , Section
                        { id: 67
                        , title: "Hummus Plates"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 378
                                , imageUrl: Just Image.k3_28_67_378
                                , title: Just "Bolognese"
                                , description: Just
                                    """Hummus loaded with minced beef in our home-made creamy tomato sauce. HB Legend! 
Served with pickles and market salad."""
                                }
                            , Item
                                { id: 377
                                , imageUrl: Just Image.k3_28_67_377
                                , title: Just "Mushrooms & Onion"
                                , description: Just
                                    """Hummus loaded with mushrooms & onions cooked in soy sauce. A classic on the menu of hummus restaurants around the world. Served with pickles and market salad."""
                                }
                            ]
                        }
                    ]
                }
            , Menu
                { id: 29
                , title: "Tuesday Lunch"
                , description: Nothing
                , sections:
                    [ Section
                        { id: 62
                        , title: "Hummus Plates"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 281
                                , imageUrl: Just Image.k3_29_62_281
                                , title: Just "Chicken Shwarma"
                                , description: Just
                                    """Hummus loaded with sliced chicken thighs, cooked in oriental spices. Best seller. Served with pickles and fresh market salad."""
                                }
                            , Item
                                { id: 279
                                , imageUrl: Just Image.k3_29_62_279
                                , title: Just "Shakshuka"
                                , description: Just
                                    """Hummus topped with mildly spicy tomato-pepper salsa and a delicious soft-boiled egg on top. Served with pickles and fresh market salad."""
                                }
                            , Item
                                { id: 280
                                , imageUrl: Just Image.k3_29_62_280
                                , title: Just "HumBurger"
                                , description: Just
                                    """A vegan brioche bun, crispy chickpea patty, hummus, harissa sauce, tomato, harissa-coleslaw, red onion with sumac & parsley, green tahini. 
Served with fries and pickled roots & vegetables."""
                                }
                            ]
                        }
                    , Section
                        { id: 68
                        , title: "Burgers & Sandwiches"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 379
                                , imageUrl: Just Image.k3_29_68_379
                                , title: Just "LamBurger"
                                , description: Just
                                    """A 140g patty made of a lamb & beef mixture prepared and seasoned in a traditional East-Mediterranean way, honey mustard, harissa-mayo, chimichurri, pickled red onion, and tahini. Served with fries and a fresh market salad."""
                                }
                            ]
                        }
                    ]
                }
            , Menu
                { id: 30
                , title: "Wednesday Lunch"
                , description: Nothing
                , sections:
                    [ Section
                        { id: 63
                        , title: "Hummus Plates"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 288
                                , imageUrl: Just Image.k3_30_63_288
                                , title: Just "Mushrooms & Onion"
                                , description: Just
                                    """Hummus loaded with mushrooms & onions cooked in soy sauce. A classic on the menu of hummus restaurants around the world. Served with pickles and fresh market salad."""
                                }
                            , Item
                                { id: 289
                                , imageUrl: Just Image.k3_30_63_289
                                , title: Just "Fresh Falafel"
                                , description: Just
                                    """Hummus topped with our own fresh and crispy falafel. Served with pickles and fresh market salad."""
                                }
                            , Item
                                { id: 290
                                , imageUrl: Just Image.k3_30_63_290
                                , title: Just "Chicken Brutal Sandwich"
                                , description: Just
                                    """Grilled oat-flax bread, shwarma spiced chicken, hummus, caramelized peppers & onions in soy, harissa-coleslaw, tomato, red onion with sumac & parsley, green tahini.
Served with fries and pickled roots & vegetables."""
                                }
                            ]
                        }
                    , Section
                        { id: 69
                        , title: "Burgers & Sandwiches"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 380
                                , imageUrl: Just Image.k3_30_69_380
                                , title: Just "Smoked Brisket Sandwich"
                                , description: Just
                                    """Grilled oat-flax bread, smoked beef brisket, caramelized peppers & onions in soy, tomato, harissa-mayo, honey mustard, chimichurri. Served with fries and a fresh market salad."""
                                }
                            ]
                        }
                    ]
                }
            , Menu
                { id: 31
                , title: "Thursday Lunch"
                , description: Nothing
                , sections:
                    [ Section
                        { id: 65
                        , title: "Hummus Plates"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 295
                                , imageUrl: Just Image.k3_31_65_295
                                , title: Just "Shakshuka"
                                , description: Just
                                    """Hummus topped with mildly spicy tomato-pepper salsa and a delicious soft-boiled egg on top. Served with pickles and fresh market salad"""
                                }
                            , Item
                                { id: 294
                                , imageUrl: Just Image.k3_31_65_294
                                , title: Just "Bolognese"
                                , description: Just
                                    """Hummus loaded with minced beef in our home-made creamy tomato sauce. HB Legend! Served with pickles and fresh market salad."""
                                }
                            , Item
                                { id: 296
                                , imageUrl: Just Image.k3_31_65_296
                                , title: Just "HumBurger"
                                , description: Just
                                    """A vegan brioche bun, crispy chickpea patty, hummus, harissa sauce, tomato, harissa-coleslaw, red onion with sumac & parsley, green tahini. 
Served with fries and pickled roots & vegetables."""
                                }
                            ]
                        }
                    , Section
                        { id: 70
                        , title: "Burgers & Sandwiches"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 381
                                , imageUrl: Just Image.k3_31_70_381
                                , title: Just "HumBurger"
                                , description: Just
                                    """A vegan brioche bun, crispy chickpea patty, hummus, harissa sauce, tomato, harissa-coleslaw, red onion with sumac & parsley, green tahini. Served with fries and a fresh market salad."""
                                }
                            ]
                        }
                    ]
                }
            , Menu
                { id: 32
                , title: "Friday Lunch"
                , description: Nothing
                , sections:
                    [ Section
                        { id: 61
                        , title: "Hummus Plates"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 268
                                , imageUrl: Just Image.k3_32_61_268
                                , title: Just "Fresh Falafel"
                                , description: Just
                                    """Hummus topped with our own fresh and crispy falafel. Served with pickles and fresh market salad."""
                                }
                            , Item
                                { id: 270
                                , imageUrl: Just Image.k3_32_61_270
                                , title: Just "Brisket Sandwich"
                                , description: Just
                                    """Grilled oat-flax bread, smoked beef brisket, caramelized peppers & onions in soy, tomato, harissa-mayo, honey mustard, chimichurri."""
                                }
                            , Item
                                { id: 269
                                , imageUrl: Just Image.k3_32_61_269
                                , title: Just "Chicken Shwarma"
                                , description: Just
                                    """Hummus loaded with sliced chicken thighs, cooked in oriental spices. Best seller. Served with pickles and fresh market salad."""
                                }
                            ]
                        }
                    , Section
                        { id: 71
                        , title: "Burgers & Sandwiches"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 382
                                , imageUrl: Just Image.k3_32_71_382
                                , title: Just "LamBurger"
                                , description: Just
                                    """A 140g patty made of a lamb & beef mixture prepared and seasoned in a traditional East-Mediterranean way, honey mustard, harissa-mayo, chimichurri, pickled red onion, and tahini. 
Served with fries and a fresh market salad."""
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    , Kitchen
        { id: 4
        , name: "Roskakala"
        , description:
            "We serve delicious fish dishes using Finnish “roskakala” - underrated fish we often ignore. They are more work to prepare, but we are the experts. And using local fish is an ecological choice. Hyvää ruokahalua!"
        , imageUrl: Image.roskakalaLogo
        , headerUrl: Image.roskakala
        , slug: "Finnish Seafood"
        , menus:
            [ Menu
                { id: 8
                , title: "À la Carte"
                , description: Just """Our fish is Finnish and sustainable."""
                , sections:
                    [ Section
                        { id: 11
                        , title: "Small Dishes"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 30
                                , imageUrl: Just Image.k4_8_11_30
                                , title: Just "Pan fried smelt "
                                , description: Just """Pan fried smelt & horseradish dip and black pepper ketchup"""
                                }
                            , Item
                                { id: 29
                                , imageUrl: Just Image.k4_8_11_29
                                , title: Just "Cup of French fries"
                                , description: Just
                                    """Cup of French fries & horseradish dip and black pepper ketchup."""
                                }
                            ]
                        }
                    , Section
                        { id: 12
                        , title: "Main Dishes"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 35
                                , imageUrl: Just Image.k4_8_12_35
                                , title: Just "Wallenberg"
                                , description: Just
                                    """Pike (hauki) Wallenberg with mashed potatoes, crushed peas, pickled cucumber, and roasted butter with lemon peel."""
                                }
                            , Item
                                { id: 32
                                , imageUrl: Just Image.k4_8_12_32
                                , title: Just "Fish & Chips"
                                , description: Just
                                    """A crispy bream (lahna) patty with French fries, tartar sauce, Roskakalas own black pepper ketchup, and crushed peas.
May contain fish borns! """
                                }
                            , Item
                                { id: 33
                                , imageUrl: Just Image.k4_8_12_33
                                , title: Just "Fish Burger & French fries"
                                , description: Just
                                    """A brioche bun, crispy roach (särki) patty, mayo with boiled egg, pickled cucumber, red onion, and salad. Served with Roskakalas own black pepper ketchup."""
                                }
                            , Item
                                { id: 31
                                , imageUrl: Just Image.k4_8_12_31
                                , title: Just "Crispy Herring Smelt (norssifritti) & Root Vegetable with Potato Fries"
                                , description: Just
                                    """Served with horseradish mayo, pickled red onion, grated horseradish"""
                                }
                            , Item
                                { id: 34
                                , imageUrl: Just Image.k4_8_12_34
                                , title: Just "Rantakalapihvi"
                                , description: Just
                                    """A bream (lahna) patty, mashed potatoes, nettle sauce, grated egg, pickled red onion and
roasted butter with lemon peel."""
                                }
                            , Item
                                { id: 491
                                , imageUrl: Just Image.k4_8_12_491
                                , title: Just "Pan fried herring smelt and crushed potatoes"
                                , description: Just """Served with sour milk sauce with dill and pickled vegetables"""
                                }
                            ]
                        }
                    , Section
                        { id: 13
                        , title: "Dessert"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 36
                                , imageUrl: Just Image.k4_8_13_36
                                , title: Just "Vanilla ice cream with lingonberry sauce"
                                , description: Just
                                    """Vanilla ice cream from the Helsinki Ice Cream Factory, lingonberry sauce, and salted caramel crumble."""
                                }
                            , Item
                                { id: 434
                                , imageUrl: Just Image.k4_8_13_434
                                , title: Just "Vanilla ice cream with caramel sauce"
                                , description: Just
                                    """Helsinki Ice Cream Factory's vanilla ice cream, caramel sauce, and salted caramel crumble."""
                                }
                            ]
                        }
                    , Section
                        { id: 52
                        , title: "Menu"
                        , description: Just """Our fish is finnish and sustainable."""
                        , items: [ Item { id: 212, imageUrl: Nothing, title: Nothing, description: Nothing } ]
                        }
                    , Section
                        { id: 75
                        , title: "Kids menu"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 406
                                , imageUrl: Just Image.k4_8_75_406
                                , title: Just "Crispy Roach nugget"
                                , description: Just """Crispy Roach nugget and French Fries"""
                                }
                            , Item
                                { id: 408
                                , imageUrl: Just Image.k4_8_75_408
                                , title: Just "Rantakalapihvi"
                                , description: Just
                                    """A bream (lahna) patty, mashed potatoes, nettle sauce, grated egg, pickled red onion, and roasted butter."""
                                }
                            , Item
                                { id: 407
                                , imageUrl: Just Image.k4_8_75_407
                                , title: Just "Crispy herring smelt (norssifritti) & root vegetable and potato fries"
                                , description: Just
                                    """Served with horseradish mayo, pickled red onion, grated horseradish."""
                                }
                            , Item
                                { id: 492
                                , imageUrl: Just Image.k4_8_75_492
                                , title: Just "Fish & Chips"
                                , description: Just
                                    """A crispy bream (lahna) with potato fries, tartar sauce, Roskakalas own black pepper ketchup, crushed peas, and roasted butter with lemon peel"""
                                }
                            , Item
                                { id: 493
                                , imageUrl: Just Image.k4_8_75_493
                                , title: Just "Pan fried smelt and mashed potatoes"
                                , description: Just """Served with sour milk sauce with dill and pickled vegetables """
                                }
                            ]
                        }
                    ]
                }
            , Menu
                { id: 35
                , title: "Lunch"
                , description: Just """22.4.2024 - 26.4.2024 week four"""
                , sections:
                    [ Section
                        { id: 79
                        , title: "Lunch"
                        , description: Just """22.4.2024 - 26.4.2024"""
                        , items:
                            [ Item
                                { id: 424
                                , imageUrl: Just Image.k4_35_79_424
                                , title: Just "Pike Loaf"
                                , description: Just """Creamy potatoes with nettle and pickled vegetables"""
                                }
                            , Item
                                { id: 425
                                , imageUrl: Just Image.k4_35_79_425
                                , title: Just "Pike Wallenberg"
                                , description: Just """With mashed potatoes and roasted butter"""
                                }
                            , Item
                                { id: 426
                                , imageUrl: Just Image.k4_35_79_426
                                , title: Just "Dill&sour cream gratinated bream patty"
                                , description: Just """Mashed potatoes, pickled vegetables"""
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    , Kitchen
        { id: 5
        , name: "Klandestina"
        , description:
            "Klandestina is back! Take a trip to the real Mexico. Everything made from scratch, with a big heart. Food that’s fun to share, fun to eat and makes you happy! Try our Kuha Ceviche Tostada – it’s fantastic! Buen Provecho!"
        , imageUrl: Image.klandestinaLogo
        , headerUrl: Image.klandestina
        , slug: "Mexican Cuisine"
        , menus:
            [ Menu
                { id: 2
                , title: "À la Carte"
                , description: Nothing
                , sections:
                    [ Section
                        { id: 2
                        , title: "Appetisers"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 5
                                , imageUrl: Just Image.k5_2_2_5
                                , title: Just "Klandestina Ceviche"
                                , description: Just
                                    """Lime-chili marinated pike-perch, house green salsa, cucumber, red onion, coriander, and spicy mayo."""
                                }
                            , Item
                                { id: 2
                                , imageUrl: Just Image.k5_2_2_2
                                , title: Just "Guacamole & Chips"
                                , description: Just """Avocado, tomato, housemade tortilla chips."""
                                }
                            , Item
                                { id: 3
                                , imageUrl: Just Image.k5_2_2_3
                                , title: Just "Beetroot Salad"
                                , description: Just
                                    """Roasted beetroot, fresh cheese, Avocado, house dressing, red cabbage. Ask for vegan version."""
                                }
                            , Item
                                { id: 4
                                , imageUrl: Just Image.k5_2_2_4
                                , title: Just "Chicken Tostada"
                                , description: Just
                                    """Guacamole, shredded chicken, chipotle mayo, carrot, sour cream."""
                                }
                            ]
                        }
                    , Section
                        { id: 3
                        , title: "Burritos"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 13
                                , imageUrl: Just Image.k5_2_3_13
                                , title: Just "Hawaiian Salmon burrito"
                                , description: Just
                                    """Salmon belly breaded in cornflakes, huge wheat tortilla, chickpea spread, red rice, cheese, chipotle mayo, salad mix.

Fried potatoes on the side."""
                                }
                            , Item
                                { id: 165
                                , imageUrl: Just Image.k5_2_3_165
                                , title: Just "Chicken Pastor Burrito"
                                , description: Just
                                    """Chicken Pastor, huge wheat tortilla, chickpea spread, red rice, cheese, salsa verde, salad mix. Birria sauce.

Fried potatoes on the side."""
                                }
                            , Item
                                { id: 12
                                , imageUrl: Just Image.k5_2_3_12
                                , title: Just "Birria burrito"
                                , description: Just
                                    """Beef birria, huge wheat tortilla, chickpea spread, red rice, cheese, salsa verde, salad mix. Birria sauce.

Fried potatoes on the side."""
                                }
                            ]
                        }
                    , Section
                        { id: 4
                        , title: "Kids’ Menu (old)"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 15
                                , imageUrl: Nothing
                                , title: Just "Chicken Quesadilla"
                                , description: Just
                                    """Corn tortilla, pulled chicken and cheese topped with guacamole. Small side salad."""
                                }
                            , Item
                                { id: 14
                                , imageUrl: Nothing
                                , title: Just "Salmon and Chips"
                                , description: Just
                                    """Salmon breaded in cornflakes, house potatoes. Small side salad."""
                                }
                            ]
                        }
                    , Section
                        { id: 5
                        , title: "Tacos"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 6
                                , imageUrl: Nothing
                                , title: Just "Tofu chorizo and grilled cabbage"
                                , description: Just
                                    """Chorizo Marinated tofu, grilled spiced cabbage, vegan sour cream, coriander."""
                                }
                            , Item
                                { id: 7
                                , imageUrl: Nothing
                                , title: Just "Three Quesabirria "
                                , description: Just
                                    """Slow-cooked braised beef, spicy broth made with spices and chillies, tortilla with grilled cheese, topped with red cabbage, red onion, and coriander. Served with spicy broth."""
                                }
                            , Item
                                { id: 8
                                , imageUrl: Nothing
                                , title: Just "Hawaiian Salmon"
                                , description: Just
                                    """Salmon belly breaded in cornflakes, white cabbage, pineapple pico de gallo, chipotle mayo, coriander."""
                                }
                            , Item
                                { id: 9
                                , imageUrl: Nothing
                                , title: Just "Four Quesabirria"
                                , description: Just
                                    """Slow-cooked braised beef, spicy broth made with spices and chillies, tortilla with grilled cheese, topped with red cabbage, red onion, and coriander. Served with spicy broth."""
                                }
                            , Item
                                { id: 10
                                , imageUrl: Nothing
                                , title: Just "Pork barbacoa"
                                , description: Just
                                    """Slow-cooked pork, black beans, green salsa, onion, and coriander."""
                                }
                            , Item
                                { id: 11
                                , imageUrl: Nothing
                                , title: Just "Pastor chicken"
                                , description: Just
                                    """Pastor marinade chicken thighs, chickpea spread, red salsa, coriander and marinated red onion."""
                                }
                            ]
                        }
                    , Section
                        { id: 41
                        , title: "Test"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 162
                                , imageUrl: Nothing
                                , title: Just "Test Item"
                                , description: Just """Great things come to an end."""
                                }
                            ]
                        }
                    , Section
                        { id: 44
                        , title: "Tacos"
                        , description: Just
                            """Three tacos is the minimal daily recommendation from the Mexican Taco Federation."""
                        , items:
                            [ Item
                                { id: 171
                                , imageUrl: Just Image.k5_2_44_171
                                , title: Just "Hawaiian Salmon"
                                , description: Just
                                    """Salmon belly breaded in cornflakes, white cabbage, pineapple pico de gallo, chipotle mayo, coriander."""
                                }
                            , Item
                                { id: 167
                                , imageUrl: Just Image.k5_2_44_167
                                , title: Just "Quesabirria"
                                , description: Just
                                    """Slow cooked braised beef, savory broth made with spices and chilies, tortilla with grilled cheese, topped with cabbage, red onion, and coriander. Served with its own broth."""
                                }
                            , Item
                                { id: 173
                                , imageUrl: Just Image.k5_2_44_173
                                , title: Just "Soy Chorizo and Grilled Cabbage"
                                , description: Just
                                    """Soy chorizo made in house, grilled spiced cabbage, vegan sour cream, coriander."""
                                }
                            , Item
                                { id: 170
                                , imageUrl: Nothing
                                , title: Just "Soy chorizo and grilled cabbage"
                                , description: Just
                                    """Soy chorizo made in house, grilled spiced cabbage, vegan sour cream, coriander."""
                                }
                            , Item
                                { id: 168
                                , imageUrl: Nothing
                                , title: Just "Pastor chicken"
                                , description: Just
                                    """Pastor marinade chicken thighs, chickpea spread, red salsa, coriander and marinated red onion."""
                                }
                            , Item
                                { id: 166
                                , imageUrl: Just Image.k5_2_44_166
                                , title: Just "Hawaiian Salmon"
                                , description: Just
                                    """Salmon belly breaded in cornflakes, white cabbage, pineapple pico de gallo, chipotle mayo, coriander."""
                                }
                            , Item
                                { id: 169
                                , imageUrl: Just Image.k5_2_44_169
                                , title: Just "Pork Barbacoa"
                                , description: Just """Tender pork, black beans, green salsa, onion, and coriander."""
                                }
                            , Item
                                { id: 172
                                , imageUrl: Just Image.k5_2_44_172
                                , title: Just "Pastor Chicken"
                                , description: Just
                                    """Pastor marinade chicken thighs, chickpea spread, red salsa, coriander, cabbage and marinated red onion."""
                                }
                            ]
                        }
                    , Section
                        { id: 45
                        , title: "Burritos"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 174
                                , imageUrl: Just Image.k5_2_45_174
                                , title: Just "Birria Burrito"
                                , description: Just
                                    """Beef birria, huge wheat tortilla, chickpea spread, red rice, cheese, salsa verde, salad mix. Birria sauce. Fried potatoes on the side."""
                                }
                            , Item
                                { id: 176
                                , imageUrl: Just Image.k5_2_45_176
                                , title: Just "Hawaiian Salmon Burrito"
                                , description: Just
                                    """Salmon belly breaded in cornflakes, huge wheat tortilla, chickpea spread, red rice, cheese, chipotle mayo, salad mix. Fried potatoes on the side."""
                                }
                            , Item
                                { id: 433
                                , imageUrl: Just Image.k5_2_45_433
                                , title: Just "Soya chorizo Burrito (vegan)"
                                , description: Just
                                    """Soya chorizo protein, huge wheat tortilla, chickpea spread, red rice, vegan cheese, chipotle mayo, salad mix. Fried potatoes on the side."""
                                }
                            , Item
                                { id: 175
                                , imageUrl: Just Image.k5_2_45_175
                                , title: Just "Chicken Pastor Burrito"
                                , description: Just
                                    """Chicken Pastor, huge wheat tortilla, chickpea spread, red rice, cheese, salsa verde, salad mix. Birria sauce. Fried potatoes on the side."""
                                }
                            ]
                        }
                    , Section
                        { id: 46
                        , title: "Kids Menu"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 177
                                , imageUrl: Just Image.k5_2_46_177
                                , title: Just "Chicken Quesadilla (2pcs)"
                                , description: Just
                                    """Corn tortilla, pulled chicken and cheese topped with guacamole. Small salad on the side."""
                                }
                            , Item
                                { id: 178
                                , imageUrl: Just Image.k5_2_46_178
                                , title: Just "Salmon and Chips"
                                , description: Just
                                    """Salmon breaded in cornflakes, house potatoes, small salad on the side."""
                                }
                            ]
                        }
                    , Section
                        { id: 66
                        , title: "Tacos Sets"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 403
                                , imageUrl: Just Image.k5_2_66_403
                                , title: Just "Quesabirria (4 tacos)"
                                , description: Just
                                    """Slow-cooked braised beef, spicy broth made with spices and chilies, tortilla with grilled cheese, topped with red cabbage, red onion, and coriander. Served with spicy broth."""
                                }
                            , Item
                                { id: 404
                                , imageUrl: Just Image.k5_2_66_404
                                , title: Just "Pork barbacoa  (4 tacos)"
                                , description: Just
                                    """Slow-cooked pork, black beans, green salsa, onion, and coriander."""
                                }
                            , Item
                                { id: 405
                                , imageUrl: Just Image.k5_2_66_405
                                , title: Just "Soy chorizo and grilled cabbage (4 tacos) "
                                , description: Just
                                    """Roasted soya protein, mushroom, chorizo spices, black lentils, grilled cabbage, red salsa, vegan sour cream, pico de gallo."""
                                }
                            , Item
                                { id: 347
                                , imageUrl: Just Image.k5_2_66_347
                                , title: Just "Hawaiian Salmon (3 tacos)"
                                , description: Just
                                    """Salmon belly breaded in cornflakes, white cabbage, pineapple pico de gallo, chipotle mayo, coriander."""
                                }
                            , Item
                                { id: 348
                                , imageUrl: Just Image.k5_2_66_348
                                , title: Just "Quesabirria (3 tacos)"
                                , description: Just
                                    """Slow cooked braised beef, savory broth made with spices and chilies, tortilla with grilled cheese, topped with cabbage, red onion, and coriander. Served with its own broth."""
                                }
                            , Item
                                { id: 349
                                , imageUrl: Just Image.k5_2_66_349
                                , title: Just "Soy Chorizo and Grilled Cabbage"
                                , description: Just
                                    """Soy chorizo made in house, grilled spiced cabbage, vegan sour cream, coriander."""
                                }
                            , Item
                                { id: 350
                                , imageUrl: Just Image.k5_2_66_350
                                , title: Just "Pastor Chicken (3 tacos)"
                                , description: Just
                                    """Pastor marinade chicken thighs, chickpea spread, red salsa, coriander, cabbage and marinated red onion."""
                                }
                            , Item
                                { id: 346
                                , imageUrl: Just Image.k5_2_66_346
                                , title: Just "Pork Barbacoa (3 tacos)"
                                , description: Just """Tender pork, black beans, green salsa, onion, and coriander."""
                                }
                            , Item
                                { id: 351
                                , imageUrl: Just Image.k5_2_66_351
                                , title: Just "Pastor Chicken (3 tacos)"
                                , description: Just
                                    """Pastor marinade chicken thighs, chickpea spread, red salsa, coriander, cabbage and marinated red onion."""
                                }
                            , Item
                                { id: 361
                                , imageUrl: Just Image.k5_2_66_361
                                , title: Just "Pork Barbacoa (3 tacos)"
                                , description: Just """Tender pork, black beans, green salsa, onion, and coriander."""
                                }
                            , Item
                                { id: 354
                                , imageUrl: Just Image.k5_2_66_354
                                , title: Just "Pork Barbacoa (3 tacos)"
                                , description: Just """Tender pork, black beans, green salsa, onion, and coriander."""
                                }
                            , Item
                                { id: 358
                                , imageUrl: Just Image.k5_2_66_358
                                , title: Just "Quesabirria (3 tacos)"
                                , description: Just
                                    """Slow cooked braised beef, savory broth made with spices and chilies, tortilla with grilled cheese, topped with cabbage, red onion, and coriander. Served with its own broth."""
                                }
                            , Item
                                { id: 363
                                , imageUrl: Just Image.k5_2_66_363
                                , title: Just "Quesabirria (3 tacos)"
                                , description: Just
                                    """Slow cooked braised beef, savory broth made with spices and chilies, tortilla with grilled cheese, topped with cabbage, red onion, and coriander. Served with its own broth."""
                                }
                            , Item
                                { id: 343
                                , imageUrl: Just Image.k5_2_66_343
                                , title: Just "Pastor Chicken (3 tacos)"
                                , description: Just
                                    """Pastor marinade chicken thighs, chickpea spread, red salsa, coriander, cabbage and marinated red onion."""
                                }
                            , Item
                                { id: 342
                                , imageUrl: Just Image.k5_2_66_342
                                , title: Just "Pork Barbacoa (3 tacos)"
                                , description: Just """Tender pork, black beans, green salsa, onion, and coriander."""
                                }
                            , Item
                                { id: 353
                                , imageUrl: Just Image.k5_2_66_353
                                , title: Just "Soy Chorizo and Grilled Cabbage"
                                , description: Just
                                    """Soy chorizo made in house, grilled spiced cabbage, vegan sour cream, coriander."""
                                }
                            , Item
                                { id: 357
                                , imageUrl: Just Image.k5_2_66_357
                                , title: Just "Hawaiian Salmon (3 tacos)"
                                , description: Just
                                    """Salmon belly breaded in cornflakes, white cabbage, pineapple pico de gallo, chipotle mayo, coriander."""
                                }
                            , Item
                                { id: 356
                                , imageUrl: Just Image.k5_2_66_356
                                , title: Just "Pork Barbacoa (3 tacos)"
                                , description: Just """Tender pork, black beans, green salsa, onion, and coriander."""
                                }
                            , Item
                                { id: 341
                                , imageUrl: Just Image.k5_2_66_341
                                , title: Just "Soy Chorizo and Grilled Cabbage"
                                , description: Just
                                    """Soy chorizo made in house, grilled spiced cabbage, vegan sour cream, coriander."""
                                }
                            , Item
                                { id: 360
                                , imageUrl: Just Image.k5_2_66_360
                                , title: Just "Soy Chorizo and Grilled Cabbage"
                                , description: Just
                                    """Soy chorizo made in house, grilled spiced cabbage, vegan sour cream, coriander."""
                                }
                            , Item
                                { id: 355
                                , imageUrl: Just Image.k5_2_66_355
                                , title: Just "Hawaiian Salmon (3 tacos)"
                                , description: Just
                                    """Salmon belly breaded in cornflakes, white cabbage, pineapple pico de gallo, chipotle mayo, coriander."""
                                }
                            , Item
                                { id: 345
                                , imageUrl: Just Image.k5_2_66_345
                                , title: Just "Quesabirria (3 tacos)"
                                , description: Just
                                    """Slow cooked braised beef, savory broth made with spices and chilies, tortilla with grilled cheese, topped with cabbage, red onion, and coriander. Served with its own broth."""
                                }
                            , Item
                                { id: 336
                                , imageUrl: Just Image.k5_2_66_336
                                , title: Just "Pastor Chicken (3 tacos)"
                                , description: Just
                                    """Pastor marinade chicken thighs, chickpea spread, red salsa, white cabbage coriander and marinated red onion."""
                                }
                            , Item
                                { id: 338
                                , imageUrl: Just Image.k5_2_66_338
                                , title: Just "Hawaiian Salmon (3 tacos)"
                                , description: Just
                                    """Salmon belly breaded in cornflakes, salad mix, pineapple pico de gallo, chipotle mayo, red cabbage."""
                                }
                            , Item
                                { id: 362
                                , imageUrl: Just Image.k5_2_66_362
                                , title: Just "Hawaiian Salmon (3 tacos)"
                                , description: Just
                                    """Salmon belly breaded in cornflakes, white cabbage, pineapple pico de gallo, chipotle mayo, coriander."""
                                }
                            , Item
                                { id: 364
                                , imageUrl: Just Image.k5_2_66_364
                                , title: Just "Pastor Chicken (3 tacos)"
                                , description: Just
                                    """Pastor marinade chicken thighs, chickpea spread, red salsa, coriander, cabbage and marinated red onion."""
                                }
                            , Item
                                { id: 352
                                , imageUrl: Just Image.k5_2_66_352
                                , title: Just "Quesabirria (3 tacos)"
                                , description: Just
                                    """Slow cooked braised beef, savory broth made with spices and chilies, tortilla with grilled cheese, topped with cabbage, red onion, and coriander. Served with its own broth."""
                                }
                            , Item
                                { id: 344
                                , imageUrl: Just Image.k5_2_66_344
                                , title: Just "Hawaiian Salmon (3 tacos)"
                                , description: Just
                                    """Salmon belly breaded in cornflakes, white cabbage, pineapple pico de gallo, chipotle mayo, coriander."""
                                }
                            , Item
                                { id: 365
                                , imageUrl: Just Image.k5_2_66_365
                                , title: Just "Soy Chorizo and Grilled Cabbage"
                                , description: Just
                                    """Soy chorizo made in house, grilled spiced cabbage, vegan sour cream, coriander."""
                                }
                            , Item
                                { id: 359
                                , imageUrl: Just Image.k5_2_66_359
                                , title: Just "Pastor Chicken (3 tacos)"
                                , description: Just
                                    """Pastor marinade chicken thighs, chickpea spread, red salsa, coriander, cabbage and marinated red onion."""
                                }
                            , Item
                                { id: 366
                                , imageUrl: Just Image.k5_2_66_366
                                , title: Just "Soy Chorizo and Grilled Cabbage"
                                , description: Just
                                    """Soy chorizo made in house, grilled spiced cabbage, vegan sour cream, coriander."""
                                }
                            , Item
                                { id: 368
                                , imageUrl: Just Image.k5_2_66_368
                                , title: Just "Pastor Chicken (3 tacos)"
                                , description: Just
                                    """Pastor marinade chicken thighs, chickpea spread, red salsa, coriander, cabbage and marinated red onion."""
                                }
                            , Item
                                { id: 367
                                , imageUrl: Just Image.k5_2_66_367
                                , title: Just "Quesabirria (3 tacos)"
                                , description: Just
                                    """Slow cooked braised beef, savory broth made with spices and chilies, tortilla with grilled cheese, topped with cabbage, red onion, and coriander. Served with its own broth."""
                                }
                            , Item
                                { id: 369
                                , imageUrl: Just Image.k5_2_66_369
                                , title: Just "Pork Barbacoa (3 tacos)"
                                , description: Just """Tender pork, black beans, green salsa, onion, and coriander."""
                                }
                            , Item
                                { id: 371
                                , imageUrl: Just Image.k5_2_66_371
                                , title: Just "Hawaiian Salmon (3 tacos)"
                                , description: Just
                                    """Salmon belly breaded in cornflakes, white cabbage, pineapple pico de gallo, chipotle mayo, coriander."""
                                }
                            , Item
                                { id: 370
                                , imageUrl: Just Image.k5_2_66_370
                                , title: Just "Hawaiian Salmon (3 tacos)"
                                , description: Just
                                    """Salmon belly breaded in cornflakes, white cabbage, pineapple pico de gallo, chipotle mayo, coriander."""
                                }
                            , Item
                                { id: 372
                                , imageUrl: Just Image.k5_2_66_372
                                , title: Just "Soy Chorizo and Grilled Cabbage"
                                , description: Just
                                    """Soy chorizo made in house, grilled spiced cabbage, vegan sour cream, coriander."""
                                }
                            , Item
                                { id: 373
                                , imageUrl: Just Image.k5_2_66_373
                                , title: Just "Pork Barbacoa (3 tacos)"
                                , description: Just """Tender pork, black beans, green salsa, onion, and coriander."""
                                }
                            , Item
                                { id: 374
                                , imageUrl: Just Image.k5_2_66_374
                                , title: Just "Pastor Chicken (3 tacos)"
                                , description: Just
                                    """Pastor marinade chicken thighs, chickpea spread, red salsa, coriander, cabbage and marinated red onion."""
                                }
                            , Item
                                { id: 375
                                , imageUrl: Just Image.k5_2_66_375
                                , title: Just "Quesabirria (3 tacos)"
                                , description: Just
                                    """Slow cooked braised beef, savory broth made with spices and chilies, tortilla with grilled cheese, topped with cabbage, red onion, and coriander. Served with its own broth."""
                                }
                            , Item
                                { id: 337
                                , imageUrl: Just Image.k5_2_66_337
                                , title: Just "Pork Barbacoa (3 tacos)"
                                , description: Just
                                    """Slow-cooked pork, black beans, green salsa, onion, and coriander."""
                                }
                            , Item
                                { id: 339
                                , imageUrl: Just Image.k5_2_66_339
                                , title: Just "Quesabirria (3 tacos)"
                                , description: Just
                                    """Slow-cooked braised beef, savory broth made with spices and chilies, tortilla with grilled cheese, topped with red cabbage, red onion, and coriander. Served with its own broth."""
                                }
                            , Item
                                { id: 401
                                , imageUrl: Just Image.k5_2_66_401
                                , title: Just "Pastor chicken (4 tacos)"
                                , description: Just
                                    """Pastor marinade chicken thighs, chickpea spread, red salsa, white cabbage coriander and marinated red onion."""
                                }
                            , Item
                                { id: 402
                                , imageUrl: Just Image.k5_2_66_402
                                , title: Just "Hawaiian Salmon (4 tacos)"
                                , description: Just
                                    """Salmon belly breaded in cornflakes, salad mix, pineapple pico de gallo, chipotle mayo, red cabbage."""
                                }
                            , Item
                                { id: 340
                                , imageUrl: Just Image.k5_2_66_340
                                , title: Just "Soya Chorizo and Grilled Cabbage (3 tacos)"
                                , description: Just
                                    """Roasted soya protein, mushroom, chorizo spices, black lentils, grilled cabbage, red salsa, vegan sour cream, pico de gallo."""
                                }
                            ]
                        }
                    ]
                }
            , Menu
                { id: 3
                , title: "Monday Lunch"
                , description: Nothing
                , sections:
                    [ Section
                        { id: 6
                        , title: "Lunch"
                        , description: Just
                            """Enjoy a variety of homestyle Mexican dishes for lunch, each accompanied by a complimentary small side of our fresh, daily-made vegetable soup. Indulge in authentic flavors from Mexico with a new dish served every day. Today's soup: Potato Zucchini soup."""
                        , items:
                            [ Item
                                { id: 18
                                , imageUrl: Just Image.k5_3_6_18
                                , title: Just "Soy Chorizo Enchiladas Rojas"
                                , description: Just
                                    """3 Tortillas, house made Soy Chorizo, dried chilies salsa (not hot), tomato, red onion, and vegan sour crème. Fried potatoes and cabbage salad on the side."""
                                }
                            , Item
                                { id: 16
                                , imageUrl: Just Image.k5_3_6_16
                                , title: Just "Chicken Enchiladas Rojas"
                                , description: Just
                                    """3 Tortillas, shredded chicken, dried chilies salsa (not hot), tomato, red onion, fresh cheese, and sour crème. Fried potatoes and cabbage salad on the side."""
                                }
                            , Item
                                { id: 17
                                , imageUrl: Just Image.k5_3_6_17
                                , title: Just "Cheese Enchiladas Rojas"
                                , description: Just
                                    """3 Tortillas, fresh cheese, dried chilies salsa (not hot), tomato, red onion, and sour crème. Fried potatoes and cabbage salad on the side."""
                                }
                            ]
                        }
                    ]
                }
            , Menu
                { id: 4
                , title: "Tuesday Lunch"
                , description: Nothing
                , sections:
                    [ Section
                        { id: 7
                        , title: "Lunch"
                        , description: Just
                            """Enjoy a variety of homestyle Mexican dishes for lunch, each accompanied by a complimentary small side of our fresh, daily-made vegetable soup. Indulge in authentic flavors from Mexico with a new dish served every day. Today's soup: Roasted Squash soup."""
                        , items:
                            [ Item
                                { id: 19
                                , imageUrl: Just Image.k5_4_7_19
                                , title: Just "Pork Quesadilla Klandestina"
                                , description: Just
                                    """Three corn tortillas with pork, cheese, chickpea spread, salsa roja, house salad on top, fresh cheese and sour cream."""
                                }
                            , Item
                                { id: 20
                                , imageUrl: Just Image.k5_4_7_20
                                , title: Just "Chicken Quesadilla Klandestina"
                                , description: Just
                                    """Three corn tortillas with chicken, cheese, chickpea spread, salsa roja, house salad on top, fresh cheese and sour cream"""
                                }
                            , Item
                                { id: 21
                                , imageUrl: Just Image.k5_4_7_21
                                , title: Just "Soya Chorizo Quesadilla Klandestina"
                                , description: Just
                                    """Three corn tortillas with soy chorizo, cheese, chickpea spread, salsa roja, house salad on top, fresh cheese and sour cream. Ask for vegan version."""
                                }
                            ]
                        }
                    ]
                }
            , Menu
                { id: 5
                , title: "Taco Thursday"
                , description: Nothing
                , sections:
                    [ Section
                        { id: 9
                        , title: "Taco Thursday"
                        , description: Just
                            """Enjoy a variety of homestyle Mexican dishes for lunch, each accompanied by a complimentary small side of our fresh, daily-made vegetable soup. Indulge in authentic flavors from Mexico with a new dish served every day. Today's soup: Bean ranchero soup"""
                        , items:
                            [ Item
                                { id: 25
                                , imageUrl: Just Image.k5_5_9_25
                                , title: Just "3 Tacos Pastor chicken"
                                , description: Just
                                    """Pastor marinade chicken thighs, chickpea spread, red salsa, coriander and marinated red onion."""
                                }
                            , Item
                                { id: 24
                                , imageUrl: Just Image.k5_5_9_24
                                , title: Just "3 Tacos Pork barbacoa"
                                , description: Just
                                    """Tender pork neck, black beans, green salsa, marinated onions, and coriander."""
                                }
                            , Item
                                { id: 432
                                , imageUrl: Just Image.k5_5_9_432
                                , title: Just "3 Tacos Soya chorizo and grilled cabbage (vegan)"
                                , description: Just
                                    """Roasted soya protein, mushroom, chorizo spices, black lentils, grilled cabbage, red salsa, vegan sour cream, pico de gallo."""
                                }
                            ]
                        }
                    ]
                }
            , Menu
                { id: 6
                , title: "Wednesday Lunch"
                , description: Nothing
                , sections:
                    [ Section
                        { id: 8
                        , title: "Lunch"
                        , description: Just
                            """Enjoy a variety of homestyle Mexican dishes for lunch, each accompanied by a complimentary small side of our fresh, daily-made vegetable soup. Indulge in authentic flavors from Mexico with a new dish served every day. Today's soup: Potato Mushroom soup"""
                        , items:
                            [ Item
                                { id: 22
                                , imageUrl: Just Image.k5_6_8_22
                                , title: Just "Chicken Flautas"
                                , description: Just
                                    """Rolled fried tacos, shredded chicken, green salsa, pico de gallo, white cabbage, fresh cheese.
Salad on the side and fried potatoes."""
                                }
                            , Item
                                { id: 23
                                , imageUrl: Just Image.k5_6_8_23
                                , title: Just "Cheese Flautas"
                                , description: Just
                                    """Rolled fried tacos, cheese mix, green salsa, pico de gallo, white cabbage, fresh cheese.
Salad on the side and fried potatoes."""
                                }
                            ]
                        }
                    , Section
                        { id: 42
                        , title: "Test"
                        , description: Nothing
                        , items: [ Item { id: 163, imageUrl: Nothing, title: Just "Test", description: Nothing } ]
                        }
                    ]
                }
            , Menu
                { id: 7
                , title: "Friday Lunch"
                , description: Nothing
                , sections:
                    [ Section
                        { id: 10
                        , title: "Lunch"
                        , description: Just
                            """Enjoy a variety of homestyle Mexican dishes for lunch, each accompanied by a complimentary small side of our fresh, daily-made vegetable soup. Indulge in authentic flavors from Mexico with a new dish served every day. Today's soup: Tortilla Soup."""
                        , items:
                            [ Item
                                { id: 26
                                , imageUrl: Just Image.k5_7_10_26
                                , title: Just "Pork Burrito Klandestino"
                                , description: Just
                                    """Huge wheat tortilla, pork barbacoa, chickpea spread, red rice, cheese, salsa verde, salad mix. """
                                }
                            , Item
                                { id: 28
                                , imageUrl: Just Image.k5_7_10_28
                                , title: Just "Soya Chorizo and Mushroom Burrito Klandestino"
                                , description: Just
                                    """Huge wheat tortilla, soy chorizo and mushroom, chickpea spread, red rice, salsa verde, salad mix."""
                                }
                            , Item
                                { id: 27
                                , imageUrl: Just Image.k5_7_10_27
                                , title: Just "Chicken Burrito Klandestino"
                                , description: Just
                                    """Huge wheat tortilla, chicken pastor, chickpea spread, red rice, cheese, salsa verde, salad mix."""
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    , Kitchen
        { id: 6
        , name: "The Bar"
        , description:
            "We have a great urban bar for thirsty diners or pop in for a glass of wine, a well-chilled beer or a well-deserved cocktail. Our central location makes an ideal meeting point – even for bigger groups. Cheers!"
        , imageUrl: Image.theBarLogo
        , headerUrl: Image.theBar
        , slug: "Drinks"
        , menus:
            [ Menu
                { id: 15
                , title: "Bar Menu "
                , description: Nothing
                , sections:
                    [ Section
                        { id: 22
                        , title: "Bottles"
                        , description: Just """Beers/LD/Ciders"""
                        , items:
                            [ Item
                                { id: 77
                                , imageUrl: Nothing
                                , title: Just "1664 Blanc 0.33L"
                                , description: Just """Beer"""
                                }
                            , Item
                                { id: 79
                                , imageUrl: Nothing
                                , title: Just "Brooklyn BelAir Sour 0.33L"
                                , description: Just """Beer"""
                                }
                            , Item
                                { id: 80
                                , imageUrl: Nothing
                                , title: Just "Staropramen Dark Lager 0.33L"
                                , description: Nothing
                                }
                            , Item
                                { id: 78, imageUrl: Nothing, title: Just "Koff Light Beer 0.5L", description: Nothing }
                            , Item
                                { id: 82
                                , imageUrl: Nothing
                                , title: Just "Somersby Blackberry 0.33L"
                                , description: Just """Cider"""
                                }
                            , Item
                                { id: 81
                                , imageUrl: Nothing
                                , title: Just "Crowmoor Extra Dry 0.33L"
                                , description: Just """Cider"""
                                }
                            , Item
                                { id: 518
                                , imageUrl: Nothing
                                , title: Just "Koff long drink pink grapefruit 0.0% 330ml"
                                , description: Just """Alcohol free long drink"""
                                }
                            , Item
                                { id: 419
                                , imageUrl: Nothing
                                , title: Just "Karhu 0.0% 330ml"
                                , description: Just """Alcohol free beer"""
                                }
                            ]
                        }
                    , Section
                        { id: 23
                        , title: "Draft"
                        , description: Just """Beers/LD/Ciders"""
                        , items:
                            [ Item
                                { id: 86, imageUrl: Nothing, title: Just "Koff Long Drink 0.4L", description: Nothing }
                            , Item
                                { id: 87
                                , imageUrl: Nothing
                                , title: Just "Staropramen Premium Lager 0.3L"
                                , description: Nothing
                                }
                            , Item { id: 84, imageUrl: Nothing, title: Just "Karhu 0.4L", description: Just """Beer""" }
                            , Item
                                { id: 83
                                , imageUrl: Nothing
                                , title: Just "Brooklyn IPA 0.4L"
                                , description: Just """Beer"""
                                }
                            , Item
                                { id: 85
                                , imageUrl: Nothing
                                , title: Just "Brooklin Larger 0.4L"
                                , description: Just """Beer"""
                                }
                            ]
                        }
                    , Section
                        { id: 24
                        , title: "Soft Drinks "
                        , description: Just """By Can"""
                        , items:
                            [ Item
                                { id: 90
                                , imageUrl: Nothing
                                , title: Just "Schweppes Russchian 330ml"
                                , description: Nothing
                                }
                            , Item
                                { id: 91
                                , imageUrl: Nothing
                                , title: Just "Schweppes Ginger Ale 330ml"
                                , description: Nothing
                                }
                            , Item
                                { id: 89
                                , imageUrl: Nothing
                                , title: Just "Schweppes Ginger Ale 330ml"
                                , description: Nothing
                                }
                            , Item
                                { id: 524
                                , imageUrl: Nothing
                                , title: Just "Ohakune Kombucha: Blueberry Pie 330ml"
                                , description: Nothing
                                }
                            , Item
                                { id: 88
                                , imageUrl: Nothing
                                , title: Just "Schweppes Russchian 330ml"
                                , description: Nothing
                                }
                            , Item { id: 525, imageUrl: Nothing, title: Just "Red Bull 250ml", description: Nothing }
                            , Item
                                { id: 526
                                , imageUrl: Nothing
                                , title: Just "Ohakune Kombucha: Green Apple 330ml"
                                , description: Nothing
                                }
                            , Item
                                { id: 528
                                , imageUrl: Nothing
                                , title: Just "Ohakune Lemonade: Lime 330ml"
                                , description: Nothing
                                }
                            , Item
                                { id: 529
                                , imageUrl: Nothing
                                , title: Just "Ohakune Lemonade: Pink Grapefruit 330ml"
                                , description: Nothing
                                }
                            , Item
                                { id: 530
                                , imageUrl: Nothing
                                , title: Just "Ohakune Summer Lemonade 330ml"
                                , description: Nothing
                                }
                            , Item
                                { id: 531
                                , imageUrl: Nothing
                                , title: Just "Ohakune Lemonade: Sour Red Apple 330ml"
                                , description: Nothing
                                }
                            ]
                        }
                    , Section
                        { id: 25
                        , title: "Soft Drinks"
                        , description: Just """By Glass"""
                        , items:
                            [ Item
                                { id: 409
                                , imageUrl: Nothing
                                , title: Just "Sparkling water 400ml"
                                , description: Nothing
                                }
                            , Item
                                { id: 96, imageUrl: Nothing, title: Just "Coca Cola Zero 400ml", description: Nothing }
                            , Item
                                { id: 94, imageUrl: Nothing, title: Just "Schweppes Tonic 400ml", description: Nothing }
                            , Item { id: 95, imageUrl: Nothing, title: Just "Coca Cola 400ml", description: Nothing }
                            , Item { id: 92, imageUrl: Nothing, title: Just "Sprite Zero 400ml", description: Nothing }
                            , Item
                                { id: 532
                                , imageUrl: Nothing
                                , title: Just "Pineapple Juice 350ml"
                                , description: Nothing
                                }
                            , Item { id: 93, imageUrl: Nothing, title: Just "Fanta Zero 400ml", description: Nothing }
                            , Item
                                { id: 533
                                , imageUrl: Nothing
                                , title: Just "Rauch Orange Juice 350ml"
                                , description: Nothing
                                }
                            , Item
                                { id: 534
                                , imageUrl: Nothing
                                , title: Just "Rauch Passion Fruit Juice 350ml"
                                , description: Nothing
                                }
                            , Item
                                { id: 300
                                , imageUrl: Nothing
                                , title: Just "Schweppes Tonic 200ml"
                                , description: Nothing
                                }
                            ]
                        }
                    , Section
                        { id: 26
                        , title: "Cocktails"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 283
                                , imageUrl: Just Image.k6_15_26_283
                                , title: Just "Cloudberry Sour"
                                , description: Just
                                    """Egg white/aqua faba (chickpea liquid), lime juice, sugar, cloudberry vodka. Ask for vegan version."""
                                }
                            , Item
                                { id: 442
                                , imageUrl: Nothing
                                , title: Just "Cuba Libre"
                                , description: Just """4 cl Negrita Blanca, Coca Cola,  fresh lime"""
                                }
                            , Item
                                { id: 443
                                , imageUrl: Nothing
                                , title: Just "Vodka Tonic"
                                , description: Just """4 cl Laplandia Vodka, Tonic"""
                                }
                            , Item
                                { id: 97
                                , imageUrl: Just Image.k6_15_26_97
                                , title: Just "Whiskey Sour"
                                , description: Just """Ask for vegan version"""
                                }
                            , Item
                                { id: 494
                                , imageUrl: Nothing
                                , title: Just "Negroni"
                                , description: Just """Campari bitter, vermouth rosso and gin."""
                                }
                            , Item { id: 522, imageUrl: Nothing, title: Nothing, description: Nothing }
                            , Item
                                { id: 527
                                , imageUrl: Nothing
                                , title: Just "Caipiroska "
                                , description: Just """Laplandia Vodka, fresh lime, sugar"""
                                }
                            , Item
                                { id: 437
                                , imageUrl: Nothing
                                , title: Just "Screw Driver"
                                , description: Just """4 cl Laplandia Vodka, Orange juice"""
                                }
                            , Item { id: 521, imageUrl: Nothing, title: Nothing, description: Nothing }
                            , Item
                                { id: 519
                                , imageUrl: Nothing
                                , title: Just "Caipiroska"
                                , description: Just """Vodka, fresh lime, sugar"""
                                }
                            , Item
                                { id: 444
                                , imageUrl: Nothing
                                , title: Just "Gin Tonic"
                                , description: Just """4 cl Arctic gin, Tonic"""
                                }
                            , Item
                                { id: 282
                                , imageUrl: Just Image.k6_15_26_282
                                , title: Just "Espresso Martini"
                                , description: Just """Espresso, sugar, espresso vodka."""
                                }
                            , Item
                                { id: 100
                                , imageUrl: Just Image.k6_15_26_100
                                , title: Just "Amaretto Sour"
                                , description: Just
                                    """Egg white/aqua faba, lime juice, sugar, disaronno. Ask for vegan version"""
                                }
                            , Item { id: 523, imageUrl: Nothing, title: Nothing, description: Nothing }
                            , Item
                                { id: 435
                                , imageUrl: Nothing
                                , title: Just "Vodka Cola"
                                , description: Just """4 cl Laplandia Vodka, Coca Cola"""
                                }
                            , Item
                                { id: 438
                                , imageUrl: Nothing
                                , title: Just "Jägermaister"
                                , description: Just """Herbal liquor """
                                }
                            , Item
                                { id: 417
                                , imageUrl: Just Image.k6_15_26_417
                                , title: Just "Virgin Piña Colada"
                                , description: Just """Pineapple juice, lime juice, coconut cream."""
                                }
                            , Item { id: 436, imageUrl: Nothing, title: Just "Sambuca Vaccari", description: Nothing }
                            , Item
                                { id: 98
                                , imageUrl: Just Image.k6_15_26_98
                                , title: Just "Aperitivo Spritz"
                                , description: Just """Sparkling wine, art spritz, soda water, fresh orange."""
                                }
                            , Item
                                { id: 285
                                , imageUrl: Just Image.k6_15_26_285
                                , title: Just "Piña Colada"
                                , description: Just """Pineapple juice, coconut cream, lime juice, coconut vodka."""
                                }
                            , Item
                                { id: 99
                                , imageUrl: Just Image.k6_15_26_99
                                , title: Just "Daiquiri"
                                , description: Just """White rum, lime juice, sugar."""
                                }
                            , Item
                                { id: 439
                                , imageUrl: Nothing
                                , title: Just "Limoncello"
                                , description: Just """Lemon flavoured spirit"""
                                }
                            , Item
                                { id: 440
                                , imageUrl: Nothing
                                , title: Just "Kossu Cola"
                                , description: Just """4 cl Koskenkorva, Coca Cola"""
                                }
                            , Item
                                { id: 416
                                , imageUrl: Just Image.k6_15_26_416
                                , title: Just "Virgin Passion fruit Martini"
                                , description: Just """Passion fruit juice, lime juice, vanilla syrup."""
                                }
                            , Item
                                { id: 441
                                , imageUrl: Nothing
                                , title: Just "Kossu Soda"
                                , description: Just """4 cl Koskenkorva, Soda"""
                                }
                            , Item
                                { id: 286
                                , imageUrl: Just Image.k6_15_26_286
                                , title: Just "Tommys Margarita"
                                , description: Just """Tajin spice, lime juice, agave syrup, tequila."""
                                }
                            , Item
                                { id: 284
                                , imageUrl: Just Image.k6_15_26_284
                                , title: Just "Lingonberry Mule"
                                , description: Just
                                    """Lingonberry vodka, Schweppes ginger ale, lime juice, rosemary leaf."""
                                }
                            , Item { id: 520, imageUrl: Nothing, title: Nothing, description: Nothing }
                            , Item
                                { id: 287
                                , imageUrl: Just Image.k6_15_26_287
                                , title: Just "Passionfruit Martini"
                                , description: Just
                                    """Passion fruit juice, lime juice, vanilla syrup, lingonberry vodka, vodka."""
                                }
                            ]
                        }
                    , Section
                        { id: 27
                        , title: "Vodka 4cl"
                        , description: Nothing
                        , items:
                            [ Item { id: 102, imageUrl: Nothing, title: Just "Laplandia", description: Nothing }
                            , Item
                                { id: 101, imageUrl: Nothing, title: Just "Laplandia Cloudberry", description: Nothing }
                            , Item { id: 105, imageUrl: Nothing, title: Just "Laplandia Lemon", description: Nothing }
                            , Item { id: 104, imageUrl: Nothing, title: Just "Koskenkorva", description: Nothing }
                            , Item
                                { id: 103
                                , imageUrl: Nothing
                                , title: Just "Laplandia Lingonberry"
                                , description: Nothing
                                }
                            ]
                        }
                    , Section
                        { id: 28
                        , title: "Gin 4cl"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 106, imageUrl: Nothing, title: Just "Engine Pure Organic", description: Nothing }
                            , Item
                                { id: 108, imageUrl: Nothing, title: Just "Gibson Blood Orange", description: Nothing }
                            , Item
                                { id: 413, imageUrl: Nothing, title: Just "Artic Blue Gin 4cl", description: Nothing }
                            , Item
                                { id: 414, imageUrl: Nothing, title: Just "Artic Blue Rose Gin", description: Nothing }
                            , Item
                                { id: 415
                                , imageUrl: Nothing
                                , title: Just "Crafters Aromatic Flower "
                                , description: Nothing
                                }
                            , Item { id: 107, imageUrl: Nothing, title: Just "Arctic", description: Nothing }
                            ]
                        }
                    , Section
                        { id: 29
                        , title: "Rum 4cl"
                        , description: Nothing
                        , items:
                            [ Item { id: 110, imageUrl: Nothing, title: Just "Plantation Old", description: Nothing }
                            , Item { id: 113, imageUrl: Nothing, title: Just "Plantation Dark", description: Nothing }
                            , Item { id: 109, imageUrl: Nothing, title: Just "Negrita White", description: Nothing }
                            , Item { id: 111, imageUrl: Nothing, title: Just "Negrita Dark", description: Nothing }
                            , Item { id: 112, imageUrl: Nothing, title: Just "Plantation White", description: Nothing }
                            ]
                        }
                    , Section
                        { id: 30
                        , title: "Tequila 4cl"
                        , description: Nothing
                        , items:
                            [ Item { id: 114, imageUrl: Nothing, title: Just "Tequila Blanco", description: Nothing }
                            , Item { id: 115, imageUrl: Nothing, title: Just "Tequila Dorado", description: Nothing }
                            ]
                        }
                    , Section
                        { id: 31
                        , title: "Whiskey & Brandy 4cl"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 116
                                , imageUrl: Nothing
                                , title: Just "Glen Moray Speyside Single Malt"
                                , description: Nothing
                                }
                            , Item
                                { id: 118, imageUrl: Nothing, title: Just "Gautier VSOP Cognac", description: Nothing }
                            , Item
                                { id: 117
                                , imageUrl: Nothing
                                , title: Just "Busnel AOC Fine Calvados"
                                , description: Nothing
                                }
                            , Item
                                { id: 119
                                , imageUrl: Nothing
                                , title: Just "The Busker Triple Cask Irish Whiskey"
                                , description: Nothing
                                }
                            ]
                        }
                    , Section
                        { id: 32
                        , title: "White Wine"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 120
                                , imageUrl: Nothing
                                , title: Just "Septimo Sentido Verdejo 12cl"
                                , description: Nothing
                                }
                            , Item
                                { id: 128
                                , imageUrl: Nothing
                                , title: Just "Civitas Pecorino 12cl"
                                , description: Nothing
                                }
                            , Item
                                { id: 122
                                , imageUrl: Nothing
                                , title: Just "Septimo Sentido Verdejo 16cl"
                                , description: Nothing
                                }
                            , Item
                                { id: 125
                                , imageUrl: Nothing
                                , title: Just "Asia Blend Cuvee 16cl"
                                , description: Nothing
                                }
                            , Item
                                { id: 124
                                , imageUrl: Nothing
                                , title: Just "Asia Blend Cuvee 12cl"
                                , description: Nothing
                                }
                            , Item
                                { id: 121
                                , imageUrl: Nothing
                                , title: Just "Septimo Sentido Verdejo 75cl Bottle"
                                , description: Nothing
                                }
                            , Item
                                { id: 129
                                , imageUrl: Nothing
                                , title: Just "Brocard Bourgogne Chardonnay 75cl Bottle"
                                , description: Nothing
                                }
                            , Item
                                { id: 127
                                , imageUrl: Nothing
                                , title: Just "Civitas Pecorino 16cl"
                                , description: Nothing
                                }
                            , Item
                                { id: 126
                                , imageUrl: Nothing
                                , title: Just "Civitas Pecorino 75cl Bottle"
                                , description: Nothing
                                }
                            , Item
                                { id: 130
                                , imageUrl: Nothing
                                , title: Just "Riesling Trocken 1L Bottle"
                                , description: Nothing
                                }
                            , Item
                                { id: 123
                                , imageUrl: Nothing
                                , title: Just "Asia Blend Cuvee 75cl Bottle"
                                , description: Nothing
                                }
                            ]
                        }
                    , Section
                        { id: 33
                        , title: "Red Wine"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 135
                                , imageUrl: Nothing
                                , title: Just "Parés Baltà Mas Petit 75cl Bottle"
                                , description: Nothing
                                }
                            , Item
                                { id: 139
                                , imageUrl: Nothing
                                , title: Just "Louis Jadot Bourgogne Pinot Noir 75cl Bottle"
                                , description: Nothing
                                }
                            , Item { id: 140, imageUrl: Nothing, title: Just "Vivera Etna Rosso", description: Nothing }
                            , Item
                                { id: 132
                                , imageUrl: Nothing
                                , title: Just "Septimo Sentido Tempranillo 75cl Bottle"
                                , description: Nothing
                                }
                            , Item
                                { id: 131
                                , imageUrl: Nothing
                                , title: Just "Septimo Sentido Tempranillo 12cl"
                                , description: Nothing
                                }
                            , Item
                                { id: 133
                                , imageUrl: Nothing
                                , title: Just "Septimo Sentido Tempranillo 16cl"
                                , description: Nothing
                                }
                            , Item
                                { id: 136
                                , imageUrl: Nothing
                                , title: Just "Ruminat Primitivo Organic 16cl"
                                , description: Nothing
                                }
                            , Item
                                { id: 137
                                , imageUrl: Nothing
                                , title: Just "Ruminat Primitivo Organic 12cl"
                                , description: Nothing
                                }
                            , Item
                                { id: 138
                                , imageUrl: Nothing
                                , title: Just "Ruminat Primitivo Organic 75cl Bottle"
                                , description: Nothing
                                }
                            , Item
                                { id: 134
                                , imageUrl: Nothing
                                , title: Just "Lopez de Haro Crianza 75cl Bottle"
                                , description: Nothing
                                }
                            ]
                        }
                    , Section
                        { id: 34
                        , title: "Sparkling Wine"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 142
                                , imageUrl: Nothing
                                , title: Just "d’Artigny Cuvee Prestige  0% (Non Alcholic) 12cl"
                                , description: Nothing
                                }
                            , Item
                                { id: 143
                                , imageUrl: Nothing
                                , title: Just "Parés Baltà Brut 75cl Bottle"
                                , description: Nothing
                                }
                            , Item
                                { id: 141
                                , imageUrl: Nothing
                                , title: Just "d’Artigny Cuvee Prestige 0% 75cl Bottle"
                                , description: Nothing
                                }
                            , Item
                                { id: 144
                                , imageUrl: Nothing
                                , title: Just "Parés Baltà Brut 12cl"
                                , description: Nothing
                                }
                            , Item
                                { id: 418
                                , imageUrl: Nothing
                                , title: Just "Nicolas Feuillate Reserve Brut 75 cl Brut"
                                , description: Nothing
                                }
                            ]
                        }
                    ]
                }
            , Menu
                { id: 67
                , title: "Happy Hour Menu 16:00-19:00"
                , description: Nothing
                , sections:
                    [ Section
                        { id: 87
                        , title: "Drafts "
                        , description: Just """Beers & Longdrink"""
                        , items:
                            [ Item
                                { id: 513
                                , imageUrl: Nothing
                                , title: Just "Koff Long Drink 0.4L"
                                , description: Just """Long Drink """
                                }
                            , Item
                                { id: 495
                                , imageUrl: Nothing
                                , title: Just "Koff Long drink "
                                , description: Just """Long drink """
                                }
                            , Item
                                { id: 496
                                , imageUrl: Nothing
                                , title: Just "Brooklyn IPA 0.4L (4.6%)"
                                , description: Just """Beer"""
                                }
                            , Item
                                { id: 497
                                , imageUrl: Nothing
                                , title: Just "Karhu 0.4L (4.6%)"
                                , description: Just """Beer"""
                                }
                            , Item
                                { id: 498
                                , imageUrl: Nothing
                                , title: Just "Brooklyn IPA 0.4L (4.6%)"
                                , description: Just """Beer"""
                                }
                            , Item
                                { id: 499
                                , imageUrl: Nothing
                                , title: Just "Karhu 0.4L (4.6%)"
                                , description: Just """Beer"""
                                }
                            , Item
                                { id: 500
                                , imageUrl: Nothing
                                , title: Just "Karhu 0.4L (4.6%)"
                                , description: Just """Beer"""
                                }
                            , Item
                                { id: 501
                                , imageUrl: Nothing
                                , title: Just "Brooklyn IPA 0.4L (4.6%)"
                                , description: Just """Beer"""
                                }
                            , Item
                                { id: 502
                                , imageUrl: Nothing
                                , title: Just "Brooklyn IPA 0.4L (4.6%)"
                                , description: Just """Beer"""
                                }
                            , Item
                                { id: 512
                                , imageUrl: Nothing
                                , title: Just "Brooklyn IPA 0.4L"
                                , description: Just """Beer"""
                                }
                            , Item
                                { id: 505
                                , imageUrl: Nothing
                                , title: Just "Brooklyn IPA 0.4L (4.6%)"
                                , description: Just """Beer"""
                                }
                            , Item
                                { id: 503
                                , imageUrl: Nothing
                                , title: Just "Karhu 0.4L (4.6%)"
                                , description: Just """Beer"""
                                }
                            , Item
                                { id: 506
                                , imageUrl: Nothing
                                , title: Just "Brooklyn IPA 0.4L (4.6%)"
                                , description: Just """Beer"""
                                }
                            , Item
                                { id: 509
                                , imageUrl: Nothing
                                , title: Just "Karhu 0.4L (4.6%)"
                                , description: Just """Beer"""
                                }
                            , Item
                                { id: 508
                                , imageUrl: Nothing
                                , title: Just "Brooklyn IPA 0.4L (4.6%)"
                                , description: Just """Beer"""
                                }
                            , Item
                                { id: 507
                                , imageUrl: Nothing
                                , title: Just "Karhu 0.4L (4.6%)"
                                , description: Just """Beer"""
                                }
                            , Item
                                { id: 504
                                , imageUrl: Nothing
                                , title: Just "Karhu 0.4L (4.6%)"
                                , description: Just """Beer"""
                                }
                            , Item
                                { id: 510, imageUrl: Nothing, title: Just "Karhu 0.4L", description: Just """Beer""" }
                            , Item { id: 511, imageUrl: Nothing, title: Just "Karhu", description: Just """Beer""" }
                            ]
                        }
                    , Section
                        { id: 88
                        , title: "Bottles"
                        , description: Just """Cider"""
                        , items:
                            [ Item
                                { id: 514
                                , imageUrl: Nothing
                                , title: Just "Crowmoor Extra Dry "
                                , description: Just """Cider"""
                                }
                            ]
                        }
                    , Section
                        { id: 89
                        , title: "Wines  "
                        , description: Just """Sparkling, Red wine & White wine"""
                        , items:
                            [ Item
                                { id: 537
                                , imageUrl: Nothing
                                , title: Just "Katse Organic Red 12cl"
                                , description: Just """Tempranillo 85%, Syrah 15%"""
                                }
                            , Item
                                { id: 535
                                , imageUrl: Nothing
                                , title: Just "Katse Organic Red 12cl"
                                , description: Just """Tempranillo 85%, Syrah 15%"""
                                }
                            , Item
                                { id: 539
                                , imageUrl: Nothing
                                , title: Just "Katse Organic Red 12cl"
                                , description: Just """Tempranillo 85%, Syrah 15%"""
                                }
                            , Item
                                { id: 517
                                , imageUrl: Nothing
                                , title: Just "Costa Azul 12cl"
                                , description: Just """Sauvignon Blanc 100%"""
                                }
                            , Item
                                { id: 516
                                , imageUrl: Nothing
                                , title: Just "Amore Mio Rosato 12cl"
                                , description: Just """Frappato 100%"""
                                }
                            , Item
                                { id: 538
                                , imageUrl: Nothing
                                , title: Just "Katse Organic Red 12cl"
                                , description: Just """Tempranillo 85%, Syrah 15%"""
                                }
                            , Item
                                { id: 515
                                , imageUrl: Nothing
                                , title: Just "Savia Viva Cava 12cl"
                                , description: Just """Parellada 62%, Macabeo 22%, Xarel.lo 16%"""
                                }
                            , Item
                                { id: 536
                                , imageUrl: Nothing
                                , title: Just "Katse Organic Red 12cl"
                                , description: Just """Tempranillo 85%, Syrah 15%"""
                                }
                            ]
                        }
                    ]
                }
            , Menu
                { id: 68
                , title: "Bar snacks"
                , description: Nothing
                , sections:
                    [ Section
                        { id: 90
                        , title: "Pickels"
                        , description: Nothing
                        , items:
                            [ Item { id: 543, imageUrl: Nothing, title: Just "Marcona almonds", description: Nothing }
                            , Item
                                { id: 542
                                , imageUrl: Nothing
                                , title: Just "Pickled vegetables skewers"
                                , description: Just """6 units, olive, cornichon, pepper, onion"""
                                }
                            , Item
                                { id: 541
                                , imageUrl: Nothing
                                , title: Just "Black artisanal olives"
                                , description: Nothing
                                }
                            , Item
                                { id: 540
                                , imageUrl: Nothing
                                , title: Just "Green artisanal olives"
                                , description: Nothing
                                }
                            ]
                        }
                    , Section
                        { id: 91
                        , title: "Cheese platter (3 cheeses)"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 544
                                , imageUrl: Nothing
                                , title: Just "Goat"
                                , description: Just """Granada, Spain - Artisan Cheesemaker “Queseria las RRR”"""
                                }
                            , Item
                                { id: 545
                                , imageUrl: Nothing
                                , title: Just "Sheep"
                                , description: Just """La Mancha, Spain - Artisan Cheesemaker “Quesos Villarejo”"""
                                }
                            , Item
                                { id: 546
                                , imageUrl: Nothing
                                , title: Just "Cheese Platter "
                                , description: Just
                                    """Cow: León, Spain - Artisan Cheesemaker “La Prada”
Goat: Granada, Spain - Artisan Cheesemaker “Queseria las RRR”
Sheep: La Mancha, Spain - Artisan Cheesemaker “Quesos Villarejo”"""
                                }
                            ]
                        }
                    , Section
                        { id: 92
                        , title: "Cured meat platter"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 549
                                , imageUrl: Nothing
                                , title: Just "Iberico 100% Acorn-fed pork chorizo"
                                , description: Just
                                    """D.O.P Jabugo, Spain - marinated with salt, garlic and
paprika in an artisanal manner in natural drying rooms."""
                                }
                            , Item
                                { id: 548
                                , imageUrl: Nothing
                                , title: Just "Iberico 100% Acorn-fed pork loin"
                                , description: Just
                                    """Iberico 100% Acorn-fed pork loin, Iberico 100% Acorn-fed pork cured ham and 
Iberico 100% Acorn-fed pork chorizo - D.O.P Jabugo, Spain."""
                                }
                            , Item
                                { id: 547
                                , imageUrl: Nothing
                                , title: Just "Iberico 100% Acorn-fed pork cured ham"
                                , description: Just
                                    """D.O.P Jabugo, Spain - cured for over 40 months,
it’s considered the best ham in the world."""
                                }
                            ]
                        }
                    , Section
                        { id: 93
                        , title: "Meat & cheese platter"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 553
                                , imageUrl: Nothing
                                , title: Just "100% Iberico Acord-fed pork cured loin"
                                , description: Just """D.O.P Jabugo, Spain"""
                                }
                            , Item
                                { id: 550
                                , imageUrl: Nothing
                                , title: Just "Goat cheese"
                                , description: Just
                                    """Gran Reserva “Pata negra” 12 months aged - creamy in the mouth, with a
wide range of nuances in its flavor and with pleasant spicy notes. SUPERGOLD Medal World,
Cheese Awards 2015 - 2016, 2017 - 2018"""
                                }
                            , Item
                                { id: 551
                                , imageUrl: Nothing
                                , title: Just "Meat & cheese platter"
                                , description: Just
                                    """Sheep cheese, Goat cheese, 100% Iberico Acorn-fed pork ham and 100% Iberico Acord-fed pork cured loin."""
                                }
                            , Item
                                { id: 552
                                , imageUrl: Nothing
                                , title: Just "100% Iberico Acorn-fed pork ham"
                                , description: Just """D.O.P Jabugo, Spain"""
                                }
                            ]
                        }
                    , Section
                        { id: 94
                        , title: "Pickles"
                        , description: Nothing
                        , items:
                            [ Item { id: 557, imageUrl: Nothing, title: Just "Marcona almonds", description: Nothing }
                            , Item
                                { id: 555
                                , imageUrl: Nothing
                                , title: Just "Pickled vegetables skewers"
                                , description: Just """6 units - olive, cornichon, pepper, onion """
                                }
                            , Item
                                { id: 556
                                , imageUrl: Nothing
                                , title: Just "Green artisanal olives"
                                , description: Nothing
                                }
                            , Item
                                { id: 554
                                , imageUrl: Nothing
                                , title: Just "Black artisanal olives"
                                , description: Nothing
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    , Kitchen
        { id: 7
        , name: "L’Artisan"
        , description:
            "Le Café L’Artisan is an authentic, high-quality French bakery experience. Enjoy delicious fresh baked pastries or a croissant with your coffee. Imagine you’re relaxing in Paris. Bon appetit!"
        , imageUrl: Image.lArtisanLogo
        , headerUrl: Image.lartisan
        , slug: "French Bakery"
        , menus:
            [ Menu
                { id: 19
                , title: "Menu"
                , description: Nothing
                , sections:
                    [ Section
                        { id: 47
                        , title: "Breakfast "
                        , description: Just """Enjoy a Parisienne breakfast"""
                        , items:
                            [ Item
                                { id: 181
                                , imageUrl: Just Image.k7_19_47_181
                                , title: Just "Parisian"
                                , description: Just
                                    """Orange juice
Arabica filter coffee | Tea | Hot chocolate 
Homemade croissant | butter | jam | marmalade"""
                                }
                            , Item
                                { id: 180
                                , imageUrl: Just Image.k7_19_47_180
                                , title: Just "Parisian"
                                , description: Just
                                    """Orange juice
Arabica filter coffee | Tea | Hot chocolate 
Homemade croissant | butter | jam | marmalade"""
                                }
                            , Item
                                { id: 182
                                , imageUrl: Just Image.k7_19_47_182
                                , title: Just "Parisian"
                                , description: Just
                                    """Orange juice
Arabica filter coffee | Tea | Hot chocolate 
Homemade croissant | butter | jam | marmalade"""
                                }
                            , Item
                                { id: 183
                                , imageUrl: Just Image.k7_19_47_183
                                , title: Just "Parisian"
                                , description: Just
                                    """Orange juice
Arabica filter coffee | Tea | Hot chocolate 
Homemade croissant | butter | jam | marmalade"""
                                }
                            , Item
                                { id: 185
                                , imageUrl: Just Image.k7_19_47_185
                                , title: Just "Parisian"
                                , description: Just
                                    """Orange juice
Arabica filter coffee | Tea | Hot chocolate 
Homemade croissant | butter | jam | marmalade"""
                                }
                            , Item
                                { id: 184
                                , imageUrl: Just Image.k7_19_47_184
                                , title: Just "Parisian"
                                , description: Just
                                    """Orange juice
Arabica filter coffee | Tea | Hot chocolate 
Homemade croissant | butter | jam | marmalade"""
                                }
                            , Item
                                { id: 186
                                , imageUrl: Just Image.k7_19_47_186
                                , title: Just "Parisian"
                                , description: Just
                                    """Orange juice
Arabica filter coffee | Tea | Hot chocolate 
Homemade croissant | butter | jam | marmalade"""
                                }
                            , Item
                                { id: 187
                                , imageUrl: Just Image.k7_19_47_187
                                , title: Just "Parisian"
                                , description: Just
                                    """Orange juice
Arabica filter coffee | Tea | Hot chocolate 
Homemade croissant | butter | jam | marmalade"""
                                }
                            , Item
                                { id: 333
                                , imageUrl: Nothing
                                , title: Just "Parisian with Hot chocolate"
                                , description: Just
                                    """Enjoy a hot cup of Hot chocolate and a homemade croissant that comes with a side of butter, jam and marmalade as well as some orange juice."""
                                }
                            , Item
                                { id: 332
                                , imageUrl: Just Image.k7_19_47_332
                                , title: Just "Premium croissant breakfast with hot chocolate: cheese-veggie"
                                , description: Just
                                    """Enjoy a hot cup of hot chocolate and orange juice with a homemade croissant filled with arugula, tomatoes, cucumber, cheese and cooked zucchini."""
                                }
                            , Item
                                { id: 179
                                , imageUrl: Just Image.k7_19_47_179
                                , title: Just "Parisian breakfast with coffee"
                                , description: Just
                                    """Enjoy a hot cup of Arabica filter coffee and a homemade croissant that comes with a side of butter, jam and marmalade as well as some orange juice."""
                                }
                            , Item
                                { id: 326
                                , imageUrl: Nothing
                                , title: Just "Parisian with tea"
                                , description: Just
                                    """Enjoy a hot cup of Yellow Label tea and a homemade croissant that comes with a side of butter, jam and marmalade as well as some orange juice."""
                                }
                            , Item { id: 322, imageUrl: Nothing, title: Nothing, description: Nothing }
                            , Item
                                { id: 328
                                , imageUrl: Nothing
                                , title: Just "Premium veggie with tea"
                                , description: Nothing
                                }
                            , Item
                                { id: 327
                                , imageUrl: Nothing
                                , title: Just "Healthy with tea"
                                , description: Just
                                    """Have a healthy breakfast with orange juice, Yellow Label tea and Overnight Oats (chia seeds, fresh fruit toppings, coulis)."""
                                }
                            , Item
                                { id: 329
                                , imageUrl: Just Image.k7_19_47_329
                                , title: Just "Premium croissant breakfast with tea: cheese and turkey"
                                , description: Just
                                    """Enjoy a hot cup of Yellow Label tea and orange juice with a homemade croissant filled with turkey, arugula, tomatoes, cucumber and cheese."""
                                }
                            , Item
                                { id: 331
                                , imageUrl: Just Image.k7_19_47_331
                                , title: Just "Healthy breakfast with hot chocolate"
                                , description: Just
                                    """Have a healthy breakfast with orange juice, hot chocolate and Overnight Oats (chia seeds, fresh berries, jam)."""
                                }
                            , Item
                                { id: 323
                                , imageUrl: Just Image.k7_19_47_323
                                , title: Just "Parisian breakfast with tea"
                                , description: Just
                                    """Enjoy a hot cup of Yellow Label tea and a homemade croissant that comes with a side of butter, jam and marmalade as well as some orange juice."""
                                }
                            , Item
                                { id: 324
                                , imageUrl: Just Image.k7_19_47_324
                                , title: Just "Healthy breakfast with tea"
                                , description: Just
                                    """Have a healthy breakfast with orange juice, Yellow Label tea and Overnight Oats (chia seeds, fresh berries, jam)."""
                                }
                            , Item
                                { id: 325
                                , imageUrl: Just Image.k7_19_47_325
                                , title: Just "Premium croissant breakfast with black tea: cheese-veggie"
                                , description: Just
                                    """Enjoy a hot cup of Yellow Label tea and orange juice with a homemade croissant filled with arugula, tomatoes, cucumber, cheese and cooked zucchini."""
                                }
                            , Item
                                { id: 330
                                , imageUrl: Just Image.k7_19_47_330
                                , title: Just "Parisian breakfast with hot chocolate"
                                , description: Just
                                    """Enjoy a hot cup of Hot chocolate and a homemade croissant that comes with a side of butter, jam and marmalade as well as some orange juice."""
                                }
                            , Item
                                { id: 190
                                , imageUrl: Just Image.k7_19_47_190
                                , title: Just "Premium croissant breakfast with coffee: cheese and turkey"
                                , description: Just
                                    """Enjoy a hot cup of Arabica filter coffee and orange juice with a homemade croissant filled with turkey, arugula, tomatoes, cucumber and cheese."""
                                }
                            , Item
                                { id: 334
                                , imageUrl: Just Image.k7_19_47_334
                                , title: Just "Premium croissant breakfast with hot chocolate: cheese and turkey"
                                , description: Just
                                    """Enjoy a hot cup of hot chocolate and orange juice with a homemade croissant filled with turkey, arugula, tomatoes, cucumber and cheese."""
                                }
                            , Item
                                { id: 189
                                , imageUrl: Just Image.k7_19_47_189
                                , title: Just "Premium croissant breakfast with coffee: cheese-veggie"
                                , description: Just
                                    """Enjoy a hot cup of Arabica filter coffee and orange juice with a homemade croissant filled with arugula, tomatoes, cucumber, cheese and cooked zucchini."""
                                }
                            , Item
                                { id: 188
                                , imageUrl: Just Image.k7_19_47_188
                                , title: Just "Healthy breakfast with coffee"
                                , description: Just
                                    """Have a healthy breakfast with orange juice, Arabica filter coffee and Overnight Oats (chia seeds, fresh fruit toppings, jam)."""
                                }
                            ]
                        }
                    , Section
                        { id: 48
                        , title: "Pastries"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 196
                                , imageUrl: Just Image.k7_19_48_196
                                , title: Just "Pain au Raisin"
                                , description: Nothing
                                }
                            , Item
                                { id: 191
                                , imageUrl: Just Image.k7_19_48_191
                                , title: Just "Croissant"
                                , description: Nothing
                                }
                            , Item
                                { id: 193
                                , imageUrl: Just Image.k7_19_48_193
                                , title: Just "Almond Croissant"
                                , description: Nothing
                                }
                            , Item
                                { id: 195
                                , imageUrl: Just Image.k7_19_48_195
                                , title: Just "Chocolatine"
                                , description: Nothing
                                }
                            , Item
                                { id: 197
                                , imageUrl: Just Image.k7_19_48_197
                                , title: Just "Croissant Vegan"
                                , description: Nothing
                                }
                            , Item
                                { id: 192
                                , imageUrl: Just Image.k7_19_48_192
                                , title: Just "Cheese Croissant"
                                , description: Nothing
                                }
                            , Item
                                { id: 194
                                , imageUrl: Just Image.k7_19_48_194
                                , title: Just "Cinnamon Roll"
                                , description: Nothing
                                }
                            , Item
                                { id: 386
                                , imageUrl: Just Image.k7_19_48_386
                                , title: Just "La Vie en Rose"
                                , description: Nothing
                                }
                            ]
                        }
                    , Section
                        { id: 49
                        , title: "Breads"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 198
                                , imageUrl: Just Image.k7_19_49_198
                                , title: Just "Batard"
                                , description: Just """500 g"""
                                }
                            , Item
                                { id: 199
                                , imageUrl: Just Image.k7_19_49_199
                                , title: Just "Baguette"
                                , description: Just """400 g"""
                                }
                            ]
                        }
                    , Section
                        { id: 50
                        , title: "Toasts"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 200
                                , imageUrl: Just Image.k7_19_50_200
                                , title: Just "Vege Toast"
                                , description: Just
                                    """White bread, pesto (contains garlic), mozzarella, tomato and arugula."""
                                }
                            , Item
                                { id: 201
                                , imageUrl: Just Image.k7_19_50_201
                                , title: Just "Meat Toast"
                                , description: Just
                                    """Brioche bread, kirveli mayonnaise, Emmental cheese, turkey and tomato."""
                                }
                            ]
                        }
                    , Section
                        { id: 51
                        , title: "Drinks"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 203
                                , imageUrl: Just Image.k7_19_51_203
                                , title: Just "Espresso"
                                , description: Nothing
                                }
                            , Item
                                { id: 204
                                , imageUrl: Just Image.k7_19_51_204
                                , title: Just "Latte"
                                , description: Nothing
                                }
                            , Item
                                { id: 205
                                , imageUrl: Just Image.k7_19_51_205
                                , title: Just "Cappuccino"
                                , description: Nothing
                                }
                            , Item
                                { id: 211
                                , imageUrl: Just Image.k7_19_51_211
                                , title: Just "Cloudy Apple Juice"
                                , description: Nothing
                                }
                            , Item
                                { id: 206
                                , imageUrl: Just Image.k7_19_51_206
                                , title: Just "Flat White"
                                , description: Nothing
                                }
                            , Item
                                { id: 207
                                , imageUrl: Just Image.k7_19_51_207
                                , title: Just "Americano"
                                , description: Nothing
                                }
                            , Item
                                { id: 208
                                , imageUrl: Just Image.k7_19_51_208
                                , title: Just "Hot Chocolate"
                                , description: Nothing
                                }
                            , Item
                                { id: 209
                                , imageUrl: Just Image.k7_19_51_209
                                , title: Just "Tea (Kukicha Premium)"
                                , description: Just
                                    """Japanese green tea
"""
                                }
                            , Item
                                { id: 210
                                , imageUrl: Just Image.k7_19_51_210
                                , title: Just "Orange Juice"
                                , description: Nothing
                                }
                            , Item
                                { id: 202
                                , imageUrl: Just Image.k7_19_51_202
                                , title: Just "Coffee"
                                , description: Nothing
                                }
                            , Item { id: 303, imageUrl: Nothing, title: Nothing, description: Nothing }
                            , Item
                                { id: 304
                                , imageUrl: Just Image.k7_19_51_304
                                , title: Just "Coffee with oat milk"
                                , description: Nothing
                                }
                            , Item
                                { id: 335
                                , imageUrl: Just Image.k7_19_51_335
                                , title: Just "Tea (China Lychee)"
                                , description: Just """Chinese tea flavored with lychee fruit"""
                                }
                            , Item
                                { id: 298
                                , imageUrl: Nothing
                                , title: Just "Tea (Thé Mirabelles)"
                                , description: Just """Herbal Tea"""
                                }
                            , Item
                                { id: 297
                                , imageUrl: Nothing
                                , title: Just "Tea (Ceylon Kenilworth)"
                                , description: Just """Black tea"""
                                }
                            , Item
                                { id: 299
                                , imageUrl: Nothing
                                , title: Just "Tea (Premium Blend Garden White)"
                                , description: Just """Green and white tea"""
                                }
                            , Item
                                { id: 307
                                , imageUrl: Just Image.k7_19_51_307
                                , title: Just "Latte"
                                , description: Nothing
                                }
                            , Item
                                { id: 301
                                , imageUrl: Just Image.k7_19_51_301
                                , title: Just "Black Coffee"
                                , description: Nothing
                                }
                            , Item
                                { id: 313
                                , imageUrl: Just Image.k7_19_51_313
                                , title: Just "Americano with oat milk"
                                , description: Nothing
                                }
                            , Item
                                { id: 306
                                , imageUrl: Just Image.k7_19_51_306
                                , title: Just "Latte with oat milk"
                                , description: Nothing
                                }
                            , Item
                                { id: 318
                                , imageUrl: Just Image.k7_19_51_318
                                , title: Just "Tea (Premium Blend Garden White)"
                                , description: Just """Green and white tea"""
                                }
                            , Item
                                { id: 305
                                , imageUrl: Just Image.k7_19_51_305
                                , title: Just "Espresso"
                                , description: Just """Double shot """
                                }
                            , Item
                                { id: 312
                                , imageUrl: Just Image.k7_19_51_312
                                , title: Just "Americano"
                                , description: Nothing
                                }
                            , Item
                                { id: 319
                                , imageUrl: Just Image.k7_19_51_319
                                , title: Just "Tea (Thé Mirabelles)"
                                , description: Just """Herbal Tea"""
                                }
                            , Item
                                { id: 302
                                , imageUrl: Just Image.k7_19_51_302
                                , title: Just "Coffee with milk"
                                , description: Nothing
                                }
                            , Item
                                { id: 316
                                , imageUrl: Just Image.k7_19_51_316
                                , title: Just "Tea (Kukicha Premium)"
                                , description: Just """Japanese green tea"""
                                }
                            , Item
                                { id: 321
                                , imageUrl: Just Image.k7_19_51_321
                                , title: Just "Cloudy apple juice"
                                , description: Nothing
                                }
                            , Item
                                { id: 320
                                , imageUrl: Just Image.k7_19_51_320
                                , title: Just "Orange juice"
                                , description: Nothing
                                }
                            , Item
                                { id: 309
                                , imageUrl: Just Image.k7_19_51_309
                                , title: Just "Flat White with oat milk"
                                , description: Nothing
                                }
                            , Item
                                { id: 308
                                , imageUrl: Just Image.k7_19_51_308
                                , title: Just "Flat White"
                                , description: Nothing
                                }
                            , Item
                                { id: 311
                                , imageUrl: Just Image.k7_19_51_311
                                , title: Just "Cappuccino"
                                , description: Just """Double shot cappuccino"""
                                }
                            , Item
                                { id: 310
                                , imageUrl: Just Image.k7_19_51_310
                                , title: Just "Cappuccino with oat milk"
                                , description: Just """Double shot cappuccino"""
                                }
                            , Item
                                { id: 317
                                , imageUrl: Just Image.k7_19_51_317
                                , title: Just "Tea (Ceylon Kenilworth)"
                                , description: Just """Black tea"""
                                }
                            , Item
                                { id: 314
                                , imageUrl: Just Image.k7_19_51_314
                                , title: Just "Hot Chocolate"
                                , description: Nothing
                                }
                            , Item
                                { id: 315
                                , imageUrl: Just Image.k7_19_51_315
                                , title: Just "Hot Chocolate with oat milk"
                                , description: Nothing
                                }
                            ]
                        }
                    , Section
                        { id: 76
                        , title: "Test"
                        , description: Nothing
                        , items:
                            [ Item { id: 410, imageUrl: Nothing, title: Just "Sallar's Special", description: Nothing }
                            ]
                        }
                    ]
                }
            , Menu
                { id: 36
                , title: "Lunch"
                , description: Just """klo 11:00-15:00"""
                , sections:
                    [ Section
                        { id: 85
                        , title: "Lunch"
                        , description: Just """Lunch time 11:00-15:00"""
                        , items:
                            [ Item
                                { id: 475
                                , imageUrl: Just Image.k7_36_85_475
                                , title: Just "Cappuccino"
                                , description: Just """Double shot cappuccino"""
                                }
                            , Item
                                { id: 481
                                , imageUrl: Nothing
                                , title: Just "Pesto-Mozzarella toast and side salad "
                                , description: Nothing
                                }
                            , Item
                                { id: 476
                                , imageUrl: Just Image.k7_36_85_476
                                , title: Just "Coffee with oat milk"
                                , description: Nothing
                                }
                            , Item
                                { id: 479
                                , imageUrl: Just Image.k7_36_85_479
                                , title: Just "Coffee with milk"
                                , description: Nothing
                                }
                            , Item
                                { id: 473
                                , imageUrl: Just Image.k7_36_85_473
                                , title: Just "Black coffee"
                                , description: Nothing
                                }
                            , Item
                                { id: 478
                                , imageUrl: Nothing
                                , title: Just "Turkey -Cheese toast and side salad "
                                , description: Nothing
                                }
                            , Item
                                { id: 474
                                , imageUrl: Just Image.k7_36_85_474
                                , title: Just "Latte"
                                , description: Nothing
                                }
                            , Item
                                { id: 477
                                , imageUrl: Just Image.k7_36_85_477
                                , title: Just "Latte with oat milk"
                                , description: Nothing
                                }
                            , Item
                                { id: 480
                                , imageUrl: Just Image.k7_36_85_480
                                , title: Just "Cappuccino with oat milk"
                                , description: Just """Double shot cappucchino"""
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    , Kitchen
        { id: 8
        , name: "Temple"
        , description:
            "Join us on a culinary adventure to Nepal with secret recipes passed down through generations. Temple offers authentic Himalayan flavours that will transport you to the land of the world's highest mountains."
        , imageUrl: Image.templeLogo
        , headerUrl: Image.temple
        , slug: "Nepalese Cuisine"
        , menus:
            [ Menu
                { id: 9
                , title: "À la Carte"
                , description: Nothing
                , sections:
                    [ Section
                        { id: 14
                        , title: "Nepalese Street Snacks"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 40
                                , imageUrl: Just Image.k8_9_14_40
                                , title: Just "Veg Samosa (2pcs)"
                                , description: Just
                                    """Deep-fried vegetable pie filled with potato and peas. Served with mint chutney and salad. Ask for vegan option."""
                                }
                            , Item
                                { id: 39
                                , imageUrl: Just Image.k8_9_14_39
                                , title: Just "Paneer Tikka Chili"
                                , description: Just """Fried marinated curd cheese and chili (hot)"""
                                }
                            , Item
                                { id: 37
                                , imageUrl: Just Image.k8_9_14_37
                                , title: Just "Vege Pakora"
                                , description: Just
                                    """Deep-fried cauliflower, onion and potato. Served with tomato chutney and salad. Ask for vegan option."""
                                }
                            , Item
                                { id: 38
                                , imageUrl: Just Image.k8_9_14_38
                                , title: Just "Chicken Tikka"
                                , description: Just """Tandoori chicken fillets marinated in herb yoghurt"""
                                }
                            , Item
                                { id: 488
                                , imageUrl: Just Image.k8_9_14_488
                                , title: Just "Paneer tikka bites"
                                , description: Just
                                    """Crispy fried cottage cheese pieces coated in a gram flour batter, served with refreshing green mint sauce"""
                                }
                            , Item
                                { id: 486
                                , imageUrl: Just Image.k8_9_14_486
                                , title: Just "Okra Fries"
                                , description: Just
                                    """Crisp-fried okra coated in a delicate gram flour batter, served with tangy green chutney."""
                                }
                            , Item
                                { id: 485
                                , imageUrl: Just Image.k8_9_14_485
                                , title: Just "Sweet and spicy chilli bites"
                                , description: Just
                                    """Tender chicken pieces lightly fried with onions and capsicum, tossed in a mildly soy-flavored spicy tomato sauce."""
                                }
                            , Item
                                { id: 489
                                , imageUrl: Just Image.k8_9_14_489
                                , title: Just "Tandoori prawns (4pcs) "
                                , description: Just
                                    """Tiger king prawns marinated in a blend of herbs and yogurt, roasted in the oven, and served with mint sauce."""
                                }
                            , Item
                                { id: 487
                                , imageUrl: Just Image.k8_9_14_487
                                , title: Just "Chicken tikka bites"
                                , description: Just
                                    """Chicken pieces marinated in a blend of herbs and yogurt, then baked in the oven."""
                                }
                            ]
                        }
                    , Section
                        { id: 15
                        , title: "Main Dishes"
                        , description: Nothing
                        , items:
                            [ Item
                                { id: 49
                                , imageUrl: Just Image.k8_9_15_49
                                , title: Just "Chicken Sizzler"
                                , description: Just
                                    """Tandoori Marinated Chicken With Capsicum & Onion In Cream Sauce. Served On Hot Sizzler. (medium hot)"""
                                }
                            , Item
                                { id: 47
                                , imageUrl: Nothing
                                , title: Just "Shahi Lamb"
                                , description: Just """Stewed lamb pieces in cashew, curry and coconut cream sauce"""
                                }
                            , Item
                                { id: 51
                                , imageUrl: Nothing
                                , title: Just "Palak Paneer"
                                , description: Just """Curd cheese in spinach-cream sauce"""
                                }
                            , Item
                                { id: 42
                                , imageUrl: Nothing
                                , title: Just "Palak Paneer"
                                , description: Just """Cottage cheese in spinach cream sauce"""
                                }
                            , Item
                                { id: 48
                                , imageUrl: Just Image.k8_9_15_48
                                , title: Just "Tandoori Special"
                                , description: Just
                                    """Tandoori marinated chicken, lamb fillet, king prawn and minced lamb meat kabab with capsicum and onion. Served on a hot sizzler."""
                                }
                            , Item
                                { id: 45
                                , imageUrl: Just Image.k8_9_15_45
                                , title: Just "Shahi Paneer"
                                , description: Just """Cottage cheese in cashew, tomato and cream sauce"""
                                }
                            , Item
                                { id: 46
                                , imageUrl: Nothing
                                , title: Just "Malai Kofta"
                                , description: Just
                                    """Deep fried balls made of vegetables, cashew, raisins and cottage cheese in tomato cream sauce"""
                                }
                            , Item
                                { id: 41
                                , imageUrl: Just Image.k8_9_15_41
                                , title: Just "Chefs’ Special Chicken"
                                , description: Just
                                    """Tandoori marinated chicken with almonds in coconut, cashew, and cream sauce"""
                                }
                            , Item
                                { id: 43
                                , imageUrl: Just Image.k8_9_15_43
                                , title: Just "Chicken Tikka Masala"
                                , description: Just
                                    """Tandoori chicken marinated in herb yoghurt with masala tomato sauce (medium hot)"""
                                }
                            , Item
                                { id: 50
                                , imageUrl: Just Image.k8_9_15_50
                                , title: Just "Lamb Vindaloo"
                                , description: Just
                                    """Stewed lamb pieces, potato, and tomato in spicy chili, onion, ginger, garlic, and vindaloo sauce (hot spiced)"""
                                }
                            , Item
                                { id: 44
                                , imageUrl: Just Image.k8_9_15_44
                                , title: Just "Butter Chicken"
                                , description: Just
                                    """Tandoori-marinated chicken pieces in cashew, tomato, butter and cream sauce."""
                                }
                            ]
                        }
                    , Section
                        { id: 16
                        , title: "Drinks"
                        , description: Nothing
                        , items: [ Item { id: 52, imageUrl: Nothing, title: Just "Mango Lassi", description: Nothing } ]
                        }
                    ]
                }
            , Menu
                { id: 10
                , title: "Thursday Lunch"
                , description: Nothing
                , sections:
                    [ Section
                        { id: 20
                        , title: "Lunch"
                        , description: Just """Served with basmati rice and naan bread."""
                        , items:
                            [ Item
                                { id: 70
                                , imageUrl: Nothing
                                , title: Just "Malai Kofta Vegan"
                                , description: Just
                                    """Vegetable rolls with cashew nuts, tofu and raisins in a tomato-cream sauce."""
                                }
                            , Item
                                { id: 69
                                , imageUrl: Nothing
                                , title: Just "Malai Kofta"
                                , description: Just
                                    """Vegetable rolls with cashew nuts, cottage cheese and raisins in a tomato-cream sauce."""
                                }
                            , Item
                                { id: 71
                                , imageUrl: Just Image.k8_10_20_71
                                , title: Just "Chicken Tikka Masala"
                                , description: Just
                                    """Tandoori chicken marinated in herb yoghurt with masala tomato sauce (medium hot)"""
                                }
                            , Item
                                { id: 67
                                , imageUrl: Nothing
                                , title: Just "Handi Lamb"
                                , description: Just
                                    """Lamb in a coriander seed, green chili, and garlic yoghurt sauce (medium hot)."""
                                }
                            , Item
                                { id: 391
                                , imageUrl: Nothing
                                , title: Just "Tofu Chili"
                                , description: Just
                                    """
Tofu, cauliflower, and fresh coriander in onion, ginger, and tomato sauce
Tofu, cauliflower, and fresh coriander in onion, ginger, and tomato sauce
Tofu, cauliflower, and fresh coriander in onion, ginger, and tomato sauce
Tofu, cauliflower, and fresh coriander in onion, ginger, and tomato sauce
Tofu, cauliflower, and fresh coriander in onion, ginger, and tomato sauce"""
                                }
                            , Item
                                { id: 393
                                , imageUrl: Nothing
                                , title: Just "Tofu Chili (Vegan)"
                                , description: Just
                                    """Tofu, cauliflower, and fresh coriander in onion, ginger, and tomato sauce"""
                                }
                            , Item
                                { id: 68
                                , imageUrl: Just Image.k8_10_20_68
                                , title: Just "Mixed Thali"
                                , description: Just """Chicken Butter Masala and Lamb Korma combo"""
                                }
                            ]
                        }
                    ]
                }
            , Menu
                { id: 11
                , title: "Monday Lunch"
                , description: Nothing
                , sections:
                    [ Section
                        { id: 17
                        , title: "Lunch"
                        , description: Just """Served with basmati rice and naan bread"""
                        , items:
                            [ Item
                                { id: 55
                                , imageUrl: Nothing
                                , title: Just "Palak Tofu Vegan"
                                , description: Just """Tofu in a spinach coconut cream sauce."""
                                }
                            , Item
                                { id: 56
                                , imageUrl: Just Image.k8_11_17_56
                                , title: Just "Chicken Butter Masala"
                                , description: Just
                                    """Tandoori-marinated chicken pieces in cashew, tomato, butter and cream sauce. (Medium hot) """
                                }
                            , Item
                                { id: 53
                                , imageUrl: Just Image.k8_11_17_53
                                , title: Just "Mixed Thali"
                                , description: Just """Chicken Butter Masala and Lamb Korma combo"""
                                }
                            , Item
                                { id: 57
                                , imageUrl: Nothing
                                , title: Just "Lamb Korma"
                                , description: Just """Lamb curry with a cream sauce"""
                                }
                            , Item
                                { id: 388
                                , imageUrl: Nothing
                                , title: Just "Chana Masala (Vegan)"
                                , description: Just """Chickpeas and garlic potatoes in masala sauce (medium-spicy)"""
                                }
                            , Item
                                { id: 54
                                , imageUrl: Nothing
                                , title: Just "Palak Paneer"
                                , description: Just """Cottage cheese in spinach-cream sauce"""
                                }
                            ]
                        }
                    ]
                }
            , Menu
                { id: 12
                , title: "Wednesday Lunch"
                , description: Nothing
                , sections:
                    [ Section
                        { id: 19
                        , title: "Lunch"
                        , description: Just """Served with basmati rice and naan bread."""
                        , items:
                            [ Item
                                { id: 63
                                , imageUrl: Nothing
                                , title: Just "Lamb Masala"
                                , description: Just """Lamb with the house coriander and masala sauce (medium hot)."""
                                }
                            , Item
                                { id: 390
                                , imageUrl: Nothing
                                , title: Just "Tofu Chana Masala (Vegan)"
                                , description: Just """Tofu, chickpeas, tomatoes, onions, and ginger in chili sauce"""
                                }
                            , Item
                                { id: 65
                                , imageUrl: Just Image.k8_12_19_65
                                , title: Just "Mixed Thali"
                                , description: Just """Chicken Butter Masala and Lamb Korma combo."""
                                }
                            , Item
                                { id: 62
                                , imageUrl: Just Image.k8_12_19_62
                                , title: Just "Shahi Paneer Vegan"
                                , description: Just """Curd cheese in cashew, tomato and cream sauce"""
                                }
                            , Item
                                { id: 64
                                , imageUrl: Just Image.k8_12_19_64
                                , title: Just "Shahi Paneer"
                                , description: Just """Cottage cheese in cashew, tomato and cream sauce"""
                                }
                            , Item
                                { id: 66
                                , imageUrl: Nothing
                                , title: Just "Chicken Karhai"
                                , description: Just
                                    """Tandoori-marinated chicken with cumin and coriander seeds, green chilli, paprika, onion garlic curry and cream sauce (medium hot)"""
                                }
                            ]
                        }
                    ]
                }
            , Menu
                { id: 13
                , title: "Friday Lunch"
                , description: Nothing
                , sections:
                    [ Section
                        { id: 21
                        , title: "Lunch"
                        , description: Just """Served with basmati rice and naan bread."""
                        , items:
                            [ Item
                                { id: 72
                                , imageUrl: Nothing
                                , title: Just "Chilli Lamb"
                                , description: Just
                                    """Lamb, green pepper, onion, ginger and green chili in soy sauce (medium hot)"""
                                }
                            , Item
                                { id: 75
                                , imageUrl: Nothing
                                , title: Just "Sag Kofta"
                                , description: Just """Vegetable rolls with a cottage cheese and spinach cream sauce"""
                                }
                            , Item
                                { id: 76
                                , imageUrl: Just Image.k8_13_21_76
                                , title: Just "Mixed Thali"
                                , description: Just """Chicken Butter Masala and Lamb Korma combo"""
                                }
                            , Item
                                { id: 392
                                , imageUrl: Nothing
                                , title: Just "Saag Chana (Vegan)"
                                , description: Just """Chickpeas and spinach in garlic and cream sauce (medium-spicy)"""
                                }
                            , Item
                                { id: 73
                                , imageUrl: Nothing
                                , title: Just "Sag Kofta Vegan"
                                , description: Just """Vegetable rolls with tofu and spinach sauce"""
                                }
                            , Item
                                { id: 74
                                , imageUrl: Just Image.k8_13_21_74
                                , title: Just "Butter Chicken"
                                , description: Just
                                    """Tandoori-marinated chicken pieces in cashew, tomato, butter and cream sauce."""
                                }
                            ]
                        }
                    ]
                }
            , Menu
                { id: 14
                , title: "Tuesday Lunch"
                , description: Nothing
                , sections:
                    [ Section
                        { id: 18
                        , title: "Lunch"
                        , description: Just """Served with basmati rice and naan bread"""
                        , items:
                            [ Item
                                { id: 59
                                , imageUrl: Just Image.k8_14_18_59
                                , title: Just "Lamb Vindaloo"
                                , description: Just
                                    """Braised lamb, potato and tomato in a strongly spiced chilli, onion, ginger, garlic and vindaloo sauce (hot)"""
                                }
                            , Item
                                { id: 61
                                , imageUrl: Nothing
                                , title: Just "Vegetable Karhai"
                                , description: Just
                                    """Broccoli, cauliflower, cottage cheese, porcini mushroom, paprika and onion in a masala and tomato sauce"""
                                }
                            , Item
                                { id: 60
                                , imageUrl: Just Image.k8_14_18_60
                                , title: Just "Butter Chicken"
                                , description: Just
                                    """Tandoori-marinated chicken with cumin and coriander seeds, green chilli, paprika, onion garlic curry and cream sauce."""
                                }
                            , Item
                                { id: 389
                                , imageUrl: Nothing
                                , title: Just "Alu Gobi (Vegan)"
                                , description: Just
                                    """Potatoes, cauliflower, and fresh coriander in onion, ginger, and tomato sauce (medium-spicy)"""
                                }
                            , Item
                                { id: 58
                                , imageUrl: Just Image.k8_14_18_58
                                , title: Just "Mixed Thali"
                                , description: Just """Chicken Butter Masala and Lamb Korma combo"""
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]

flatKitchens :: NAE.NonEmptyArray FlatKitchen
flatKitchens = kitchens <#> \(Kitchen k) -> Kitchen $ k
  { menus = k.menus <#> \(Menu m) -> Menu $ m
      { sections = join $ map (\(Section s) -> [ Left $ Section s ] <> map Right s.items) m.sections }
  }