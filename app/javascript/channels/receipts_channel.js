// app/javascript/channels/chat_channel.js
import consumer from "./consumer";

consumer.subscriptions.create(
  { channel: "ReceiptsChannel" },
  {
    received(data) {
      this.appendReceipt(data);
    },

    appendReceipt(data) {
      //  const html = this.createLine(data)
      const element = document.querySelector("#receipts");
      element.insertAdjacentHTML("afterbegin", data["content"]);
    }
  }
);
