<?php
require_once('Config/Database.php');
require_once('Models/AreaCentroFormacion.php');

class AreaCentroFormacionController
{
    private $db;
    private $areaCentroFormacion;

    public function __construct()
    {
        $database = new Database();
        $this->db = $database->getConnection();
        $this->areaCentroFormacion = new AreaCentroFormacion($this->db);
    }

    public function getAll()
    {
        $stmt = $this->areaCentroFormacion->getAll();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode([
            'Estatus' => 'Code 200',
            'data' => $result
        ]);
    }

    public function getById($id)
    {
        $stmt = $this->areaCentroFormacion->getById($id);
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

        $this->areaCentroFormacion->area_id = $postData->area_id;
        $this->areaCentroFormacion->centro_formacion_id = $postData->centro_formacion_id;

        $created = $this->areaCentroFormacion->create();

        echo json_encode([
            'Estatus' => 'Code 201',
            'created' => $created
        ]);
    }

    public function update($id)
    {
        $putData = json_decode(file_get_contents("php://input"));

        $this->areaCentroFormacion->area_id = $putData->area_id;
        $this->areaCentroFormacion->centro_formacion_id = $putData->centro_formacion_id;

        $updated = $this->areaCentroFormacion->update($id);

        echo json_encode([
            'Estatus' => 'Code 200',
            'updated' => $updated
        ]);
    }

    public function delete($id)
    {
        $deleted = $this->areaCentroFormacion->delete($id);
        echo json_encode([
            'Estatus' => 'Code 200',
            'deleted' => $deleted
        ]);
    }
}
