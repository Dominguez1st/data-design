ALTER DATABASE rdominguez45 CHARACTER SET utf8 COLLATE utf8_unicode_ci;

DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS stream;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS streamer;

CREATE TABLE `user` (
	userId  BINARY(16) NOT NULL,
	userName VARCHAR(32) NOT NULL,
	userPassword VARCHAR(32) NOT NULL,
	userWatches VARCHAR(32),
	userComment VARCHAR(128),
	UNIQUE(userName),
	PRIMARY KEY(userId )
);

CREATE TABLE streamer (
	streamerId   BINARY(16) NOT NULL,
	streamerName VARCHAR(32) NOT NULL,
	streamerPassword VARCHAR(32) NOT NULL,
	streamerBroadcasts VARCHAR(32),
	streamerComment VARCHAR(128),
	UNIQUE(streamerName),
	PRIMARY KEY(streamerId)
);

CREATE TABLE stream (
	streamId  BINARY(16) NOT NULL,
	streamName BINARY(32) NOT NULL,
	streamCategory BINARY(32) NOT NULL,
	streamGame BINARY(32) NOT NULL,
	streamTime BINARY(32) NOT NULL,
	streamViewers BINARY(32) NOT NULL,
	streamChatbox BINARY(32) NOT NULL,
	streamUserWatches BINARY(32) NOT NULL,
	streamStreamerBroadcast VARCHAR(128) NOT NULL,
	INDEX(streamUserWatches),
	INDEX(streamStreamerBroadcast),
	FOREIGN KEY(streamUserWatches) REFERENCES user(userWatches),
	FOREIGN KEY(streamStreamerBroadcast ) REFERENCES streamer(streamerBroadcasts),
	PRIMARY KEY(streamUserWatches, streamStreamerBroadcast, streamId)
);
CREATE TABLE comments (
	commentsUserId BINARY(16) NOT NULL,
	commentsStreamerId BINARY(16) NOT NULL,
	commentsStreamId BINARY(16) NOT NULL,
	commentsContents VARCHAR(128) NOT NULL,
	INDEX(commentsUserId),
	INDEX(commentsStreamerId),
	INDEX(commentsStreamId),
	FOREIGN KEY(commentsUserId) REFERENCES user(userID),
	FOREIGN KEY(commentsStreamerId ) REFERENCES streamer(streamerId),
	FOREIGN KEY(commentsStreamId) REFERENCES stream(streamId),
	PRIMARY KEY(commentsUserId, commentsStreamerId, commentsStreamId)
);