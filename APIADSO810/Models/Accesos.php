<?php

class Acceso
{
    private $connect;
    private $table = 'accesos';

    public $id;
    public $usuario_id;
    public $fecha_acceso;
    public $ip_acceso;
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
        $query = "INSERT INTO " . $this->table . " (id_rol, id_opcion) VALUES (?, ?)";
        $stmt = $this->connect->prepare($query);

        $stmt->bindParam(1, $this->id_rol);
        $stmt->bindParam(2, $this->id_opcion);

        return $stmt->execute();
    }

    public function update($id)
    {
        $query = "UPDATE " . $this->table . " SET usuario_id = ?, fecha_acceso = ?, ip_acceso = ?, estado = ? WHERE id = ?";
        $stmt = $this->connect->prepare($query);

        $stmt->bindParam(1, $this->id_opcion);
        $stmt->bindParam(2, $this->id_rol);
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
