<?php 
$directorio = '../imgsweb';
$ficheros1  = scandir($directorio);
//$ficheros2  = scandir($directorio, 1);
sort($ficheros1, SORT_STRING);
Foreach ($ficheros1 as $valor)
{
	if ($valor == '.' or $valor == '..'){
	}
	else{
		echo '<img src="http://127.0.0.1/0-valpar/imgsweb/'.$valor.'" style="vertical-align:middle;" alt="" width="230"/>';
	}
}?>
