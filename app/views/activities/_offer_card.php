<div class="card col-12 col-xl-8 shadow p-4 my-4" id="offer-<?php echo $offer['id']  ?>">
    <div class="row my-2">
        <div class="col-12 col-xl-4 d-flex align-items-center">
            <h4 class="font-weight-bold">Objet:</h4>
            <h4 class="font-weight-bold"> <?php echo $offer['object'] ?></h4>
        </div>
        <div class="col-12 col-xl-8 d-flex align-items-center justify-content-xl-end">
            <img src="./assets/partials/publication_card/img/avatar_placeholder.svg" class="m-2" height="36" width="36" alt="map pointer icon" class="img-fluid">
            <p class="font-weight-bold my-2">Martin Dupont</p>
        </div>
    </div>
    <div class="row my-2">
        <div class="col-12 col-xl-8">
            <h4 class="font-weight-bold">Contenu du message :</h4>
            <p class="mb-0"> <?php echo $offer['content'] ?></p>
        </div>
        <div class="col-12 col-xl-4 d-flex align-items-center justify-content-xl-end">
            <p class="font-weight-bold text-end mb-0">Montant proposé: <?php echo $offer['amount'] ?> &euro;</p>
        </div>
    </div>
    <div class="row d-flex justify-content-end my-2">
        <div class="col-12 col-xl-8 d-flex align-items-center">
            <a class="font-weight-bold" href="<?php echo ROOT_PATH . "/posts/" . $offer['id_post'] ?>" class=""> Voir l'annonce</a>
        </div>
        <div class="col col-xl-4 d-flex align-items-center justify-content-between">
            <?php if ($offer['is_accepted'] === '0' && $offer['is_declined'] === '0') : ?>
                <button class="btn btn-md btn-success offer-action" data-action="1" data-offerId="<?php echo $offer['id'] ?>">ACCEPTER</button>
                <button class="btn btn-md btn-red-crayola offer-action" data-action="0" data-offerId="<?php echo $offer['id'] ?>">DECLINER</button>
            <?php endif ?>
            <?php if ($offer['is_accepted'] === '1' && $offer['is_declined'] === '0') : ?>
                <p class='w-100 text-end font-weight-bold text-success'>ANNONCE ACCEPTEE</p>
            <?php endif ?>
            <?php if ($offer['is_accepted'] === '0' && $offer['is_declined'] === '1') : ?>
                <p class='w-100 text-end font-weight-bold text-danger'>ANNONCE DECLINEE</p>
            <?php endif ?>
        </div>
    </div>
</div>