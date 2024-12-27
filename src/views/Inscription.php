<?php include 'partials/header.php'; ?>
<main>
    <article>
        <h1>Inscription</h1>
    </article>
    <section>
        <form action="/Inscription" method="POST">
            <label for="name">Nom :</label>
            <input type="text" name="name" id="name" required placeholder="Nom">
            <label for="email">Email :</label>
            <input type="email" name="email" id="email" required placeholder="Email">
            <label for="password">Mot de passe :</label>
            <input type="password" name="password" id="password" required placeholder="Mot de passe">
            <input type="submit" value="S'inscrire">
        </form>
    </section>
</main>
<?php include 'partials/footer.php'; ?>