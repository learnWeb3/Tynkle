<main class="d-flex bg-computer" style='min-height:100vh;'>=
    <?php include '_chat_nav_menu.php' ?>
    <section class="col-12 col-xl-8 offset-xl-3 d-block overflow-auto bg-light p-4 position-absolute" style="height:95vh; margin-top:3rem;left:0">
        <div class="d-flex flex-column justify-content-center align-items-center">
            <?php foreach ($chats as $index => $chat) : ?>
                <?php include './app/views/chats/_chat.php' ?>
            <?php endforeach; ?>
        </div>
    </section>
</main>