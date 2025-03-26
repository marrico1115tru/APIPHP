<?php

class UsuariosCentrosFormacion
{
    private $connect;
    private $table = 'usuarios_centros_formacion';

    public $id;
    public $usuario_id;
    public $centro_formacion_id;
    public $fecha_asignacion;

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
        $query = "INSERT INTO " . $this->table . " (usuario_id, centro_formacion_id, fecha_asignacion) VALUES (?, ?, NOW())";
        $stmt = $this->connect->prepare($query);

        $stmt->bindParam(1, $this->usuario_id);
        $stmt->bindParam(2, $this->centro_formacion_id);

        return $stmt->execute();
    }

    public function update($id)
    {
        $query = "UPDATE " . $this->table . " SET usuario_id = ?, centro_formacion_id = ? WHERE id = ?";
        $stmt = $this->connect->prepare($query);

        $stmt->bindParam(1, $this->usuario_id);
        $stmt->bindParam(2, $this->centro_formacion_id);
        $stmt->bindParam(3, $id);

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

