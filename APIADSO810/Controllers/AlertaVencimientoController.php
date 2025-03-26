<?php
require_once('Config/Database.php');
require_once('Models/AlertaVencimiento.php');

class AlertaVencimientoController
{
    private $db;
    private $alertaVencimiento;

    public function __construct()
    {
        $database = new Database();
        $this->db = $database->getConnection();
        $this->alertaVencimiento = new AlertaVencimiento($this->db);
    }

    public function getAll()
    {
        $stmt = $this->alertaVencimiento->getAll();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode([
            'Estatus' => 'Code 200',
            'data' => $result
        ]);
    }

    public function getById($id)
    {
        $stmt = $this->alertaVencimiento->getById($id);
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

        $this->alertaVencimiento->producto_id = $postData->producto_id;
        $this->alertaVencimiento->fecha_vencimiento = $postData->fecha_vencimiento;
        $this->alertaVencimiento->estado = $postData->estado;

        $created = $this->alertaVencimiento->create();

        echo json_encode([
            'Estatus' => 'Code 201',
            'created' => $created
        ]);
    }

    public function update($id)
    {
        $putData = json_decode(file_get_contents("php://input"));

        $this->alertaVencimiento->producto_id = $putData->producto_id;
        $this->alertaVencimiento->fecha_vencimiento = $putData->fecha_vencimiento;
        $this->alertaVencimiento->estado = $putData->estado;

        $updated = $this->alertaVencimiento->update($id);

        echo json_encode([
            'Estatus' => 'Code 200',
            'updated' => $updated
        ]);
    }

    public function delete($id)
    {
        $deleted = $this->alertaVencimiento->delete($id);
        echo json_encode([
            'Estatus' => 'Code 200',
            'deleted' => $deleted
        ]);
    }
}
