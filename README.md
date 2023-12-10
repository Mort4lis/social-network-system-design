# Social network System Design

This repository describes the system design of social network
within [the course](https://balun.courses/courses/system_design).

## Requirements

Our system should meet the following requirements:

### Functional requirements

- Add and delete friends
- View user's friends
- View user's profile
- Publish posts
- View feed of posts (home and user feed)
- Upload media files for posts
- Send and read messages in one-on-one and group chats
- View one-on-one and group chats

### Non-functional requirements

- 50 000 000 DAU
- Availability 99.99% (52.56 minutes downtime per year)
- The system should be scalable and efficient
- Each user sends 2 posts average per day
- Each user reads 10 posts average per day
- The size of each post is a maximum of 5000 characters
- The size of each media files is a maximum 1MB
- 10% of posts contain media files
- Each post has a maximum 3 media files
- A message should reach the recipient in 3 seconds
- Each user sends 10 messages average per day
- Each user reads 50 messages average per day
- The size of each message is a maximum of 1000 characters
- A group can have a maximum of 100 participants
- Posts and messages save forever
- Geo distribution is not supported (CIS only)
- No seasonality

## Basic estimation[](https://)

### RPS

#### Send posts

$$
\frac{50 \space million \times 2 \space posts \space per \space day}{(24 \space hrs \times 3600 \space seconds)} = \sim 1158 \space requests/second
$$

#### Read posts

$$
\frac{50 \space million \times 10 \space posts \space per \space day}{(24 \space hrs \times 3600 \space seconds)} = \sim 5787 \space requests/second
$$

#### Send messages

$$
\frac{50 \space million \times 10 \space messages \space per \space day}{(24 \space hrs \times 3600 \space seconds)} = \sim 5787 \space requests/second
$$

#### Read messages

$$
\frac{50 \space million \times 50 \space messages \space per \space day}{(24 \space hrs \times 3600 \space seconds)} = \sim 28935 \space requests/second
$$

### Traffic

#### Send posts

Text traffic:

$$
{1158 \space posts \space per \space second \times 2 \times 5000 \space bytes} = \sim 11.6 \space MB/second
$$

Media files traffic:

$$
{1158 \space posts \space per \space second \times 0.1 \times 3 \times 1 \space MB} = \sim 347.4 \space MB/second
$$

Total:

$$
{11.6 \space MB/second + 347.4 \space MB/second} = 359 \space MB/second
$$

#### Send messages

$$
{5787 \space messages \space per \space second \times 2 \times 1000 \space bytes} = \sim 11.6 \space MB/second
$$

### Storage

Database size for storing messages for 5 years:

$$
{11.6 \space MB/second \times (24 \space hrs \times 3600 \space seconds) \times 365 \space days \times 5 \space years} = \sim 1.83 \space PB
$$

Database size for storing posts for 5 years:

$$
{359 \space MB/second \times (24 \space hrs \times 3600 \space seconds) \times 365 \space days \times 5 \space years} = \sim 56.6 \space PB
$$

Total:

$$
{1.83 \space PB + 56.6 \space PB} = 58.43 \space PB
$$

Number of disks (disk capacity = 16 TB):

$$
\frac{58.43 \space PB \times 1000}{16 \space TB} = \sim 3652 \space number \space of \space disks
$$
