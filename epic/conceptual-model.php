<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Conceptual Model</title>
	</head>
	<body>
		<h1>Conceptual Model</h1>
		<h2>Entities & Attributes</h2>
		<h3>User</h3>
		<ul>
			<li>userId (primary key)</li>
			<li>userName</li>
			<li>userPassword</li>
			<li>userHosts</li>
		</ul>
		<h3>Stream</h3>
		<ul>
			<li>streamId (primary key)</li>
			<li>streamName</li>
			<li>streamCategory</li>
			<li>streamGame</li>
			<li>streamTime</li>
			<li>streamViewers</li>
		</ul>
		<h3>Comments</h3>
		<ul>
			<li>commentsId (foreign key)</li>
			<li>commentsUserId (foreign key)</li>
			<li>commentsStreamId (foreign key)</li>
			<li>commentsContent </li>
		</ul>
		<h3>Watches</h3>
		<ul>
			<li>watchesUserId (foreign key)</li>
			<li>watchesStreamId (foreign key)</li>
		</ul>
		<h1>Relations</h1>
		<ul>
			<li>Many users can watch many streams (n to m)</li>
			<li>One streamer can host one stream (1 to 1)</li>
			<li>Many users can comments on many streams (n to m)</li>
		</ul>
		<h1>Entity Relationship Diagram</h1>
		<img src="diagram.png" alt="Entity Relationship Diagram" width="75%" height="auto">
		<h2><a href="index.php">Return</a></h2>
	</body>
</html>