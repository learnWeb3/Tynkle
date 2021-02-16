<!-- Modal -->
<div class="modal fade" id="new-message" tabindex="-1" aria-labelledby="new-messageLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title front-weight-bold" id="new-messageLabel">POSER UNE QUESTION</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-block overflow-auto" style="min-height: 35vh">
                <form action="" data-idAuthor="<?php echo $post['user_id'] ?>" data-idPost="<?php echo $post['id'] ?>" data-idUser="<?php echo $current_user ?>" class="form-lg" method="post" id="new-message-form">
                    <small>* champs obligatoires</small>
                    <div class="form-group my-2">
                        <label for="">Rediger votre message :</label>
                        <textarea required name="content" id="content" class="form-control" rows="10" placeholder="Je vous propose de vous dépanner pour la panne ...."></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-brand active" data-bs-dismiss="modal">FERMER</button>
                <button id="new-message-form-submit" type="submit" form="new-message-form" class="btn btn-success">ENVOYER</button>
            </div>
        </div>
    </div>
</div>