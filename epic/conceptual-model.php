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
			<li>user</li>
			<li>userId</li>
			<li>userName</li>
			<li>userPassword</li>
			<li>userComment</li>
			<li>userWatch</li>
		</ul>
		<h3>steamer</h3>
		<ul>
			<li>steamerId</li>
			<li>steamerName</li>
			<li>steamerBroadcast</li>
		</ul>
		<h3>chat</h3>
		<ul>
			<li>chatUserComment</li>>
			<li>chatStreamerComment</li>
		</ul>
		<h3>stream</h3>
		<ul>
			<li>streamUserWatch</li>
			<li>streamBroadcast</li>
		</ul>
		<h1>Relations</h1>
		<ul>
			<li>One streamer may only broadcast one stream</li>
			<li>Many users may watch many streams</li>
			<li>Many users may comment many times</li>
			<li>Many streamers may comment many times</li>
		</ul>
		<h1>Entity Relationship Diagram</h1>
		<a href="index.php">Return</a>
	</body>
</html>