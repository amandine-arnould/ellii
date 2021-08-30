import consumer from "./consumer";

const initSessionCable = () => {
  const messagesContainer = document.getElementById("messages");
  if (messagesContainer) {
    const id = messagesContainer.dataset.sessionId;

    consumer.subscriptions.create(
      { channel: "SessionChannel", id: id },
      {
        received(data) {
          messagesContainer.insertAdjacentHTML("beforeend", data);
        },
      }
    );
  }
};

export { initSessionCable };
