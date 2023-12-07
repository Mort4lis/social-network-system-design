enum chat_type {
  group
  conversation
}

Table chats {
  id integer [primary key]
  name varchar [not null]
  type chat_type [not null]
  created_at timestamp [default: `now()`]
}

Table participants {
  id integer [primary key]
  chat_id integer [not null]
  user_id integer [not null] // Ref: users.id (profiles_and_relations.dbml)
}

Ref: participants.chat_id > chats.id

Table messages {
  id integer [primary key]
  chat_id integer [not null]
  sender_id integer [not null] // Ref: users.id (profiles_and_relations.dbml)
  text varchar [not null]
  sent_at timestamp [not null]
  delivered_at timestamp
  seen_at timestamp
}

Ref: messages.chat_id > chats.id

