<main class="d-flex flex-column bg-background" style='background-image: url(<?php echo $background_image_path ?>);min-height:100vh;'>

    <?php require_once '_nav_menu.php'?>

    <section
        class="col-12 col-xl-8 offset-xl-3 d-flex flex-column justify-content-center align-items-center bg-light p-4"
        style="min-height:100vh;">

        <h1 class="my-4 font-weight-bold">Détails de votre activité</h1>

        <div class="row w-100 d-flex flex-wrap justify-content-between p-4" style="min-height: 25vh;">
            <div class="col-12 col-md-6 col-lg-3 card shadow p-4 m-4">
                <p class="text-muted">Utilisateur(s) : </p>
                <div class="row h-100">
                    <div class="col d-flex align-items-center justify-content-center">
                        <i class="lni lni-users lni-32"></i>
                    </div>
                    <div class="col-8 d-flex align-items-center justify-content-center">
                        <p class="display-4 mb-0"><?php echo $analytics['user_number'] ?></p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3 card shadow p-4 m-4">
                <p class="text-muted">Utilisateur(s) mois courant / mois précédent : </p>
                <div class="row h-100">
                    <div class="col d-flex align-items-center justify-content-center">
                    <i class="lni lni-bar-chart lni-32"></i>
                    </div>
                    <div class="col-8 d-flex align-items-center justify-content-center">
                        <p class=" display-4 mb-0"><?php echo $analytics['user_number'] ?></p>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-3 card shadow p-4 m-4">
                <p class="text-muted">Nombre de Posts : </p>
                <div class="row h-100">
                    <div class="col d-flex align-items-center justify-content-center">
                    <i class="lni lni-files lni-32"></i>
                    </div>
                    <div class="col-8 d-flex align-items-center justify-content-center">
                        <p class=" display-4 mb-0"><?php echo $analytics['posts_count'] ?></p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3 card shadow p-4 m-4">
                <p class="text-muted">Nombre de catégories de panne : </p>
                <div class="row h-100">
                    <div class="col d-flex align-items-center justify-content-center">
                    <i class="lni lni-tag lni-32"></i>
                    </div>
                    <div class="col-8 d-flex align-items-center justify-content-center">
                        <p class=" display-4 mb-0">
                            <?php echo $analytics['breakdown_categories_count'] ?></p>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-3 card shadow p-4 m-4">
                <p class="text-muted">Temps moyen / page : </p>
                <div class="row h-100">
                    <div class="col d-flex align-items-center justify-content-center">
                    <i class="lni lni-alarm-clock lni-32"></i>
                    </div>
                    <div class="col-8 d-flex align-items-center justify-content-center">
                        <p class=" display-4 mb-0"><?php echo $analytics['avg_time_on_page'] ?></p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3 card shadow p-4 m-4">
                <p class="text-muted">Temps moyen / session : </p>
                <div class="row h-100">
                    <div class="col d-flex align-items-center justify-content-center">
                    <i class="lni lni-alarm-clock lni-32"></i>
                    </div>
                    <div class="col-8 d-flex align-items-center justify-content-center">
                        <p class=" display-4 mb-0"> <?php echo $analytics['avg_session_duration'] ?></p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3 card shadow p-4 m-4">
                <p class="text-muted">Nombre de page vues par session : </p>
                <div class="row h-100">
                    <div class="col d-flex align-items-center justify-content-center">
                    <i class="lni lni-eye lni-32"></i>
                    </div>
                    <div class="col-8 d-flex align-items-center justify-content-center">
                        <p class=" display-4 mb-0"><?php echo $analytics['page_views_per_session'] ?>
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-3 card shadow p-4 m-4">
                <p class="text-muted">Bounces : </p>
                <div class="row h-100">
                    <div class="col d-flex align-items-center justify-content-center">
                    <i class="lni lni-eye lni-32"></i>
                    </div>
                    <div class="col-8 d-flex align-items-center justify-content-center">
                        <p class=" display-4 mb-0"><?php echo $analytics['bounces'] ?></p>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-3 card shadow p-4 m-4">
                <p class="text-muted">Bounce Rate : </p>
                <div class="row h-100">
                    <div class="col d-flex align-items-center justify-content-center">
                    <i class="lni lni-eye lni-32"></i>
                    </div>
                    <div class="col-8 d-flex align-items-center justify-content-center">
                        <p class=" display-4 mb-0"><?php echo $analytics['bounce_rate'] ?></p>
                    </div>
                </div>
            </div>



        </div>
        <div class="row w-100 d-flex flex-wrap" style="min-height: 100vh;">
            <div class="col-12 p-4" style="min-height: 25vh;" id="user-evolution"></div>
            <div class="col-12 col-lg-6 p-4" style="min-height: 25vh;" id="user-type"></div>
            <div class="col-12 col-lg-6 p-4" style="min-height: 25vh;" id="entrances_by_landing_page_paths"></div>
            <div class="col-12 col-lg-6 p-4" style="min-height: 25vh;" id="user-location"></div>
            <div class="col-12 col-lg-6 p-4" style="min-height: 25vh;" id="exits_by_exit_page_paths"></div>
            <div class="col-12 col-lg-6 p-4" style="min-height: 25vh;" id="unique_page_view_by_page_path"></div>
            <div class="col-12 col-lg-6 p-4" style="min-height: 25vh;" id="posts_by_breakdowncategories_and_platforms">
            </div>
        </div>

    </section>

</main>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/sunburst.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script src="<?php echo ROOT_PATH . '/app/assets/js/admin_insights.js' ?> "></script>


<script>
drawPie('user-type', <?php echo $analytics['users_by_device'] ?>, "Utilisateurs par type d'appareil")
drawPie('user-location', <?php echo $analytics['users_by_country'] ?>, "Utilisateurs par pays")
drawPie('entrances_by_landing_page_paths', <?php echo $analytics['entrances_by_landing_page_paths'] ?>,
    "Répartition du traffic en entrée")
drawPie('exits_by_exit_page_paths', <?php echo $analytics['exits_by_exit_page_paths'] ?>,
    "Répartition du traffic en sortie")
drawPie('unique_page_view_by_page_path', <?php echo $analytics['unique_page_view_by_page_path'] ?>,
    "Nombre de visite / page")
drawSunBurst('posts_by_breakdowncategories_and_platforms',
    <?php echo $analytics['posts_by_breakdowncategories_and_platforms'] ?>,
    "Répartition des annonces par type de panne et platforme")
drawLine('user-evolution',
    <?php echo $analytics["user_evolution"] ?>,
    "Evolution du nombre d'utilisateur",
    "Nombre d'utilisateur",
    "jour"
)
</script>