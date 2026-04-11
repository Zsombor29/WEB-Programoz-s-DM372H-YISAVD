<?php
require_once 'kapcsolat.php';
header("Content-Type: application/json; charset=UTF-8");

$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {

    case 'GET':
        $stmt = $pdo->query("SELECT * FROM rendeles ORDER BY az DESC");
        $rendelesek = $stmt->fetchAll();
        echo json_encode($rendelesek);
        break;

        case 'POST':
            $data = json_decode(file_get_contents("php://input"));
    
            // Itt ellenőrizzük, hogy a JS-ből érkező mezők megvannak-e
            if (!empty($data->pizza_nev) && !empty($data->meret) && !empty($data->darab) && !empty($data->vevo_nev)) {
                
                // JAVÍTÁS: Az SQL-ben az oszlopnevek alulhúzás NÉLKÜL vannak (pizzanev, vevonev)
                $stmt = $pdo->prepare("INSERT INTO rendeles (pizzanev, darab, meret, vevonev) VALUES (?, ?, ?, ?)");
                
                $stmt->execute([
                    $data->pizza_nev, 
                    $data->darab,
                    $data->meret,
                    $data->vevo_nev
                ]);
    
                echo json_encode(["message" => "Sikeres hozzáadás"]);
            } else {
                // Ha hiányzik adat, küldjünk hibaüzenetet, hogy ne csak "csendben" álljon meg
                http_response_code(400);
                echo json_encode(["message" => "Hiányzó adatok!"]);
            }
            break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->id) && !empty($data->pizza_nev) && !empty($data->meret) && !empty($data->darab) && !empty($data->vevo_nev)) {
            $stmt = $pdo->prepare("UPDATE rendeles SET pizzanev = ?, darab = ?, meret = ?, vevonev = ? WHERE az = ?");
            $stmt->execute([
                $data->pizza_nev,
                $data->darab,
                $data->meret,
                $data->vevo_nev,
                $data->id
            ]);

            echo json_encode(["message" => "Sikeres módosítás"]);
        }
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->id)) {
            $stmt = $pdo->prepare("DELETE FROM rendeles WHERE az = ?");
            $stmt->execute([$data->id]);

            echo json_encode(["message" => "Sikeres törlés"]);
        }
        break;
}
?>