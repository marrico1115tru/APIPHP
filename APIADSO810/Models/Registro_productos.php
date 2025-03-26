<?php

class RegistroProductos
{
    private $connect;
    private $table = 'registro_productos';

    public $id;
    public $producto_id;
    public $cantidad;
    public $tipo_movimiento;
    public $fecha_registro;

    public function __construct($db)
    {
        $this->connect = $db;
    }

    public function getAll()
    {
        $query = "SELECT rp.*, p.nombre AS producto_nombre 
                  FROM " . $this->table . " rp
                  JOIN productos p ON rp.producto_id = p.id";
        $stmt = $this->connect->prepare($query);

        if ($stmt->execute()) {
            return $stmt;
        } else {
            $errors = $stmt->errorInfo();
            die("Error en la consulta SQL: " . $errors[2]);
        }
    }

    public function getById($id)
    {
        $query = "SELECT rp.*, p.nombre AS producto_nombre 
                  FROM " . $this->table . " rp
                  JOIN productos p ON rp.producto_id = p.id 
                  WHERE rp.id = ?";
        $stmt = $this->connect->prepare($query);
        $stmt->bindParam(1, $id);

        if ($stmt->execute()) {
            return $stmt;
        } else {
            $errors = $stmt->errorInfo();
            die("Error en la consulta SQL: " . $errors[2]);
        }
    }

    public function create()
    {
        $query = "INSERT INTO " . $this->table . " (producto_id, cantidad, tipo_movimiento, fecha_registro) 
                  VALUES (?, ?, ?, NOW())";
        $stmt = $this->connect->prepare($query);

        $stmt->bindParam(1, $this->producto_id);
        $stmt->bindParam(2, $this->cantidad);
        $stmt->bindParam(3, $this->tipo_movimiento);

        if ($stmt->execute()) {
            return true;
        } else {
            $errors = $stmt->errorInfo();
            die("Error en la consulta SQL: " . $errors[2]);
        }
    }

    public function delete($id)
    {
        $query = "DELETE FROM " . $this->table . " WHERE id = ?";
        $stmt = $this->connect->prepare($query);
        $stmt->bindParam(1, $id);

        if ($stmt->execute()) {
            return true;
        } else {
            $errors = $stmt->errorInfo();
            die("Error en la consulta SQL: " . $errors[2]);
        }
    }
}
