<!-- Modal -->
<div class="modal fade" id="warning" tabindex="-1" aria-labelledby="warningLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title front-weight-bold" id="warningLabel">SIGNALER CETTE ANNONCE</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-block overflow-auto" style="min-height: 35vh">
                <form action="" data-url="<?php echo '/warnings/posts/'. $post['id'] ?>" class="form-lg" method="post" id="warning-form">
                    <small>* champs obligatoires</small>
                    <div class="form-group my-2">
                        <label for="">Rediger votre message :</label>
                        <textarea required name="content" id="content" class="form-control" rows="10" placeholder="Je souhaite signaler cette annonce pour les raisons suivantes :"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-brand active" data-bs-dismiss="modal">FERMER</button>
                <button id="warning-form-submit" type="submit" form="warning-form" class="btn btn-success">ENVOYER</button>
            </div>
        </div>
    </div>
</div>