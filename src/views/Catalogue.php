<?php include 'partials/header.php'; ?>
<main>
    <article>
        <h1>Bienvenue sur notre catalogue de produits</h1>
        <p>Découvrez notre large sélection de livres pour tous les goûts. Que vous soyez amateur de romans, de science-fiction, de biographies ou de livres pour enfants, vous trouverez votre bonheur ici.</p>
    </article>
    <form method="POST" action="/Catalogue">
        <input type="hidden" name="csrf_token" value="<?= htmlspecialchars($_SESSION['csrf_token']) ?>">
        <ul>
            <?php foreach ($products as $product): ?>
                <li>
                    <h3><?= htmlspecialchars($product['name']) ?></h3>
                    <p><?= htmlspecialchars($product['description']) ?></p>
                    <p>Prix : <?= htmlspecialchars($product['price']) ?> €</p>
                </li>
            <?php endforeach; ?>
        </ul>
    </form>
</main>
<?php include 'partials/footer.php'; ?>