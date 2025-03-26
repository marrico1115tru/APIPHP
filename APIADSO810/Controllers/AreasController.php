<?php
require_once('Config/Database.php');
require_once('Models/Areas.php');

class AreasController
{
    private $db;
    private $area;

    public function __construct()
    {
        $database = new Database();
        $this->db = $database->getConnection();
        $this->area = new Area($this->db);
    }

    public function getAll()
    {
        $stmt = $this->area->getAll();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode([
            'Estatus' => 'Code 200',
            'data' => $result
        ]);
    }

    public function getById($id)
    {
        $stmt = $this->area->getById($id);
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

        $this->area->nombre_area = $postData->nombre_area;
        $this->area->id_centro_formacion = $postData->id_centro_formacion;

        $created = $this->area->create();

        echo json_encode([
            'Estatus' => 'Code 201',
            'created' => $created
        ]);
    }

    public function update($id)
    {
        $putData = json_decode(file_get_contents("php://input"));

        $this->area->nombre_area = $putData->nombre_area;
        $this->area->id_centro_formacion = $putData->id_centro_formacion;

        $updated = $this->area->update($id);

        echo json_encode([
            'Estatus' => 'Code 200',
            'updated' => $updated
        ]);
    }

    public function delete($id)
    {
        $deleted = $this->area->delete($id);
        echo json_encode([
            'Estatus' => 'Code 200',
            'deleted' => $deleted
        ]);
    }
}
