module Components.Swiper where

import Prelude

import Data.Options (Option, Options, opt, options)
import Effect (Effect)
import Foreign (Foreign)
import Untagged.Union (type (|+|))

data Swiper
data SwiperOptions

a11y :: Option SwiperOptions Foreign
a11y = opt "a11y"

allowSlideNext :: Option SwiperOptions Boolean
allowSlideNext = opt "allowSlideNext"

allowSlidePrev :: Option SwiperOptions Boolean
allowSlidePrev = opt "allowSlidePrev"

allowTouchMove :: Option SwiperOptions Boolean
allowTouchMove = opt "allowTouchMove"

autoHeight :: Option SwiperOptions Boolean
autoHeight = opt "autoHeight"

autoplay :: Option SwiperOptions { delay :: Int }
autoplay = opt "autoplay"

breakpoints :: Option SwiperOptions Foreign
breakpoints = opt "breakpoints"

breakpointsBase :: Option SwiperOptions String
breakpointsBase = opt "breakpointsBase"

cardsEffect :: Option SwiperOptions Foreign
cardsEffect = opt "cardsEffect"

centerInsufficientSlides :: Option SwiperOptions Boolean
centerInsufficientSlides = opt "centerInsufficientSlides"

centeredSlides :: Option SwiperOptions Boolean
centeredSlides = opt "centeredSlides"

centeredSlidesBounds :: Option SwiperOptions Boolean
centeredSlidesBounds = opt "centeredSlidesBounds"

containerModifierClass :: Option SwiperOptions String
containerModifierClass = opt "containerModifierClass"

controller :: Option SwiperOptions Foreign
controller = opt "controller"
coverflowEffect :: Option SwiperOptions Foreign
coverflowEffect = opt "coverflowEffect"

createElements :: Option SwiperOptions Boolean
createElements = opt "createElements"

creativeEffect :: Option SwiperOptions Foreign
creativeEffect = opt "creativeEffect"

cssMode :: Option SwiperOptions Boolean
cssMode = opt "cssMode"

cubeEffect :: Option SwiperOptions Foreign
cubeEffect = opt "cubeEffect"

direction :: Option SwiperOptions String
direction = opt "direction"

edgeSwipeDetection :: Option SwiperOptions (String |+| Boolean)
edgeSwipeDetection = opt "edgeSwipeDetection"

edgeSwipeThreshold :: Option SwiperOptions Int
edgeSwipeThreshold = opt "edgeSwipeThreshold"

effect :: Option SwiperOptions String
effect = opt "effect"

enabled :: Option SwiperOptions Boolean
enabled = opt "enabled"

eventsPrefix :: Option SwiperOptions String
eventsPrefix = opt "eventsPrefix"

fadeEffect :: Option SwiperOptions Foreign
fadeEffect = opt "fadeEffect"

flipEffect :: Option SwiperOptions Foreign
flipEffect = opt "flipEffect"

focusableElements :: Option SwiperOptions String
focusableElements = opt "focusableElements"

followFinger :: Option SwiperOptions Boolean
followFinger = opt "followFinger"

freeMode :: Option SwiperOptions Foreign
freeMode = opt "freeMode"

grabCursor :: Option SwiperOptions Boolean
grabCursor = opt "grabCursor"

grid :: Option SwiperOptions Foreign
grid = opt "grid"

hashNavigation :: Option SwiperOptions Foreign
hashNavigation = opt "hashNavigation"

height :: Option SwiperOptions Number
height = opt "height"

history :: Option SwiperOptions Foreign
history = opt "history"

init :: Option SwiperOptions Boolean
init = opt "init"

initialSlide :: Option SwiperOptions Int
initialSlide = opt "initialSlide"

injectStyles :: Option SwiperOptions (Array String)
injectStyles = opt "injectStyles"

injectStylesUrls :: Option SwiperOptions (Array String)
injectStylesUrls = opt "injectStylesUrls"

keyboard :: Option SwiperOptions Foreign
keyboard = opt "keyboard"

lazyPreloadPrevNext :: Option SwiperOptions Int
lazyPreloadPrevNext = opt "lazyPreloadPrevNext"

lazyPreloaderClass :: Option SwiperOptions String
lazyPreloaderClass = opt "lazyPreloaderClass"

longSwipes :: Option SwiperOptions Boolean
longSwipes = opt "longSwipes"

longSwipesMs :: Option SwiperOptions Int
longSwipesMs = opt "longSwipesMs"

longSwipesRatio :: Option SwiperOptions Number
longSwipesRatio = opt "longSwipesRatio"

loop :: Option SwiperOptions Boolean
loop = opt "loop"

loopAddBlankSlides :: Option SwiperOptions Boolean
loopAddBlankSlides = opt "loopAddBlankSlides"

loopAdditionalSlides :: Option SwiperOptions Int
loopAdditionalSlides = opt "loopAdditionalSlides"

loopPreventsSliding :: Option SwiperOptions Boolean
loopPreventsSliding = opt "loopPreventsSliding"

maxBackfaceHiddenSlides :: Option SwiperOptions Int
maxBackfaceHiddenSlides = opt "maxBackfaceHiddenSlides"

modules :: Option SwiperOptions Foreign
modules = opt "modules"

mousewheel :: Option SwiperOptions Foreign
mousewheel = opt "mousewheel"

navigation :: Option SwiperOptions Foreign
navigation = opt "navigation"

nested :: Option SwiperOptions Boolean
nested = opt "nested"

noSwiping :: Option SwiperOptions Boolean
noSwiping = opt "noSwiping"

noSwipingClass :: Option SwiperOptions String
noSwipingClass = opt "noSwipingClass"

noSwipingSelector :: Option SwiperOptions String
noSwipingSelector = opt "noSwipingSelector"

normalizeSlideIndex :: Option SwiperOptions Boolean
normalizeSlideIndex = opt "normalizeSlideIndex"

observeParents :: Option SwiperOptions Boolean
observeParents = opt "observeParents"

observeSlideChildren :: Option SwiperOptions Boolean
observeSlideChildren = opt "observeSlideChildren"

observer :: Option SwiperOptions Boolean
observer = opt "observer"

on :: Option SwiperOptions Foreign
on = opt "on"

onAny :: Option SwiperOptions Foreign
onAny = opt "onAny"

oneWayMovement :: Option SwiperOptions Boolean
oneWayMovement = opt "oneWayMovement"

pagination :: Option SwiperOptions Foreign
pagination = opt "pagination"

parallax :: Option SwiperOptions Foreign
parallax = opt "parallax"

passiveListeners :: Option SwiperOptions Boolean
passiveListeners = opt "passiveListeners"

preventClicks :: Option SwiperOptions Boolean
preventClicks = opt "preventClicks"

preventClicksPropagation :: Option SwiperOptions Boolean
preventClicksPropagation = opt "preventClicksPropagation"

preventInteractionOnTransition :: Option SwiperOptions Boolean
preventInteractionOnTransition = opt "preventInteractionOnTransition"

resistance :: Option SwiperOptions Boolean
resistance = opt "resistance"

resistanceRatio :: Option SwiperOptions Number
resistanceRatio = opt "resistanceRatio"

resizeObserver :: Option SwiperOptions Boolean
resizeObserver = opt "resizeObserver"

rewind :: Option SwiperOptions Boolean
rewind = opt "rewind"

roundLengths :: Option SwiperOptions Boolean
roundLengths = opt "roundLengths"

runCallbacksOnInit :: Option SwiperOptions Boolean
runCallbacksOnInit = opt "runCallbacksOnInit"

scrollbar :: Option SwiperOptions Foreign
scrollbar = opt "scrollbar"

setWrapperSize :: Option SwiperOptions Boolean
setWrapperSize = opt "setWrapperSize"

shortSwipes :: Option SwiperOptions Boolean
shortSwipes = opt "shortSwipes"

simulateTouch :: Option SwiperOptions Boolean
simulateTouch = opt "simulateTouch"

slideActiveClass :: Option SwiperOptions String
slideActiveClass = opt "slideActiveClass"

slideBlankClass :: Option SwiperOptions String
slideBlankClass = opt "slideBlankClass"

slideClass :: Option SwiperOptions String
slideClass = opt "slideClass"

slideFullyVisibleClass :: Option SwiperOptions String
slideFullyVisibleClass = opt "slideFullyVisibleClass"

slideNextClass :: Option SwiperOptions String
slideNextClass = opt "slideNextClass"

slidePrevClass :: Option SwiperOptions String
slidePrevClass = opt "slidePrevClass"

slideToClickedSlide :: Option SwiperOptions Boolean
slideToClickedSlide = opt "slideToClickedSlide"

slideVisibleClass :: Option SwiperOptions String
slideVisibleClass = opt "slideVisibleClass"

slidesOffsetAfter :: Option SwiperOptions Int
slidesOffsetAfter = opt "slidesOffsetAfter"

slidesOffsetBefore :: Option SwiperOptions Int
slidesOffsetBefore = opt "slidesOffsetBefore"

slidesPerGroup :: Option SwiperOptions Int
slidesPerGroup = opt "slidesPerGroup"

slidesPerGroupAuto :: Option SwiperOptions Boolean
slidesPerGroupAuto = opt "slidesPerGroupAuto"

slidesPerGroupSkip :: Option SwiperOptions Int
slidesPerGroupSkip = opt "slidesPerGroupSkip"

slidesPerView :: Option SwiperOptions (String |+| Int)
slidesPerView = opt "slidesPerView"

spaceBetween :: Option SwiperOptions (String |+| Int)
spaceBetween = opt "spaceBetween"

speed :: Option SwiperOptions Int
speed = opt "speed"

swipeHandler :: Option SwiperOptions String
swipeHandler = opt "swipeHandler"

swiperElementNodeName :: Option SwiperOptions String
swiperElementNodeName = opt "swiperElementNodeName"

threshold :: Option SwiperOptions Int
threshold = opt "threshold"

thumbs :: Option SwiperOptions Foreign
thumbs = opt "thumbs"

touchAngle :: Option SwiperOptions Int
touchAngle = opt "touchAngle"

touchEventsTarget :: Option SwiperOptions String
touchEventsTarget = opt "touchEventsTarget"

touchMoveStopPropagation :: Option SwiperOptions Boolean
touchMoveStopPropagation = opt "touchMoveStopPropagation"

touchRatio :: Option SwiperOptions Number
touchRatio = opt "touchRatio"

touchReleaseOnEdges :: Option SwiperOptions Boolean
touchReleaseOnEdges = opt "touchReleaseOnEdges"

touchStartForcePreventDefault :: Option SwiperOptions Boolean
touchStartForcePreventDefault = opt "touchStartForcePreventDefault"

touchStartPreventDefault :: Option SwiperOptions Boolean
touchStartPreventDefault = opt "touchStartPreventDefault"

uniqueNavElements :: Option SwiperOptions Boolean
uniqueNavElements = opt "uniqueNavElements"

updateOnWindowResize :: Option SwiperOptions Boolean
updateOnWindowResize = opt "updateOnWindowResize"

url :: Option SwiperOptions String
url = opt "url"

userAgent :: Option SwiperOptions String
userAgent = opt "userAgent"

virtual :: Option SwiperOptions Foreign
virtual = opt "virtual"

virtualTranslate :: Option SwiperOptions Boolean
virtualTranslate = opt "virtualTranslate"

watchOverflow :: Option SwiperOptions Boolean
watchOverflow = opt "watchOverflow"

watchSlidesProgress :: Option SwiperOptions Boolean
watchSlidesProgress = opt "watchSlidesProgress"

width :: Option SwiperOptions Int
width = opt "width"

wrapperClass :: Option SwiperOptions String
wrapperClass = opt "wrapperClass"

zoom :: Option SwiperOptions Foreign
zoom = opt "zoom"



type SwiperParams = {className :: String, initialSlide :: Int }
foreign import swiperImpl :: String -> Foreign -> Effect Swiper
swiper :: String -> Options SwiperOptions -> Effect Swiper
swiper className opts = swiperImpl className (options opts)
foreign import activeIndex :: Swiper -> Effect Int
foreign import slideTo :: Swiper -> Int -> Effect Unit
foreign import onEvent :: Swiper -> String -> (Effect Unit) -> Effect (Effect Unit)
