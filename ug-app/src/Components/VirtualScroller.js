import VirtualScroller from "virtual-scroller/dom";


export const virtualScrollerImpl = (elt) => (list) => (renderMessage) => () => {
    new VirtualScroller(
    elt,
    list,
    renderMessage
  );
};
