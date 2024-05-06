export const swiperImpl = (className) => (opts) => () =>
  new Swiper(`.${className}`, opts);

export const activeIndex = (slider) => () => slider.activeIndex;

export const slideTo = (slider) => (index) => () => slider.slideTo(index);

export const onEvent = (slider) => (event) => (callback) => () => {
  slider.on(event, callback);
  return () => slider.off(event, callback);
};
