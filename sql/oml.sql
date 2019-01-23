delete from watches;
delete from comments;
delete from `user`;
delete from stream;


INSERT INTO stream (streamId, streamName, streamCategory, streamGame, streamTime, streamViewers) VALUES
	(UNHEX("3ee315e4218045c8bec05d62e4df3898"),"Daughters of Ash playthrough","Mature","Dark Souls",NOW(),"1234");
INSERT INTO stream (streamId, streamName, streamCategory, streamGame, streamTime, streamViewers) VALUES
	(UNHEX("90a2a001b4424a87a4ab2a14397ae5db"),"Smash Tournament","Not Mature","Super Smash Bros Ultimate",NOW(),
 	"17978");
INSERT INTO stream (streamId, streamName, streamCategory, streamGame, streamTime, streamViewers) VALUES
	(UNHEX("583f05e3c1e445aa98d03eed134fde16"),"Pat Plays Fallout NV","Mature","Fallout New Vegas",NOW(),"5178");

-- User changes games
UPDATE stream SET streamGame = "Super Smash Bros Melee" WHERE streamId = (UNHEX("90a2a001b4424a87a4ab2a14397ae5db"));

INSERT INTO user (userId, userName, userPassword, userHostsStreamId) VALUES (UNHEX("c3bb03e3d581406d80ef00d3a69b59ee"),
	"randomjoe1337","password123",UNHEX("90a2a001b4424a87a4ab2a14397ae5db"));
INSERT INTO user (userId, userName, userPassword, userHostsStreamId) VALUES (UNHEX("c4cd1fdb4bc348a0a13f203540b609e6"),
	"larry45","password1234",UNHEX("3ee315e4218045c8bec05d62e4df3898"));
INSERT INTO user (userId, userName, userPassword, userHostsStreamId) VALUES (UNHEX("a389409742bc4f7486e1ad5163b222d6"),
	"sarah13","safepassword1234",UNHEX("583f05e3c1e445aa98d03eed134fde16"));


INSERT INTO user (userId, userName, userPassword, userHostsStreamId) VALUES (UNHEX("da16f72d8a084b9e8cd6522bed2fb9ff"),
	"viewer78","weakpassword1234",NULL);


INSERT INTO watches (watchesUserId, watchesStreamId) VALUES (UNHEX("da16f72d8a084b9e8cd6522bed2fb9ff"),
	UNHEX("90a2a001b4424a87a4ab2a14397ae5db"));

-- User ends stream
UPDATE user SET userHostsStreamId = NULL WHERE userId = (UNHEX("583f05e3c1e445aa98d03eed134fde16"));

-- Stream gets cleaned up
DELETE FROM stream WHERE streamId=UNHEX("583f05e3c1e445aa98d03eed134fde16");

SELECT streamId,streamName,streamCategory,streamGame,streamTime,streamViewers FROM stream WHERE
	streamId = UNHEX("3ee315e4218045c8bec05d62e4df3898");

SELECT stream.streamId, stream.streamName, stream.streamCategory, stream.streamGame, stream.streamTime,
       stream.streamViewers FROM stream INNER JOIN user ON stream.streamId = user.userHostsStreamId WHERE
       stream.streamGame LIKE "Dark Souls";

SELECT COUNT(watchesUserId) FROM watches WHERE watchesStreamId = UNHEX("90a2a001b4424a87a4ab2a14397ae5db");