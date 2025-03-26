<?php
require_once('Config/Database.php');
require_once('Models/Bodega.php');

class BodegaController
{
    private $db;
    private $bodega;

    public function __construct()
    {
        $database = new Database();
        $this->db = $database->getConnection();
        $this->bodega = new Bodega($this->db);
    }

    public function getAll()
    {
        $stmt = $this->bodega->getAll();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode([
            'Estatus' => 'Code 200',
            'data' => $result
        ]);
    }

    public function getById($id)
    {
        $stmt = $this->bodega->getById($id);
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

        $this->bodega->nombre = $postData->nombre;
        $this->bodega->ubicacion = $postData->ubicacion;

        $created = $this->bodega->create();

        echo json_encode([
            'Estatus' => 'Code 201',
            'created' => $created
        ]);
    }

    public function update($id)
    {
        $putData = json_decode(file_get_contents("php://input"));

        $this->bodega->nombre = $putData->nombre;
        $this->bodega->ubicacion = $putData->ubicacion;
        

        $updated = $this->bodega->update($id);

        echo json_encode([
            'Estatus' => 'Code 200',
            'updated' => $updated
        ]);
    }

    public function delete($id)
    {
        $deleted = $this->bodega->delete($id);
        echo json_encode([
            'Estatus' => 'Code 200',
            'deleted' => $deleted
        ]);
    }
}
