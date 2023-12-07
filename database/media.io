enum media_type {
  photo
  video
  audio
}

Table media {
  id integer [primary key]
  type media_type [not null]
  link varchar [not null]
  created_at timestamp [default: `now()`]
}

