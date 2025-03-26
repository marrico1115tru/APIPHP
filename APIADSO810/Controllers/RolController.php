<?php
require_once('Config/Database.php');
require_once('Models/Rol.php');

class RolController
{
    private $db;
    private $rol;

    public function __construct()
    {
        $database = new Database();
        $this->db = $database->getConnection();
        $this->rol = new Rol($this->db);
    }

    public function getAll()
    {
        $stmt = $this->rol->getAll();
        $roles = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode([
            'Estatus' => 'Code 200',
            'roles' => $roles
        ]);
    }

    public function getById($id)
    {
        $stmt = $this->rol->getById($id);
        $rol = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$rol) {
            echo json_encode([
                'Estatus' => 'Code 404',
                'message' => 'Rol no encontrado'
            ]);
        } else {
            echo json_encode([
                'Estatus' => 'Code 200',
                'rol' => $rol
            ]);
        }
    }

    public function create()
    {
        $postData = json_decode(file_get_contents("php://input"));

        $this->rol->nombre_rol = $postData->nombre_rol;

        $created = $this->rol->create();

        echo json_encode([
            'Estatus' => 'Code 201',
            'created' => $created
        ]);
    }

    public function update($id)
    {
        $putData = json_decode(file_get_contents("php://input"));

        $this->rol->nombre_rol = $putData->nombre_rol;

        $updated = $this->rol->update($id);

        echo json_encode([
            'Estatus' => 'Code 200',
            'updated' => $updated
        ]);
    }

    public function delete($id)
    {
        $deleted = $this->rol->delete($id);
        echo json_encode([
            'Estatus' => 'Code 200',
            'deleted' => $deleted
        ]);
    }
}

