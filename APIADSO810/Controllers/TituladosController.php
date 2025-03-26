<?php
require_once('Config/Database.php');
require_once('Models/Titulados.php');

class TituladosController
{
    private $db;
    private $titulados;

    public function __construct()
    {
        $database = new Database();
        $this->db = $database->getConnection();
        $this->titulados = new Titulados($this->db);
    }

    public function getAll()
    {
        $stmt = $this->titulados->getAll();
        $titulados = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode([
            'Estatus' => 'Code 200',
            'titulados' => $titulados
        ]);
    }

    public function getById($id)
    {
        $stmt = $this->titulados->getById($id);
        $titulado = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$titulado) {
            echo json_encode([
                'Estatus' => 'Code 404',
                'message' => 'Titulado no encontrado'
            ]);
        } else {
            echo json_encode([
                'Estatus' => 'Code 200',
                'titulado' => $titulado
            ]);
        }
    }

    public function create()
    {
        $postData = json_decode(file_get_contents("php://input"));

        $this->titulados->usuario_id = $postData->usuario_id;
        $this->titulados->titulo_obtenido = $postData->titulo_obtenido;
        $this->titulados->institucion = $postData->institucion;
        $this->titulados->fecha_graduacion = $postData->fecha_graduacion;

        $created = $this->titulados->create();

        echo json_encode([
            'Estatus' => 'Code 201',
            'created' => $created
        ]);
    }

    public function update($id)
    {
        $putData = json_decode(file_get_contents("php://input"));

        $this->titulados->usuario_id = $putData->usuario_id;
        $this->titulados->titulo_obtenido = $putData->titulo_obtenido;
        $this->titulados->institucion = $putData->institucion;
        $this->titulados->fecha_graduacion = $putData->fecha_graduacion;

        $updated = $this->titulados->update($id);

        echo json_encode([
            'Estatus' => 'Code 200',
            'updated' => $updated
        ]);
    }

    public function delete($id)
    {
        $deleted = $this->titulados->delete($id);
        echo json_encode([
            'Estatus' => 'Code 200',
            'deleted' => $deleted
        ]);
    }
}
