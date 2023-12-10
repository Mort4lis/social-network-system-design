// Replication:
// - master-slave (async)
// - replication factor 2

enum media_type {
  photo
  video
  audio
}

// Sharding:
// - key based by id

Table media {
  id integer [primary key]
  type media_type [not null]
  link varchar [not null]
  created_at timestamp [default: `now()`]
}

