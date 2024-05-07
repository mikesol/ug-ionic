import VirtualScroller from "virtual-scroller";

function renderMessage(message) {
  // Message element.
  const root = document.createElement("article");

  // Message author.
  const author = document.createElement("a");
  author.setAttribute("href", `/users/${message.username}`);
  author.textContent = `@${message.username}`;
  root.appendChild(author);

  // Message date.
  const time = document.createElement("time");
  time.setAttribute("datetime", message.date.toISOString());
  time.textContent = message.date.toString();
  root.appendChild(time);

  // Message text.
  const text = document.createElement("p");
  text.textContent = message.text;
  root.appendChild(text);

  // Return message element.
  return root;
}

// const virtualScroller = new VirtualScroller(
//   document.getElementById('messages'),
//   messages,
//   renderMessage
// )

export const virtualScrollerImpl = (elt) => (list) => (renderMessage) => () => {
  new VirtualScroller(
    elt,
    list,
    renderMessage
  );
};
