<?php

	include_once ('connect.php');

    $levelname = $_POST['myname'];
	$highscore= $_POST['myscore'];
	
	
if($result=mysqli_query($link,"Select * from score")){
	
	  $rowcount=mysqli_num_rows($result);
		
		if($rowcount==0){
			
			if (mysqli_query($link, "INSERT INTO score (name,highscore) VALUES('$levelname','$highscore')")) {

                 echo 'result=Insert GameInfo';

			} 
			
			
		}else{
			
			if($checkquery=mysqli_query($link,"SELECT * FROM score where highscore < '$highscore'")){
				
				if(mysqli_num_rows($checkquery)==1){
					
					$sql = "UPDATE score
					SET
					name = '$levelname',
					highscore  = '$highscore'
					WHERE id = 13";
			
			      if (mysqli_query($link,$sql)) {

					   echo 'result=Updated GameInfo';

					} 
					
				
				}else{
					
					echo 'result=Not update bro';
				}
				  
				
			}
				
		}
			
		
	}
					
    mysqli_close($link);

?>