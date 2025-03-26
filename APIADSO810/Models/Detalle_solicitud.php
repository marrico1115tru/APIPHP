<?php

class DetalleSolicitud
{
    private $connect;
    private $table = 'detalle_solicitud';

    public $id;
    public $solicitud_id;
    public $material_id;
    public $cantidad_solicitada;
    public $cantidad_aprobada;
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
        $query = "INSERT INTO " . $this->table . " (solicitud_id, material_id, cantidad_solicitada, cantidad_aprobada, estado) 
                  VALUES (?, ?, ?, ?, ?)";
        $stmt = $this->connect->prepare($query);

        $stmt->bindParam(1, $this->solicitud_id);
        $stmt->bindParam(2, $this->material_id);
        $stmt->bindParam(3, $this->cantidad_solicitada);
        $stmt->bindParam(4, $this->cantidad_aprobada);
        $stmt->bindParam(5, $this->estado);

        return $stmt->execute();
    }

    public function update($id)
    {
        $query = "UPDATE " . $this->table . " SET solicitud_id = ?, material_id = ?, cantidad_solicitada = ?, cantidad_aprobada = ?, estado = ? 
                  WHERE id = ?";
        $stmt = $this->connect->prepare($query);

        $stmt->bindParam(1, $this->solicitud_id);
        $stmt->bindParam(2, $this->material_id);
        $stmt->bindParam(3, $this->cantidad_solicitada);
        $stmt->bindParam(4, $this->cantidad_aprobada);
        $stmt->bindParam(5, $this->estado);
        $stmt->bindParam(6, $id);

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
