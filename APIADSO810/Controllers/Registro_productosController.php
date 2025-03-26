<?php
require_once('Config/Database.php');
require_once('Models/RegistroProductos.php');

class RegistroProductosController
{
    private $db;
    private $registroProductos;

    public function __construct()
    {
        $database = new Database();
        $this->db = $database->getConnection();
        $this->registroProductos = new RegistroProductos($this->db);
    }

    public function getAll()
    {
        $stmt = $this->registroProductos->getAll();
        $registros = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode([
            'Estatus' => 'Code 200',
            'registro_productos' => $registros
        ]);
    }

    public function getById($id)
    {
        $stmt = $this->registroProductos->getById($id);
        $registro = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$registro) {
            echo json_encode([
                'Estatus' => 'Code 404',
                'message' => 'Registro no encontrado'
            ]);
        } else {
            echo json_encode([
                'Estatus' => 'Code 200',
                'registro' => $registro
            ]);
        }
    }

    public function create()
    {
        $postData = json_decode(file_get_contents("php://input"));

        $this->registroProductos->producto_id = $postData->producto_id;
        $this->registroProductos->cantidad = $postData->cantidad;
        $this->registroProductos->tipo_movimiento = $postData->tipo_movimiento;

        $created = $this->registroProductos->create();

        echo json_encode([
            'Estatus' => 'Code 201',
            'created' => $created
        ]);
    }

    public function delete($id)
    {
        $deleted = $this->registroProductos->delete($id);
        echo json_encode([
            'Estatus' => 'Code 200',
            'deleted' => $deleted
        ]);
    }
}
