<?php

namespace Models;

require_once __DIR__ . '/../utils/Database.php';

use PDO;

class ProductModel
{
    private PDO $connection;

    public function __construct(PDO $connection)
    {
        $this->connection = $connection;
    }

    public function fetchAllProducts(): array
    {
        $sql = "SELECT * FROM product";
        $statement = $this->connection->query($sql);
        return $statement->fetchAll(PDO::FETCH_ASSOC);
    }

    public function fetchProductById(int $id): ?array
    {
        $sql = "SELECT * FROM product WHERE id = :id";
        $statement = $this->connection->prepare($sql);
        $statement->execute([':id' => $id]);

        $product = $statement->fetch(PDO::FETCH_ASSOC);
        return $product ?: null;
    }
}
