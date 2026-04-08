<?php
require_once 'kapcsolat.php';
header("Content-Type: application/json; charset=UTF-8");

$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {

    case 'GET':
        $stmt = $pdo->query("SELECT * FROM rendelesek ORDER BY id DESC");
        $rendelesek = $stmt->fetchAll();
        echo json_encode($rendelesek);
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->pizza_nev) && !empty($data->meret) && !empty($data->darab) && !empty($data->vevo_nev)) {
            $stmt = $pdo->prepare("INSERT INTO rendelesek (pizza_nev, darab, meret, vevo_nev) VALUES (?, ?, ?, ?)");
            $stmt->execute([
                $data->pizza_nev,
                $data->darab,
                $data->meret,
                $data->vevo_nev
            ]);

            echo json_encode(["message" => "Sikeres hozzáadás"]);
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->id) && !empty($data->pizza_nev) && !empty($data->meret) && !empty($data->darab) && !empty($data->vevo_nev)) {
            $stmt = $pdo->prepare("UPDATE rendelesek SET pizza_nev = ?, darab = ?, meret = ?, vevo_nev = ? WHERE id = ?");
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
            $stmt = $pdo->prepare("DELETE FROM rendelesek WHERE id = ?");
            $stmt->execute([$data->id]);

            echo json_encode(["message" => "Sikeres törlés"]);
        }
        break;
}
?>