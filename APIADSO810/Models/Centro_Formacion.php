<?php

class CentroFormacion
{
    private $connect;
    private $table = 'centro_formacion';

    public $id;
    public $nombre;
    public $direccion;
    public $telefono;
    public $email;
    public $ciudad;

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
        $query = "INSERT INTO " . $this->table . " (nombre, direccion, telefono, email, ciudad) 
                  VALUES (?, ?, ?, ?, ?)";
        $stmt = $this->connect->prepare($query);

        $stmt->bindParam(1, $this->nombre);
        $stmt->bindParam(2, $this->direccion);
        $stmt->bindParam(3, $this->telefono);
        $stmt->bindParam(4, $this->email);
        $stmt->bindParam(5, $this->ciudad);

        return $stmt->execute();
    }

    public function update($id)
    {
        $query = "UPDATE " . $this->table . " SET nombre = ?, direccion = ?, telefono = ?, email = ?, ciudad = ? 
                  WHERE id = ?";
        $stmt = $this->connect->prepare($query);

        $stmt->bindParam(1, $this->nombre);
        $stmt->bindParam(2, $this->direccion);
        $stmt->bindParam(3, $this->telefono);
        $stmt->bindParam(4, $this->email);
        $stmt->bindParam(5, $this->ciudad);
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
