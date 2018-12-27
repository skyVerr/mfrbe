<?php 
    header('Access-Control-Allow-Origin: *');
    header('Content-type: Application/json');
?>

<?php 
    require_once('connection.php');

    $contact = json_decode(file_get_contents('php://input'));

    $insert = "";
    foreach ($contact as $key => $value) {
        $insert = $insert."$key='$value',";
    }
    $insert = substr($insert, 0, -1);

    $sql = "INSERT INTO contacts SET $insert";

    if($conn->query($sql)){
        echo json_encode(["message"=>"insert success"]);
    } else {
        http_response_code(403);
        echo json_encode(["Error"=>"mysql error: ".mysqli_error($conn)]);
    }

?>