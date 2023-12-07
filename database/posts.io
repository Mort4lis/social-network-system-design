// Replication:
// - master-slave (async)
// - replication factor 3

// Sharding:
// - key based by id

Table posts {
  id integer [primary key]
  author_id integer [not null] // Ref: users.id (profiles_and_relations.io)
  description varchar [not null]
  likes integer [default: 0]
  views integer [default: 0]
  created_at timestamp [default: `now()`]
}

// Sharding:
// - key based by post_id

Table comments {
  id integer [primary key]
  post_id integer [not null]
  sender_id integer [not null] // Ref: users.id (profiles_and_relations.io)
  text varchar [not null]
  created_at timestamp [default: `now()`]
}

Ref: comments.post_id > posts.id

Table hashtags {
  id integer [primary key]
  name varchar [not null, unique]
}

// Sharding:
// - key based by post_id

Table hashtags_posts {
  post_id integer [not null]
  hashtag_id integer [not null]
  
  indexes {
    (post_id, hashtag_id) [pk]
  }
}

Ref: hashtags_posts.post_id > posts.id
Ref: hashtags_posts.hashtag_id > hashtags.id

// Sharding:
// - key based by post_id

Table post_media {
  id integer [primary key]
  post_id integer [not null]
  media_id integer [not null] // Ref: media.id (media.io)
}

Ref: post_media.post_id > posts.id
