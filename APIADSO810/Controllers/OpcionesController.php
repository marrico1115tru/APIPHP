<?php
require_once('Config/Database.php');
require_once('Models/Opciones.php');

class OpcionesController
{
    private $db;
    private $opciones;

    public function __construct()
    {
        $database = new Database();
        $this->db = $database->getConnection();
        $this->opciones = new Opciones($this->db);
    }

    public function getAll()
    {
        $stmt = $this->opciones->getAll();
        $opciones = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode([
            'Estatus' => 'Code 200',
            'opciones' => $opciones
        ]);
    }

    public function getById($id)
    {
        $stmt = $this->opciones->getById($id);
        $opcion = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$opcion) {
            echo json_encode([
                'Estatus' => 'Code 404',
                'message' => 'Opción no encontrada'
            ]);
        } else {
            echo json_encode([
                'Estatus' => 'Code 200',
                'opcion' => $opcion
            ]);
        }
    }

    public function create()
    {
        $postData = json_decode(file_get_contents("php://input"));

        $this->opciones->nombre = $postData->nombre;

        $created = $this->opciones->create();

        echo json_encode([
            'Estatus' => 'Code 201',
            'created' => $created
        ]);
    }

    public function update($id)
    {
        $putData = json_decode(file_get_contents("php://input"));

        $this->opciones->nombre = $putData->nombre;

        $updated = $this->opciones->update($id);

        echo json_encode([
            'Estatus' => 'Code 200',
            'updated' => $updated
        ]);
    }

    public function delete($id)
    {
        $deleted = $this->opciones->delete($id);
        echo json_encode([
            'Estatus' => 'Code 200',
            'deleted' => $deleted
        ]);
    }
}
