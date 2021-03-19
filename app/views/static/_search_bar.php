<div class="container position-relative mt-n6 z-index-20">
    <ul class="nav nav-tabs search-bar-nav-tabs" role="tablist">
        <li class="nav-item mr-2"><a class="nav-link active" href="#buy" data-target="#buy" data-toggle="tab"
                role="tab">DEMANDER DE
                L'AIDE</a></li>
        <li class="nav-item mr-2"><a class="nav-link" href="#rent" data-target="#rent" data-toggle="tab"
                role="tab">VENIR EN AIDE</a></li>
    </ul>
    <div class="search-bar search-bar-with-tabs p-3 p-lg-4">
        <div class="tab-content">
            <div class="tab-pane fade show active" id="buy" role="tabpanel">
                <form action="#">
                    <div class="row">
                        <div class="col-5 d-flex align-items-center form-group no-divider">
                            <select class="form-control"  name="platform" title="platform">
                                <?php foreach ($platforms as $platform): ?>
                                <option value="<?php echo $platform['id'] ?>"> <?php echo $platform['name'] ?></option>
                                <?php endforeach;?>
                            </select>
                        </div>
                        <div class="col-5 d-flex align-items-center form-group no-divider">
                            <select class="form-control" id="breakdown" name="breakdown" title="breakdown">
                                <?php foreach ($breakdowns as $breakdown): ?>
                                <option value="<?php echo $breakdown['id'] ?>"> <?php echo $breakdown['name'] ?>
                                </option>
                                <?php endforeach;?>
                            </select>
                        </div>
                        <div class="col-2 form-group mb-0 p-2">
                            <button class="btn btn-primary btn-block h-100" type="submit">RECHERCHER</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="tab-pane fade" id="rent" role="tabpanel">
                <form action="#">
                    <div class="row">
                        <div class="col-5 d-flex align-items-center form-group no-divider">
                            <select class="form-control"  name="platform" title="platform">
                                <?php foreach ($platforms as $platform): ?>
                                <option value="<?php echo $platform['id'] ?>"> <?php echo $platform['name'] ?></option>
                                <?php endforeach;?>
                            </select>
                        </div>
                        <div class="col-5 d-flex align-items-center form-group no-divider">
                            <select class="form-control" id="breakdown" name="breakdown" title="breakdown">
                                <?php foreach ($breakdowns as $breakdown): ?>
                                <option value="<?php echo $breakdown['id'] ?>"> <?php echo $breakdown['name'] ?>
                                </option>
                                <?php endforeach;?>
                            </select>
                        </div>
                        <div class="col-2 form-group mb-0 p-2">
                            <button class="btn btn-primary btn-block h-100" type="submit">RECHERCHER</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>