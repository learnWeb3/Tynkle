<div class="card col-12 col-xl-8 shadow p-4 my-4" id="offer-<?php echo $offer['id']  ?>">
    <div class="row my-2">
        <div class="col-12 col-xl-8 d-flex align-items-center my-2">
            <h5 class="font-weight-bold">Objet:</h5>
            <h5 class="font-weight-bold mx-2"> <?php echo $offer['object'] ?></h5>
        </div>
        <div class="col-12 col-xl-4 d-flex align-items-center justify-content-xl-end my-2">
            <img src="<?php echo ABSOLUTE_ASSET_PATH . "/partials/publication_card/img/avatar_placeholder.svg" ?>" class="m-2" height="36" width="36" alt="map pointer icon" class="img-fluid">
            <p class="font-weight-bold my-2">Martin Dupont</p>
        </div>
    </div>
    <div class="row my-2">
        <div class="col-12 col-xl-8 my-2">
            <?php if ($offer['id_user'] !== $current_user): ?>
            <h5 class="font-weight-bold">Votre proposition :</h5>
            <?php else : ?>
            <h5 class="font-weight-bold">On vous propose :</h5>
            <?php endif; ?>
            <p class="mb-0"> <?php echo $offer['content'] ?></p>
        </div>
        <div class="col-12 col-xl-4 d-flex align-items-center justify-content-xl-end my-2">
            <p class="font-weight-bold text-end mb-0">Montant proposé : <?php echo $offer['amount'] ?> &euro;</p>
        </div>
    </div>
    <div class="row d-flex justify-content-end my-2">
        <div class="col-12 col-xl-8 d-flex align-items-center my-2">
            <a class="font-weight-bold" href="<?php echo ROOT_PATH . "/posts/" . $offer['id_post'] ?>" class=""> Voir l'annonce</a>
        </div>
        <div class="col col-xl-4 d-flex align-items-center justify-content-between my-2">
            <?php if ($offer['is_accepted'] === '0' && $offer['is_declined'] === '0' && $offer['id_user'] !== $current_user) : ?>
                <button class="btn btn-md btn-success offer-action" data-action="1" data-offerId="<?php echo $offer['id'] ?>">ACCEPTER</button>
                <button class="btn btn-md btn-red-crayola offer-action" data-action="0" data-offerId="<?php echo $offer['id'] ?>">DECLINER</button>
            <?php endif ?>
            <?php if ($offer['is_accepted'] === '0' && $offer['is_declined'] === '0' && $offer['id_user'] === $current_user)  : ?>
                <p class='w-100 text-end font-weight-bold'>EN ATTENTE DE REPONSE</p>
            <?php endif ?>
            <?php if ($offer['is_accepted'] === '1' && $offer['is_declined'] === '0') : ?>
                <p class='w-100 text-xl-end font-weight-bold text-success'>ANNONCE ACCEPTEE</p>
            <?php endif ?>
            <?php if ($offer['is_accepted'] === '0' && $offer['is_declined'] === '1') : ?>
                <p class='w-100 text-xl-end font-weight-bold text-danger'>ANNONCE DECLINEE</p>
            <?php endif ?>
        </div>
    </div>
</div>