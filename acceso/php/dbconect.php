<?php
$mysqli = new mysqli("198.71.227.90", "valpaax", "Rallyspeed007", "valparts_bd");
if ($mysqli->connect_errno) {
    echo "Fallo al contenctar a MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
//echo $mysqli->host_info . "\n";
?> 