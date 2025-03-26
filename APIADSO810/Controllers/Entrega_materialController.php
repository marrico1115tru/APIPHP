<?php
require_once('Config/Database.php');
require_once('Models/EntregaMaterial.php');

class EntregaMaterialController
{
    private $db;
    private $entregaMaterial;

    public function __construct()
    {
        $database = new Database();
        $this->db = $database->getConnection();
        $this->entregaMaterial = new EntregaMaterial($this->db);
    }

    public function getAll()
    {
        $stmt = $this->entregaMaterial->getAll();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode([
            'Estatus' => 'Code 200',
            'data' => $result
        ]);
    }

    public function getById($id)
    {
        $stmt = $this->entregaMaterial->getById($id);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$result) {
            echo json_encode([
                'Estatus' => 'Code 404',
                'message' => 'Registro no encontrado'
            ]);
        } else {
            echo json_encode([
                'Estatus' => 'Code 200',
                'data' => $result
            ]);
        }
    }

    public function create()
    {
        $postData = json_decode(file_get_contents("php://input"));

        $this->entregaMaterial->usuario_id = $postData->usuario_id;
        $this->entregaMaterial->material_id = $postData->material_id;
        $this->entregaMaterial->cantidad = $postData->cantidad;
        $this->entregaMaterial->observaciones = $postData->observaciones;

        $created = $this->entregaMaterial->create();

        echo json_encode([
            'Estatus' => 'Code 201',
            'created' => $created
        ]);
    }

    public function update($id)
    {
        $putData = json_decode(file_get_contents("php://input"));

        $this->entregaMaterial->usuario_id = $putData->usuario_id;
        $this->entregaMaterial->material_id = $putData->material_id;
        $this->entregaMaterial->cantidad = $putData->cantidad;
        $this->entregaMaterial->observaciones = $putData->observaciones;

        $updated = $this->entregaMaterial->update($id);

        echo json_encode([
            'Estatus' => 'Code 200',
            'updated' => $updated
        ]);
    }

    public function delete($id)
    {
        $deleted = $this->entregaMaterial->delete($id);
        echo json_encode([
            'Estatus' => 'Code 200',
            'deleted' => $deleted
        ]);
    }
}
