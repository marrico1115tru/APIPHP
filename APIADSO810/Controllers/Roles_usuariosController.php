<?php
require_once('Config/Database.php');
require_once('Models/RolesUsuarios.php');

class RolesUsuariosController
{
    private $db;
    private $rolesUsuarios;

    public function __construct()
    {
        $database = new Database();
        $this->db = $database->getConnection();
        $this->rolesUsuarios = new RolesUsuarios($this->db);
    }

    public function getAll()
    {
        $stmt = $this->rolesUsuarios->getAll();
        $rolesUsuarios = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode([
            'Estatus' => 'Code 200',
            'rolesUsuarios' => $rolesUsuarios
        ]);
    }

    public function getById($id)
    {
        $stmt = $this->rolesUsuarios->getById($id);
        $rolUsuario = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$rolUsuario) {
            echo json_encode([
                'Estatus' => 'Code 404',
                'message' => 'Registro no encontrado'
            ]);
        } else {
            echo json_encode([
                'Estatus' => 'Code 200',
                'rolUsuario' => $rolUsuario
            ]);
        }
    }

    public function create()
    {
        $postData = json_decode(file_get_contents("php://input"));

        $this->rolesUsuarios->usuario_id = $postData->usuario_id;
        $this->rolesUsuarios->rol_id = $postData->rol_id;

        $created = $this->rolesUsuarios->create();

        echo json_encode([
            'Estatus' => 'Code 201',
            'created' => $created
        ]);
    }

    public function update($id)
    {
        $putData = json_decode(file_get_contents("php://input"));

        $this->rolesUsuarios->usuario_id = $putData->usuario_id;
        $this->rolesUsuarios->rol_id = $putData->rol_id;

        $updated = $this->rolesUsuarios->update($id);

        echo json_encode([
            'Estatus' => 'Code 200',
            'updated' => $updated
        ]);
    }

    public function delete($id)
    {
        $deleted = $this->rolesUsuarios->delete($id);
        echo json_encode([
            'Estatus' => 'Code 200',
            'deleted' => $deleted
        ]);
    }
}
