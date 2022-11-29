
<?php
try {
  $conn = new PDO('mysql:host=localhost;dbname=liloca', 'root', '');
  // echo 'Conectou';

} catch(PDOException $e) {
    echo 'ERROR: ' . $e->getMessage();
}
?>



