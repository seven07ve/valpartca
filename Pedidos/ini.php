<?php
session_start();
$_SESSION['username'] = $_COOKIE["NickName"]; // "johndoe" // Must be already set
header('Location: X001A003.asp');
?>

<html>
  <body>
    <p>

    </p>
  </body>
</html>