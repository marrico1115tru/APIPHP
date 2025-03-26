<?php
require_once('Config/Database.php');
require_once('Models/Accesos.php');

class AccesosController
{
    private $db;
    private $acceso;

    public function __construct()
    {
        $database = new Database();
        $this->db = $database->getConnection();
        $this->acceso = new Acceso($this->db);
    }

    public function getAll()
    {
        $stmt = $this->acceso->getAll();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode([
            'Estatus' => 'Code 200',
            'data' => $result
        ]);
    }

    public function getById($id)
    {
        $stmt = $this->acceso->getById($id);
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

        $this->acceso->id_rol = $postData->id_rol;
        $this->acceso->id_opcion = $postData->id_opcion;
        $created = $this->acceso->create();

        echo json_encode([
            'Estatus' => 'Code 201',
            'created' => $created
        ]);
    }

    public function update($id)
    {
        $putData = json_decode(file_get_contents("php://input"));

        $this->acceso->id_rol = $putData->id_rol;
        $this->acceso->id_opcion = $putData->id_opcion;

        $updated = $this->acceso->update($id);

        echo json_encode([
            'Estatus' => 'Code 200',
            'updated' => $updated
        ]);
    }

    public function delete($id)
    {
        $deleted = $this->acceso->delete($id);
        echo json_encode([
            'Estatus' => 'Code 200',
            'deleted' => $deleted
        ]);
    }
}
