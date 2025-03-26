<?php
require_once('Config/Database.php');
require_once('Models/Usuarios.php');

class UsuariosController
{
    private $db;
    private $usuarios;

    public function __construct()
    {
        $database = new Database();
        $this->db = $database->getConnection();
        $this->usuarios = new Usuarios($this->db);
    }

    public function getAll()
    {
        $stmt = $this->usuarios->getAll();
        $usuarios = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode([
            'Estatus' => 'Code 200',
            'usuarios' => $usuarios
        ]);
    }

    public function getById($id)
    {
        $stmt = $this->usuarios->getById($id);
        $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$usuario) {
            echo json_encode([
                'Estatus' => 'Code 404',
                'message' => 'Usuario no encontrado'
            ]);
        } else {
            echo json_encode([
                'Estatus' => 'Code 200',
                'usuario' => $usuario
            ]);
        }
    }

    public function create()
    {
        $postData = json_decode(file_get_contents("php://input"));

        $this->usuarios->nombre = $postData->nombre;
        $this->usuarios->email = $postData->email;
        $this->usuarios->password = $postData->password;
        $this->usuarios->rol_id = $postData->rol_id;

        $created = $this->usuarios->create();

        echo json_encode([
            'Estatus' => 'Code 201',
            'created' => $created
        ]);
    }

    public function update($id)
    {
        $putData = json_decode(file_get_contents("php://input"));

        $this->usuarios->nombre = $putData->nombre;
        $this->usuarios->email = $putData->email;
        $this->usuarios->password = $putData->password;
        $this->usuarios->rol_id = $putData->rol_id;

        $updated = $this->usuarios->update($id);

        echo json_encode([
            'Estatus' => 'Code 200',
            'updated' => $updated
        ]);
    }

    public function delete($id)
    {
        $deleted = $this->usuarios->delete($id);
        echo json_encode([
            'Estatus' => 'Code 200',
            'deleted' => $deleted
        ]);
    }
}
