<?php

class AlertaVencimiento
{
    private $connect;
    private $table = 'alertavencimiento';

    public $id;
    public $producto_id;
    public $fecha_vencimiento;
    public $estado;

    public function __construct($db)
    {
        $this->connect = $db;
    }

    public function getAll()
    {
        $query = "SELECT * FROM " . $this->table;
        $stmt = $this->connect->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    public function getById($id)
    {
        $query = "SELECT * FROM " . $this->table . " WHERE id = ?";
        $stmt = $this->connect->prepare($query);
        $stmt->bindParam(1, $id);
        $stmt->execute();
        return $stmt;
    }

    public function create()
    {
        $query = "INSERT INTO " . $this->table . " (producto_id, fecha_vencimiento, estado) VALUES (?, ?, ?)";
        $stmt = $this->connect->prepare($query);

        $stmt->bindParam(1, $this->producto_id);
        $stmt->bindParam(2, $this->fecha_vencimiento);
        $stmt->bindParam(3, $this->estado);

        return $stmt->execute();
    }

    public function update($id)
    {
        $query = "UPDATE " . $this->table . " SET producto_id = ?, fecha_vencimiento = ?, estado = ? WHERE id = ?";
        $stmt = $this->connect->prepare($query);

        $stmt->bindParam(1, $this->producto_id);
        $stmt->bindParam(2, $this->fecha_vencimiento);
        $stmt->bindParam(3, $this->estado);
        $stmt->bindParam(4, $id);

        return $stmt->execute();
    }

    public function delete($id)
    {
        $query = "DELETE FROM " . $this->table . " WHERE id = ?";
        $stmt = $this->connect->prepare($query);
        $stmt->bindParam(1, $id);
        return $stmt->execute();
    }
}
