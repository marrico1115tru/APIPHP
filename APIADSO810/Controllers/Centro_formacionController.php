<?php
require_once('Config/Database.php');
require_once('Models/CentroFormacion.php');

class CentroFormacionController
{
    private $db;
    private $centroFormacion;

    public function __construct()
    {
        $database = new Database();
        $this->db = $database->getConnection();
        $this->centroFormacion = new CentroFormacion($this->db);
    }

    public function getAll()
    {
        $stmt = $this->centroFormacion->getAll();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode([
            'Estatus' => 'Code 200',
            'data' => $result
        ]);
    }

    public function getById($id)
    {
        $stmt = $this->centroFormacion->getById($id);
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

        $this->centroFormacion->nombre = $postData->nombre;
        $this->centroFormacion->direccion = $postData->direccion;
        $this->centroFormacion->telefono = $postData->telefono;
        $this->centroFormacion->email = $postData->email;
        $this->centroFormacion->ciudad = $postData->ciudad;

        $created = $this->centroFormacion->create();

        echo json_encode([
            'Estatus' => 'Code 201',
            'created' => $created
        ]);
    }

    public function update($id)
    {
        $putData = json_decode(file_get_contents("php://input"));

        $this->centroFormacion->nombre = $putData->nombre;
        $this->centroFormacion->direccion = $putData->direccion;
        $this->centroFormacion->telefono = $putData->telefono;
        $this->centroFormacion->email = $putData->email;
        $this->centroFormacion->ciudad = $putData->ciudad;

        $updated = $this->centroFormacion->update($id);

        echo json_encode([
            'Estatus' => 'Code 200',
            'updated' => $updated
        ]);
    }

    public function delete($id)
    {
        $deleted = $this->centroFormacion->delete($id);
        echo json_encode([
            'Estatus' => 'Code 200',
            'deleted' => $deleted
        ]);
    }
}
