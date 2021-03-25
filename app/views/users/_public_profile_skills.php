<?php foreach ($platforms as $i => $platform): ?>
<div class="accordion-flush card shadow-sm" id="accordionSkills">
    <div class="accordion-item">
        <h2 class="accordion-header" id="<?php echo "heading-".$i ?>">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                data-bs-target="<?php echo "#collapse"."tynklePlatform".$i ?>" aria-expanded="true"
                aria-controls="<?php echo "#collapse-".$i ?>">
                <p class="mb-0"><?php echo $platform['name'] ?></p>
                <span class="mx-4 badge bg-yellow-brand text-dark"><?php echo $platform['total_skill_owned_number'] ?>/<?php echo $platform['total_skill_number'] ?></span>
                <span class="visually-hidden">number of skills owned on total number of skills of platform</span>
                </h4>
            </button>
        </h2>
        <div id="<?php echo "collapse"."tynklePlatform".$i ?>" class="accordion-collapse collapse"
            aria-labelledby="<?php echo "heading-".$i ?>" data-bs-parent="#accordionSkills">
            <div class="accordion-body">
                <?php foreach ($platform['breakdown_categories'] as $index => $breakdown_category_skill): ?>
                <h5><?php echo $breakdown_category_skill['name'] ?></h5>
                <div class="row">
                    <ul class="col-12">
                        <?php foreach ($breakdown_category_skill['skills'] as $index => $skill): ?>
                        <li class="row d-flex align-items-start justify-content-between">
                            <div class="col-8">
                                <p class="mb-0"><?php echo $skill['name'] ?></p>
                            </div>
                            <div class="col-4">
                                <div class="form-check form-check-inline">
                                    <?php if ($skill['is_owned']): ?>
                                    <input class="form-check-input" type="radio" name="<?php echo $skill['id'] ?>"
                                        checked id="yes_<?php echo $skill['id'] ?>" value="1">
                                    <?php else: ?>
                                    <input class="form-check-input" type="radio" name="<?php echo $skill['id'] ?>"
                                        id="yes_<?php echo $skill['id'] ?>" value="1">
                                    <?php endif;?>
                                    <label class="form-check-label" for="yes_<?php echo $skill['id'] ?>">oui
                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <?php if (!$skill['is_owned']): ?>
                                    <input class="form-check-input" type="radio" name="<?php echo $skill['id'] ?>"
                                        checked id="no_<?php echo $skill['id'] ?>" value="0">
                                    <?php else: ?>
                                    <input class="form-check-input" type="radio" name="<?php echo $skill['id'] ?>"
                                        id="no_<?php echo $skill['id'] ?>" value="0">
                                    <?php endif;?>

                                    <label class="form-check-label" for="no_<?php echo $skill['id'] ?>">non</label>
                                </div>
                            </div>
                        </li>
                        <?php endforeach;?>
                    </ul>
                </div>
                <?php endforeach;?>
            </div>
        </div>
    </div>
</div>

<?php endforeach;?>