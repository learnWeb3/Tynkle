<main style="min-height:100vh;padding-top:4rem" class="bg-white">
    <div class="row w-100">
        <div class="d-none d-lg-flex flex-column justify-content-center align-items-center col-xl-5 p-4 bg-light"
            style="min-height:90vh;">
            <?php if (!empty($chats)): ?>
            <div class="messages-box col-12 d-block overflow-auto" style="height:80vh;">
                <div>
                    <p class="h5 mb-2 py-1">Mes conversations</p>
                </div>
                <div class="list-group rounded-0">
                    <?php foreach ($chats as $index => $chat): ?>
                    <?php include '_chat.php'?>
                    <?php endforeach?>
                </div>
            </div>
            <?php else: ?>
            <p>Pas de message pour le moment ...</p>
            <a class="my-2 btn btn-md btn-primary" href="<?php echo ROOT_PATH ?>/posts">VOIR LES ANNONCES</a>
            <?php endif;?>
        </div>
        <div class="col-12 col-xl-7 p-4 d-block overflow-y-auto" style="height:90vh;" id="general-container">
            <div class="py-5 chat-box bg-white d-flex flex-column overflow-auto" id="messages-container"
                style="height:70vh;">
                <img data-aos="fade-bottom" data-aos-duration="1000" class="img-fluid"
                    src="<?php echo ABSOLUTE_ASSET_PATH . "/img/commons/chat.svg" ?>" style="max-height: 30rem;" alt="discuss here">
                <p class="h5 text-center">Veuillez séléctionner une conversation</p>
            </div>
        </div>
    </div>
</main>

<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/chats/chats.js' ?>"></script>