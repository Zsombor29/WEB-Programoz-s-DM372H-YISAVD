<?php
// Basic API initialization
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type');

// Example response
echo json_encode(['status' => 'success', 'message' => 'API initialized']);
?>