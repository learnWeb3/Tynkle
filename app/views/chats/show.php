<main class="d-flex bg-brand-blue" style='min-height:100vh;'>
    <nav class="d-none col-lg-3 d-lg-flex flex-column justify-content-around p-4 fixed-bottom" style="height:100vh" id="menu-navigation">
        <ul class="nav flex-column w-100">
            <li class="nav-item d-flex align-items-center w-100 my-2">
                <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/message_light.svg" height="36" width="36" alt="my chats">
                <a class="nav-link active display-6 m-2 text-white font-weight-bold" href="<?php echo ROOT_PATH.'/chats' ?>">Mes messages</a>
            </li>
            <li class="nav-item d-flex align-items-center w-100 my-2">
                <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/account_light.svg" height="36" width="36" alt="account informations">
                <a class="nav-link active display-6 m-2 text-white font-weight-bold" href="<?php echo ROOT_PATH.'/profile' ?>">Mon profil</a>
            </li>
        </ul>

        <ul class="nav flex-column w-100">
            <li class="nav-item d-flex align-items-center w-100 my-2">
                <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/home_light.svg" height="32" width="32" alt="home">
                <a class="nav-link active display-6 m-2 text-white font-weight-bold" href="<?php echo ROOT_PATH.'/' ?>">Accueil</a>
            </li>
        </ul>
    </nav>
    <section class="col-12 col-lg-8 offset-lg-3 d-flex flex-column bg-white p-4" style="margin-top:3.5rem;" id="current-conversation">
        <div class="row">
            <div class="col-2 d-flex justify-content-start align-items-center">
                <a href="<?php echo ROOT_PATH . '/chats' ?>"><img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/chevron-left.svg" height="48" width="36" alt="back to conversations" style="cursor:pointer"></a>
            </div>
            <div class="col-10 d-flex justify-content-end align-items-center">
                <p class="font-weight-bold m-2"><?php echo $chat['subscriber_count'] ?> membres</p>
                <p class="font-weight-bold m-2"><span id="message-count"><?php echo $chat['message_count'] ?></span> messages</p>
            </div>
        </div>
        <div class="col-12 d-block overflow-auto p-4" id="current-chat-container">
            <div class="d-flex flex-column w-100" id="messages-container">
                <?php foreach ($messages as $index => $message) : ?>
                    <?php include './app/views/chats/_message.php' ?>
                <?php endforeach; ?>
            </div>
        </div>

        <div class="col-12 py-4 d-flex align-items-center justify-content-center" id='new-message-container'>
            <form class="w-100" method="POST" id="new_message">
                <input name="content" data-subscibersIds='<?php echo $chat['subscriber_ids']  ?>' data-current='<?php echo $current_user ?>' data-id='<?php echo $chat['id'] ?>' id="content" placeholder="Rediger votre message..." class="form-control-lg col-12 col-md-6 col-lg-9"></input>
                <button type="submit" class="btn btn-lg btn-brand active col-12 col-md-6 col-lg-2">envoyer</button>
            </form>
        </div>
    </section>

</main>
<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/chat.js' ?>"></script>