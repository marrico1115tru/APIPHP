<?php
require_once('Config/Database.php');
require_once('Models/FichasFormacion.php');

class FichasFormacionController
{
    private $db;
    private $fichasFormacion;

    public function __construct()
    {
        $database = new Database();
        $this->db = $database->getConnection();
        $this->fichasFormacion = new FichasFormacion($this->db);
    }

    public function getAll()
    {
        $stmt = $this->fichasFormacion->getAll();
        $fichas = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode([
            'Estatus' => 'Code 200',
            'fichas' => $fichas
        ]);
    }

    public function getById($id)
    {
        $stmt = $this->fichasFormacion->getById($id);
        $ficha = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$ficha) {
            echo json_encode([
                'Estatus' => 'Code 404',
                'message' => 'Ficha de formación no encontrada'
            ]);
        } else {
            echo json_encode([
                'Estatus' => 'Code 200',
                'ficha' => $ficha
            ]);
        }
    }

    public function create()
    {
        $postData = json_decode(file_get_contents("php://input"));

        $this->fichasFormacion->nombre = $postData->nombre;
        $this->fichasFormacion->id_titulado = $postData->id_titulado;

        $created = $this->fichasFormacion->create();

        echo json_encode([
            'Estatus' => 'Code 201',
            'created' => $created
        ]);
    }

    public function update($id)
    {
        $putData = json_decode(file_get_contents("php://input"));

        $this->fichasFormacion->nombre = $putData->nombre;
        $this->fichasFormacion->id_titulado = $putData->id_titulado;

        $updated = $this->fichasFormacion->update($id);

        echo json_encode([
            'Estatus' => 'Code 200',
            'updated' => $updated
        ]);
    }

    public function delete($id)
    {
        $deleted = $this->fichasFormacion->delete($id);
        echo json_encode([
            'Estatus' => 'Code 200',
            'deleted' => $deleted
        ]);
    }
}