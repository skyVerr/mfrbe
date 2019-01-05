<?php 
    header('Access-Control-Allow-Origin: *');
    header('Content-type: application/json');
?>

<?php 
    require_once('connection.php');

    $contact_id = $_GET['contact_id'];

    $sql = "SELECT * FROM contacts WHERE contact_id = $contact_id";

    $query= $conn->query($sql);

    $contact = null;

    if($query->num_rows > 0){
        $contact = $query->fetch_assoc();
        echo json_encode($contact);
    } else {
        http_response_code(404);
        echo json_encode(["message"=>"no such contact"]);
    }


?>