<?php

class Usuarios
{
    private $connect;
    private $table = 'usuarios';

    public $id;
    public $nombre;
    public $email;
    public $password;
    public $rol_id;
    public $fecha_creacion;

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
        $query = "INSERT INTO " . $this->table . " (nombre, email, password, rol_id, fecha_creacion) VALUES (?, ?, ?, ?, NOW())";
        $stmt = $this->connect->prepare($query);

        $hashedPassword = password_hash($this->password, PASSWORD_BCRYPT);

        $stmt->bindParam(1, $this->nombre);
        $stmt->bindParam(2, $this->email);
        $stmt->bindParam(3, $hashedPassword);
        $stmt->bindParam(4, $this->rol_id);

        return $stmt->execute();
    }

    public function update($id)
    {
        $query = "UPDATE " . $this->table . " SET nombre = ?, email = ?, password = ?, rol_id = ? WHERE id = ?";
        $stmt = $this->connect->prepare($query);

        $hashedPassword = password_hash($this->password, PASSWORD_BCRYPT);

        $stmt->bindParam(1, $this->nombre);
        $stmt->bindParam(2, $this->email);
        $stmt->bindParam(3, $hashedPassword);
        $stmt->bindParam(4, $this->rol_id);
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
