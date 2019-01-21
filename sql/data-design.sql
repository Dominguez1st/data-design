ALTER DATABASE rdominguez45 CHARACTER SET utf8 COLLATE utf8_unicode_ci;

DROP TABLE IF EXISTS watches;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS stream;
DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
	userId  BINARY(64) NOT NULL,
	userName VARCHAR(32) NOT NULL,
	userPassword VARCHAR(32) NOT NULL,
	userHosts BINARY(64) NOT NULL,
	KEY(userHosts),
	UNIQUE(userName),
	PRIMARY KEY(userId )
);

CREATE TABLE stream (
	streamId  BINARY(64) NOT NULL,
	streamName VARCHAR(32) NOT NULL,
	streamCategory VARCHAR(32) NOT NULL,
	streamGame VARCHAR(32) NOT NULL,
	streamTime DATETIME(6) NOT NULL,
	streamViewers VARCHAR(32) NOT NULL,
	FOREIGN KEY(streamId) REFERENCES user(userId),
	FOREIGN KEY(streamId) REFERENCES user(userHosts),
	PRIMARY KEY(streamId)
);
CREATE TABLE comments (
   commentId BINARY(64) NOT NULL,
	commentsUserId BINARY(64) NOT NULL,
	commentsStreamId BINARY(64) NOT NULL,
	commentsContents VARCHAR(128) NOT NULL,
	INDEX(commentsUserId),
	INDEX(commentsStreamId),
	FOREIGN KEY(commentsUserId) REFERENCES user(userID),
	FOREIGN KEY(commentsStreamId) REFERENCES stream(streamId),
	PRIMARY KEY(commentId)
);
CREATE TABLE watches (
   watchesUserId BINARY(64) NOT NULL,
   watchesStreamId BINARY(64) NOT NULL,
	FOREIGN KEY (watchesUserId) REFERENCES user(userId),
	FOREIGN KEY (watchesStreamId) REFERENCES stream(streamId),
	PRIMARY KEY (watchesUserId, watchesStreamId)
);