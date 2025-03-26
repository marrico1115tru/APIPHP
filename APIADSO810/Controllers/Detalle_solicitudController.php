<?php
require_once('Config/Database.php');
require_once('Models/DetalleSolicitud.php');

class DetalleSolicitudController
{
    private $db;
    private $detalleSolicitud;

    public function __construct()
    {
        $database = new Database();
        $this->db = $database->getConnection();
        $this->detalleSolicitud = new DetalleSolicitud($this->db);
    }

    public function getAll()
    {
        $stmt = $this->detalleSolicitud->getAll();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode([
            'Estatus' => 'Code 200',
            'data' => $result
        ]);
    }

    public function getById($id)
    {
        $stmt = $this->detalleSolicitud->getById($id);
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

        $this->detalleSolicitud->solicitud_id = $postData->solicitud_id;
        $this->detalleSolicitud->material_id = $postData->material_id;
        $this->detalleSolicitud->cantidad_solicitada = $postData->cantidad_solicitada;
        $this->detalleSolicitud->cantidad_aprobada = $postData->cantidad_aprobada;
        $this->detalleSolicitud->estado = $postData->estado;

        $created = $this->detalleSolicitud->create();

        echo json_encode([
            'Estatus' => 'Code 201',
            'created' => $created
        ]);
    }

    public function update($id)
    {
        $putData = json_decode(file_get_contents("php://input"));

        $this->detalleSolicitud->solicitud_id = $putData->solicitud_id;
        $this->detalleSolicitud->material_id = $putData->material_id;
        $this->detalleSolicitud->cantidad_solicitada = $putData->cantidad_solicitada;
        $this->detalleSolicitud->cantidad_aprobada = $putData->cantidad_aprobada;
        $this->detalleSolicitud->estado = $putData->estado;

        $updated = $this->detalleSolicitud->update($id);

        echo json_encode([
            'Estatus' => 'Code 200',
            'updated' => $updated
        ]);
    }

    public function delete($id)
    {
        $deleted = $this->detalleSolicitud->delete($id);
        echo json_encode([
            'Estatus' => 'Code 200',
            'deleted' => $deleted
        ]);
    }
}
