import consumer from "./consumer"

const chatRoomChannel = consumer.subscriptions.create("ChatRoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to the chat room!");
    $("#modal").css('display', 'flex');
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    // $('#messages').append('<p class="received"> ' + data.message + '</p>');
    if (data.message) {
      let current_name = sessionStorage.getItem('chat_room_name');
      let msg_class = data.sent_by === current_name ? "sent" : "received";
      $('#messages').append(`<p class='${msg_class}'>` + data.message + '</p>');
    } else if(data.chat_room_name) {
      let name = data.chat_room_name;
      let announcement_type = data.type == 'join' ? 'joined' : 'left';
      $('#messages').append(`<p class="announce"><em>${name}</em> ${announcement_type} the room</p>`);
    }
  },

  speak(message) {
    let name = sessionStorage.getItem('chat_room_name');
    this.perform('speak', { message, name });
  },

  announce(content) {
    this.perform('announce', { name: content.name, type: content.type });
  }
});

export default chatRoomChannel;
