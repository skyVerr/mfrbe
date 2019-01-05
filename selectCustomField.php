<?php 
    header('Access-Control-Allow-Origin: *');
    header('Content-type: application/json');
?>

<?php 
    require_once('connection.php');

    $contact_id = $_GET['contact_id'];

    $sql = "SELECT * FROM contacts_custom_fields WHERE contact_id = $contact_id";

    $query= $conn->query($sql);

    $data = [];

    if($query->num_rows > 0){
        while($row = $query->fetch_assoc()){
            $data[] = $row;
        }
    } 

    echo json_encode($data);


?>