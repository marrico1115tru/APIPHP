<?php
require_once('Config/Database.php');
require_once('Models/Productos.php');

class ProductosController
{
    private $db;
    private $productos;

    public function __construct()
    {
        $database = new Database();
        $this->db = $database->getConnection();
        $this->productos = new Productos($this->db);
    }

    public function getAll()
    {
        $stmt = $this->productos->getAll();
        $productos = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode([
            'Estatus' => 'Code 200',
            'productos' => $productos
        ]);
    }

    public function getById($id)
    {
        $stmt = $this->productos->getById($id);
        $producto = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$producto) {
            echo json_encode([
                'Estatus' => 'Code 404',
                'message' => 'Producto no encontrado'
            ]);
        } else {
            echo json_encode([
                'Estatus' => 'Code 200',
                'producto' => $producto
            ]);
        }
    }

    public function create()
    {
        $postData = json_decode(file_get_contents("php://input"));

        $this->productos->nombre = $postData->nombre;
        $this->productos->descripcion = $postData->descripcion;
        $this->productos->precio = $postData->precio;
        $this->productos->stock = $postData->stock;

        $created = $this->productos->create();

        echo json_encode([
            'Estatus' => 'Code 201',
            'created' => $created
        ]);
    }

    public function update($id)
    {
        $putData = json_decode(file_get_contents("php://input"));

        $this->productos->nombre = $putData->nombre;
        $this->productos->descripcion = $putData->descripcion;
        $this->productos->precio = $putData->precio;
        $this->productos->stock = $putData->stock;

        $updated = $this->productos->update($id);

        echo json_encode([
            'Estatus' => 'Code 200',
            'updated' => $updated
        ]);
    }

    public function delete($id)
    {
        $deleted = $this->productos->delete($id);
        echo json_encode([
            'Estatus' => 'Code 200',
            'deleted' => $deleted
        ]);
    }
}
