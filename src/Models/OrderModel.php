<?php

namespace Models;

use PDO;

class OrderModel
{
    private PDO $connection;

    public function __construct(PDO $connection)
    {
        $this->connection = $connection;
    }

    public function addNewOrder(int $userId, int $productId, int $quantity): bool
    {
        $sql = "INSERT INTO orders (user_id, product_id, quantity, created_at) 
                VALUES (:userId, :productId, :quantity, NOW())";

        $statement = $this->connection->prepare($sql);

        return $statement->execute([
            ':userId' => $userId,
            ':productId' => $productId,
            ':quantity' => $quantity,
        ]);
    }

    public function fetchUserOrders(int $userId): array
    {
        $sql = "SELECT * FROM orders WHERE user_id = :userId";

        $statement = $this->connection->prepare($sql);
        $statement->execute([':userId' => $userId]);

        return $statement->fetchAll(PDO::FETCH_ASSOC);
    }
}
