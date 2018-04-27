<html>
<head><title>Movie Media</title></head>
<body>
	<h1 align="center">Movie Genre</h1>
</body>
</html>

<div id="form" align="center">
<form method="POST">
<input align="center" type="TEXT" name="search" />
<input type="SUBMIT" name="submit" Value="Search For Movie Genre" />
</form>
</div>



<?php
$mysqli = NEW mysqli("localhost", "root", "12345", "media");

if(isset($_POST['submit']))
{

	$search = $_POST['search'];
	$movies = $mysqli->query("SELECT movies.movieid, movies.movietitle, movieyear.movieyear, moviegenre.moviegenre FROM moviegenre INNER JOIN movies ON moviegenre.movieid=movies.movieid INNER JOIN movieyear ON movieyear.movieid=movies.movieid WHERE moviegenre.moviegenre LIKE '%$search%'");

	if(empty($_POST['search'])) 
 	{
	 	echo "<p align = 'center'>User did not input any data.</p>";
 	}

	else
	{
 
		if($movies->num_rows > 0)
		{
				echo "<center><table border='1' width='700px'>";
        		echo "<tr>";
        		echo "<th>ID</th>";
        		echo "<th>Movie Title</th>";
        		echo "<th>Year</th>";
        		echo "<th>Genre</th>";	
				echo "</tr>";
				
			while($row = mysqli_fetch_array($movies))
			{
			

		
		
			    echo "<tr>";
                echo "<td>" . $row['movieid'] . "</td>";
                echo "<td>" . $row['movietitle'] . "</td>";
                echo "<td>" . $row['movieyear'] . "</td>";
                echo "<td>" . $row['moviegenre'] . "</td>";
				echo "</tr>";
		
			}
			echo "</table></center>";
		}
		else
		{

			echo "<p align = 'center'>There are no matches for that.</p>";
		}
	}
}
?>