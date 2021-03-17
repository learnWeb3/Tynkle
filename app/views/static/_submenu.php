     <ul class="nav submenu d-none d-lg-flex w-100 align-items-center font-weight-bold">

         <?php foreach ($platforms as $platform): ?>

         <li class="nav-item text-white"><i class="lni lni-32 lni-<?php echo $platform['icon'] ?>"></i><a
                 href="<?php echo ROOT_PATH . "/posts?platform=" . $platform['id'] ?>"
                 class="nav-link"><?php echo $platform['name'] ?></a></li>

         <?php endforeach;?>

     </ul>