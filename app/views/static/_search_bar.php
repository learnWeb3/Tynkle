<div class="container position-relative mt-n6 z-index-20">
    <ul class="nav nav-tabs search-bar-nav-tabs" role="tablist">
        <li class="nav-item mr-2"><a class="nav-link active" href="#buy" data-toggle="tab" role="tab">DEMANDER DE
                L'AIDE</a></li>
        <li class="nav-item mr-2"><a class="nav-link" href="#rent" data-toggle="tab" role="tab">VENIR EN AIDE</a></li>
    </ul>
    <div class="search-bar search-bar-with-tabs p-3 p-lg-4">
        <div class="tab-content">
            <div class="tab-pane fade show active" id="buy" role="tabpanel">
                <form action="#">
                    <div class="row">
                        <div class="col-lg-4 d-flex align-items-center form-group no-divider">
                            <select class="form-control" title="Location" >
                                <option value="city_0">San Francisco</option>
                                <option value="city_1">Los Angeles</option>
                                <option value="city_2">Santa Monica</option>
                                <option value="city_3">San Diego</option>
                                <option value="city_4">Fresno</option>
                            </select>
                        </div>
                        <div class="col-md-6 col-lg-3 d-flex align-items-center form-group no-divider">
                            <select class="form-control" title="Type">
                                <option value="type_0">Duplex</option>
                                <option value="type_1">Appartment</option>
                                <option value="type_2">House</option>
                                <option value="type_3">Land</option>
                                <option value="type_4">Other</option>
                            </select>
                        </div>
                        <div class="col-md-6 col-lg-3 d-flex align-items-center form-group no-divider">
                            <select class="form-control" title="Max price">
                                <option value="price_0">$5,000</option>
                                <option value="price_1">$10,000</option>
                                <option value="price_2">$25,000</option>
                                <option value="price_3">$50,000</option>
                            </select>
                        </div>
                        <div class="col-lg-2 form-group mb-0 p-2">
                            <button class="btn btn-primary btn-block h-100" type="submit">RECHERCHER</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="tab-pane fade" id="rent" role="tabpanel">
                <form action="#">
                    <div class="row">
                        <div class="col-lg-4 d-flex align-items-center form-group no-divider">
                            <select class="selectpicker form-control" title="Location" data-style="btn-form-control"
                                multiple data-selected-text-format="count &gt; 2">
                                <option value="city_0">San Francisco</option>
                                <option value="city_1">Los Angeles</option>
                                <option value="city_2">Santa Monica</option>
                                <option value="city_3">San Diego</option>
                                <option value="city_4">Fresno</option>
                            </select>
                        </div>
                        <div class="col-md-6 col-lg-3 d-flex align-items-center form-group no-divider">
                            <select class="selectpicker" title="Type" data-style="btn-form-control" multiple
                                data-selected-text-format="count &gt; 2">
                                <option value="type_0">Duplex</option>
                                <option value="type_1">Appartment</option>
                                <option value="type_2">House</option>
                                <option value="type_3">Land</option>
                                <option value="type_4">Other</option>
                            </select>
                        </div>
                        <div class="col-md-6 col-lg-3 d-flex align-items-center form-group no-divider">
                            <select class="selectpicker" title="Max price" data-style="btn-form-control">
                                <option value="price_0">$5,000</option>
                                <option value="price_1">$10,000</option>
                                <option value="price_2">$25,000</option>
                                <option value="price_3">$50,000</option>
                            </select>
                        </div>
                        <div class="col-lg-2 form-group mb-0">
                            <button class="btn btn-primary btn-block h-100" type="submit">Search </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>