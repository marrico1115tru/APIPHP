<?php

class Solicitudes
{
    private $connect;
    private $table = 'solicitudes';

    public $id;
    public $usuario_id;
    public $descripcion;
    public $estado;
    public $fecha_creacion;

    public function __construct($db)
    {
        $this->connect = $db;
    }

    public function getAll()
    {
        $query = "SELECT * FROM " . $this->table;
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
        $query = "SELECT * FROM " . $this->table . " WHERE id = ?";
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
        $query = "INSERT INTO " . $this->table . " (usuario_id, descripcion, estado, fecha_creacion) VALUES (?, ?, ?, NOW())";
        $stmt = $this->connect->prepare($query);

        $stmt->bindParam(1, $this->usuario_id);
        $stmt->bindParam(2, $this->descripcion);
        $stmt->bindParam(3, $this->estado);

        if ($stmt->execute()) {
            return true;
        } else {
            $errors = $stmt->errorInfo();
            die("Error en la consulta SQL: " . $errors[2]);
        }
    }

    public function update($id)
    {
        $query = "UPDATE " . $this->table . " SET usuario_id = ?, descripcion = ?, estado = ? WHERE id = ?";
        $stmt = $this->connect->prepare($query);

        $stmt->bindParam(1, $this->usuario_id);
        $stmt->bindParam(2, $this->descripcion);
        $stmt->bindParam(3, $this->estado);
        $stmt->bindParam(4, $id);

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
