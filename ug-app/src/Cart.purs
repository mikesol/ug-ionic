module Cart where


import Data.Maybe (Maybe)

newtype Cart = Cart { items :: Array CartItem }

newtype CartItem = CartItem
  { kitchenId :: Int
  , kitchenName :: String
  , kitchenHeaderUrl :: String
  , menuId :: Int
  , sectionId :: Int
  , itemId :: Int
  , imageUrl :: Maybe String
  , title :: String
  , description :: Maybe String
  , price :: Int
  }