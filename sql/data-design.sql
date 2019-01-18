ALTER DATABASE rdominguez45 CHARACTER SET utf8 COLLATE utf8_unicode_ci;

DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS stream;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS streamer;

CREATE TABLE `user` (
	userId  BINARY(16) NOT NULL,
	userName VARCHAR(32) NOT NULL,
	userPassword VARCHAR(32) NOT NULL,
	userWatches VARCHAR(64),
	userComment VARCHAR(128),
	UNIQUE(userName),
	PRIMARY KEY(userId )
);

CREATE TABLE streamer (
	streamerId BINARY(16) NOT NULL,
	streamerName VARCHAR(32) NOT NULL,
	streamerPassword VARCHAR(32) NOT NULL,
	streamerBroadcasts VARCHAR(64),
	streamerComment VARCHAR(128),
	UNIQUE(streamerName),
	PRIMARY KEY(streamerId)
);

CREATE TABLE stream (
	streamId  BINARY(16) NOT NULL,
	streamName VARCHAR(32) NOT NULL,
	streamCategory VARCHAR(32) NOT NULL,
	streamGame VARCHAR(32) NOT NULL,
	streamTime DATETIME(6) NOT NULL,
	streamViewers VARCHAR(32) NOT NULL,
	streamChatbox VARCHAR(32) NOT NULL,
	streamUserWatches VARCHAR(32),
	streamStreamerBroadcast VARCHAR(64),
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