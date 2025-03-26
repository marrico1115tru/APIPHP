<?php
require_once('Config/Database.php');
require_once('Models/Solicitudes.php');

class SolicitudesController
{
    private $db;
    private $solicitudes;

    public function __construct()
    {
        $database = new Database();
        $this->db = $database->getConnection();
        $this->solicitudes = new Solicitudes($this->db);
    }

    public function getAll()
    {
        $stmt = $this->solicitudes->getAll();
        $solicitudes = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode([
            'Estatus' => 'Code 200',
            'solicitudes' => $solicitudes
        ]);
    }

    public function getById($id)
    {
        $stmt = $this->solicitudes->getById($id);
        $solicitud = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$solicitud) {
            echo json_encode([
                'Estatus' => 'Code 404',
                'message' => 'Solicitud no encontrada'
            ]);
        } else {
            echo json_encode([
                'Estatus' => 'Code 200',
                'solicitud' => $solicitud
            ]);
        }
    }

    public function create()
    {
        $postData = json_decode(file_get_contents("php://input"));

        $this->solicitudes->usuario_id = $postData->usuario_id;
        $this->solicitudes->descripcion = $postData->descripcion;
        $this->solicitudes->estado = $postData->estado;

        $created = $this->solicitudes->create();

        echo json_encode([
            'Estatus' => 'Code 201',
            'created' => $created
        ]);
    }

    public function update($id)
    {
        $putData = json_decode(file_get_contents("php://input"));

        $this->solicitudes->usuario_id = $putData->usuario_id;
        $this->solicitudes->descripcion = $putData->descripcion;
        $this->solicitudes->estado = $putData->estado;

        $updated = $this->solicitudes->update($id);

        echo json_encode([
            'Estatus' => 'Code 200',
            'updated' => $updated
        ]);
    }

    public function delete($id)
    {
        $deleted = $this->solicitudes->delete($id);
        echo json_encode([
            'Estatus' => 'Code 200',
            'deleted' => $deleted
        ]);
    }
}
