App.conversation = App.cable.subscriptions.create "ConversationChannel",
  connected: ->
    console.log 'I am connected' 
  disconnected: ->

  received: (data) ->
    conversation = $('#conversations-list').find("[data-conversation-id='" + data['conversation_id'] + "']")
    conversation.find('.messages-list').find('ul').append(data['message'])
 
    messages_list = conversation.find('.messages-list')
    height = if messages_list.length > 0  then messages_list[0].scrollHeight else messages_list.scrollHeight 
    messages_list.scrollTop(height)

  speak: (message) ->
    @perform 'speak', { message: message }


$(document).on 'submit', '.new_message', (e) ->
  e.preventDefault()
  values = $(this).serializeArray();
  App.conversation.speak(values)
  $(this).trigger('reset')

