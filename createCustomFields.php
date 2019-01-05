<?php 
    header('Access-Control-Allow-Origin: *');
    header('Content-type: application/json');
?>

<?php 
    require_once('connection.php');

    $object = json_decode(file_get_contents('php://input'),1);

    $insert = "";
    foreach ($object['custom'] as $custom) {
        $field = $custom['field'];
        $value = $custom['value'];
        $contact_id = $object['contact_id'];
        $insert.="('$field','$value',$contact_id),";
    }
    $insert = substr($insert, 0, -1);

    $sql = "INSERT INTO contacts_custom_fields(field,value,contact_id) VALUES $insert";

    if($conn->query($sql)){
        echo json_encode(["contact_id"=>mysqli_insert_id($conn)],JSON_NUMERIC_CHECK);
    } else {
        http_response_code(403);
        echo json_encode(["Error"=>"mysql error: ".mysqli_error($conn),
        "sql"=>$sql]);
    }

?>