<?php
require_once('Config/Database.php');
require_once('Models/UsuariosCentrosFormacion.php');

class UsuariosCentrosFormacionController
{
    private $db;
    private $usuariosCentrosFormacion;

    public function __construct()
    {
        $database = new Database();
        $this->db = $database->getConnection();
        $this->usuariosCentrosFormacion = new UsuariosCentrosFormacion($this->db);
    }

    public function getAll()
    {
        $stmt = $this->usuariosCentrosFormacion->getAll();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode([
            'Estatus' => 'Code 200',
            'data' => $result
        ]);
    }

    public function getById($id)
    {
        $stmt = $this->usuariosCentrosFormacion->getById($id);
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

        $this->usuariosCentrosFormacion->usuario_id = $postData->usuario_id;
        $this->usuariosCentrosFormacion->centro_formacion_id = $postData->centro_formacion_id;

        $created = $this->usuariosCentrosFormacion->create();

        echo json_encode([
            'Estatus' => 'Code 201',
            'created' => $created
        ]);
    }

    public function update($id)
    {
        $putData = json_decode(file_get_contents("php://input"));

        $this->usuariosCentrosFormacion->usuario_id = $putData->usuario_id;
        $this->usuariosCentrosFormacion->centro_formacion_id = $putData->centro_formacion_id;

        $updated = $this->usuariosCentrosFormacion->update($id);

        echo json_encode([
            'Estatus' => 'Code 200',
            'updated' => $updated
        ]);
    }

    public function delete($id)
    {
        $deleted = $this->usuariosCentrosFormacion->delete($id);
        echo json_encode([
            'Estatus' => 'Code 200',
            'deleted' => $deleted
        ]);
    }
}
