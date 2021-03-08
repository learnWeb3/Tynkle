<!-- Modal -->
<div class="modal fade" id="new-review" tabindex="-1" aria-labelledby="new-reviewLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title front-weight-bold" id="new-reviewLabel">LAISSER UN AVIS</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-block overflow-auto" style="min-height: 35vh">
                <form action="" data-iduser="<?php echo $user['id'] ?>" class="form-lg" method="post"
                    id="new-review-form">
                    <small>* champs obligatoires</small>
                    <div class="form-group my-2">
                        <label for="">Noter ce membre</label>
                        <div class="row w-100">
                            <div class="col-12 col-lg-6 d-flex align-items-center justify-content-center">
                                <div class="rate"></div>
                            </div>
                            <div class="col-12 col-lg-6 d-flex align-items-center justify-content-center">
                                <p class="font-weight-bold m-0" style="font-size: 2rem;" id="rate-level"></p>
                            </div>
                        </div>
                    </div>
                    <div class="form-group my-2">
                        <label for="">Laisser un message expliquant votre note :</label>
                        <textarea required name="content" id="content" class="form-control" rows="10"
                            placeholder="Je vous propose de vous dépanner pour la panne ...."></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">FERMER</button>
                <button id="new-review-form-submit" type="submit" form="new-review-form"
                    class="btn btn-success">VALIDER</button>
            </div>
        </div>
    </div>
</div>