  <!-- Modal -->
  <div class="modal fade" id="new-offer" tabindex="-1" aria-labelledby="new-offerLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title front-weight-bold" id="new-offerLabel">FAIRE UNE OFFRE</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-block overflow-auto" style="min-height: 35vh">
                    <form action="" data-idPost="<?php echo $post['id'] ?>" class="form-lg" method="post" id="new-offer-form">
                        <small>* champs obligatoires</small>
                        <div class="form-group my-2">
                            <label for="amount">Montant de l'offre : </label>
                            <input required type="number" name="amount" id="amount" class="form-control">
                        </div>
                        <div class="form-group my-2">
                            <label for="object">Choisir le titre de l'offre :</label>
                            <input required name="object" id="object" type="text" class="form-control" placeholder="Proposition de dépannage">
                        </div>

                        <div class="form-group my-2">
                            <label for="">Rediger un message :</label>
                            <textarea required name="content" id="content" class="form-control" placeholder="Je vous propose de vous dépanner pour la panne ...."></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-brand active" data-bs-dismiss="modal">FERMER</button>
                    <button id="new-offer-form-submit" type="submit" form="new-offer-form" class="btn btn-success">ENVOYER</button>
                </div>
            </div>
        </div>
    </div>

