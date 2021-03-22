<div class="container position-relative mt-n6 z-index-20">
    <ul class="nav nav-tabs search-bar-nav-tabs" role="tablist">
        <li class="nav-item mr-2"><a class="nav-link active" href="#ask-help" data-target="#ask-help" data-toggle="tab"
                role="tab">JE CHERCHE DE L'AIDE</a></li>
        <li class="nav-item mr-2"><a class="nav-link" href="#help" data-target="#help" data-toggle="tab"
                role="tab">JE PROPOSE MON AIDE</a></li>
    </ul>
    <div class="search-bar search-bar-with-tabs p-3 p-lg-4">
        <div class="tab-content">
            <div class="tab-pane fade show active" id="ask-help" role="tabpanel">
                <form action="<?php echo ROOT_PATH . '/users' ?>" method="GET">
                    <div class="row">
                        <div class="col-12 col-lg-5 d-flex align-items-center form-group no-divider">
                            <select class="form-control"  name="platform" title="platform">
                                <?php foreach ($platforms as $platform): ?>
                                <option value="<?php echo $platform['id'] ?>"> <?php echo $platform['name'] ?></option>
                                <?php endforeach;?>
                            </select>
                        </div>
                        <div class="col-12 col-lg-5 d-flex align-items-center form-group no-divider">
                            <select class="form-control" id="breakdown" name="breakdown" title="breakdown">
                                <?php foreach ($breakdowns as $breakdown): ?>
                                <option value="<?php echo $breakdown['id'] ?>"> <?php echo $breakdown['name'] ?>
                                </option>
                                <?php endforeach;?>
                            </select>
                        </div>
                        <div class="col-12 col-lg-2 form-group mb-0 p-2">
                            <button class="btn btn-primary btn-block h-100" type="submit">RECHERCHER</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="tab-pane fade" id="help" role="tabpanel">
                <form action="<?php echo ROOT_PATH . '/posts' ?>" method="GET">
                    <div class="row">
                        <div class="col-12 col-lg-5 d-flex align-items-center form-group no-divider">
                            <select class="form-control"  name="platform" title="platform">
                                <?php foreach ($platforms as $platform): ?>
                                <option value="<?php echo $platform['id'] ?>"> <?php echo $platform['name'] ?></option>
                                <?php endforeach;?>
                            </select>
                        </div>
                        <div class="col-12 col-lg-5 d-flex align-items-center form-group no-divider">
                            <select class="form-control" id="breakdown" name="breakdown" title="breakdown">
                                <?php foreach ($breakdowns as $breakdown): ?>
                                <option value="<?php echo $breakdown['id'] ?>"> <?php echo $breakdown['name'] ?>
                                </option>
                                <?php endforeach;?>
                            </select>
                        </div>
                        <div class="col-12 col-lg-2 form-group mb-0 p-2">
                            <button class="btn btn-primary btn-block h-100" type="submit">RECHERCHER</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>