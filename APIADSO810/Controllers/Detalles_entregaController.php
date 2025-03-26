<?php
require_once('Config/Database.php');
require_once('Models/DetallesEntrega.php');

class DetallesEntregaController
{
    private $db;
    private $detallesEntrega;

    public function __construct()
    {
        $database = new Database();
        $this->db = $database->getConnection();
        $this->detallesEntrega = new DetallesEntrega($this->db);
    }

    public function getAll()
    {
        $stmt = $this->detallesEntrega->getAll();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode([
            'Estatus' => 'Code 200',
            'data' => $result
        ]);
    }

    public function getById($id)
    {
        $stmt = $this->detallesEntrega->getById($id);
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

        $this->detallesEntrega->entrega_id = $postData->entrega_id;
        $this->detallesEntrega->material_id = $postData->material_id;
        $this->detallesEntrega->cantidad = $postData->cantidad;
        $this->detallesEntrega->observaciones = $postData->observaciones;

        $created = $this->detallesEntrega->create();

        echo json_encode([
            'Estatus' => 'Code 201',
            'created' => $created
        ]);
    }

    public function update($id)
    {
        $putData = json_decode(file_get_contents("php://input"));

        $this->detallesEntrega->entrega_id = $putData->entrega_id;
        $this->detallesEntrega->material_id = $putData->material_id;
        $this->detallesEntrega->cantidad = $putData->cantidad;
        $this->detallesEntrega->observaciones = $putData->observaciones;

        $updated = $this->detallesEntrega->update($id);

        echo json_encode([
            'Estatus' => 'Code 200',
            'updated' => $updated
        ]);
    }

    public function delete($id)
    {
        $deleted = $this->detallesEntrega->delete($id);
        echo json_encode([
            'Estatus' => 'Code 200',
            'deleted' => $deleted
        ]);
    }
}
