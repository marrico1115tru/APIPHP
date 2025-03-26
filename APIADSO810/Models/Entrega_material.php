<?php

class EntregaMaterial
{
    private $connect;
    private $table = 'entrega_material';

    public $id;
    public $usuario_id;
    public $material_id;
    public $cantidad;
    public $fecha_entrega;
    public $observaciones;

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
        $query = "INSERT INTO " . $this->table . " (usuario_id, material_id, cantidad, fecha_entrega, observaciones) VALUES (?, ?, ?, NOW(), ?)";
        $stmt = $this->connect->prepare($query);

        $stmt->bindParam(1, $this->usuario_id);
        $stmt->bindParam(2, $this->material_id);
        $stmt->bindParam(3, $this->cantidad);
        $stmt->bindParam(4, $this->observaciones);

        return $stmt->execute();
    }

    public function update($id)
    {
        $query = "UPDATE " . $this->table . " SET usuario_id = ?, material_id = ?, cantidad = ?, observaciones = ? WHERE id = ?";
        $stmt = $this->connect->prepare($query);

        $stmt->bindParam(1, $this->usuario_id);
        $stmt->bindParam(2, $this->material_id);
        $stmt->bindParam(3, $this->cantidad);
        $stmt->bindParam(4, $this->observaciones);
        $stmt->bindParam(5, $id);

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
