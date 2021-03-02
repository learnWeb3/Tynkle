<?php
$routes = array(
    array('GET', ROOT_PATH . '/', 'home#index', 'home'),
    array('GET', ROOT_PATH . '/signin', 'sessions#new', 'new_session'),
    array('POST', ROOT_PATH . '/login', 'sessions#create', 'create_session'),
    array('DELETE', ROOT_PATH . '/logout', 'sessions#destroy', 'destroy_session'),
    // '/admin'
    array('GET', ROOT_PATH . '/admin/platform', 'admin#platform', 'platform_admin'),
    array('GET', ROOT_PATH . '/admin/insights', 'admin#insights', 'insights_admin'),
    array('GET', ROOT_PATH . '/admin/users', 'admin#users', 'users_admin'),
    array('PUT', ROOT_PATH . '/admin/users/[:id]', 'admin#users_update', 'users_admin_update'),
    array('POST', ROOT_PATH . '/admin/users/search', 'admin#users_search', 'users_admin_search'),
    array('GET', ROOT_PATH . '/admin/register/callback', 'admin#google_auth', 'google_auth_admin'),
    //  '/users'
    array('GET', ROOT_PATH . '/users', 'users#index', 'index_user'),
    array('GET', ROOT_PATH . '/users/current', 'sessions#show', 'current_user'),
    array('GET', ROOT_PATH . '/register', 'users#new', 'new_user'),
    array('GET', ROOT_PATH . '/profile', 'users#edit', 'edit_user'),
    array('GET', ROOT_PATH . '/users/[:id]', 'users#show', 'show_user'),
    array('GET', ROOT_PATH . '/users/[:id]/confirm', 'users#confirm', 'confirm_user'),
    array('GET', ROOT_PATH . '/users/password/reset', 'users#ask_new_password', 'ask_new_password_user'),
    array('POST', ROOT_PATH . '/users/password/reset', 'users#ask_new_password', 'send_new_password_user'),
    array('GET', ROOT_PATH . '/users/[:id]/reset-password', 'users#reset_password', 'reset_password_user'),
    array('POST', ROOT_PATH . '/users/[:id]/reset-password', 'users#reset_password', 'update_password_user'),
    array('POST', ROOT_PATH . '/users', 'users#create', 'create_user'),
    array('POST', ROOT_PATH . '/users/[:id]', 'users#update', 'update_user'),
    array('POST', ROOT_PATH . '/users/[:user_id]/skills', 'skills#create', 'create_user_skills'),
    array('DELETE', ROOT_PATH . '/users/[:username]', 'users#destroy', 'destroy_user'),
    array('GET', ROOT_PATH . '/register/callback', 'users#google_auth', 'google_auth'),
    // '/posts'
    array('GET', ROOT_PATH . '/posts', 'posts#index', 'index_post'),
    array('GET', ROOT_PATH . '/posts/geosearch', 'posts#index', 'index_post_geosearch'),
    array('GET', ROOT_PATH . '/posts/[i:id]', 'posts#show', 'show_post'),
    array('GET', ROOT_PATH . '/posts/[i:id]/edit', 'posts#edit', 'edit_post'),
    array('GET', ROOT_PATH . '/posts/new', 'posts#new', 'new_post'),
    array('POST', ROOT_PATH . '/posts', 'posts#create', 'create_post'),
    array('POST', ROOT_PATH . '/posts/[i:id]', 'posts#update', 'update_post'),
    array('DELETE', ROOT_PATH . '/posts/[i:id]', 'posts#destroy', 'destroy_post'),
    // /chats
    array('GET', ROOT_PATH . '/chats', 'chats#index', 'index_chat'),
    array('GET', ROOT_PATH . '/chats/[:chat_id]', 'chats#show', 'show_chat'),
    array('POST', ROOT_PATH . '/chats', 'chats#create', 'create_message'),
    array('GET', ROOT_PATH . '/chats/[:chat_id]/stream', 'chats#stream', 'stream_message'),
    array('DELETE', ROOT_PATH . '/chats/[:chat_id]', 'chats#delete', 'delete_chat'),
    array('DELETE', ROOT_PATH . '/messages/[:message_id]', 'chats#delete', 'delete_message'),
    // /breakdowns
    array('POST', ROOT_PATH . '/breakdowns', 'breakdowns#index', 'index_breakdowns'),
    // '/skills'
    array('GET', ROOT_PATH . '/skills', 'skills#index', 'index_skills'),
    array('GET', ROOT_PATH . '/skills/[i:id]', 'skills#show', 'show_skills'),
    array('POST', ROOT_PATH . '/skills', 'skills#create', 'create_skills'),
    array('POST', ROOT_PATH . '/skills/[i:id]', 'skills#update', 'update_skills'),
    array('DELETE', ROOT_PATH . '/skills/[i:id]', 'skills#destroy', 'destroy_skills'),
    // '/activity'
    array('GET', ROOT_PATH . '/activities', 'activities#index', 'index_activities'),
    array('GET', ROOT_PATH . '/activities/posts', 'activities#index', 'index_activities_posts'),
    array('GET', ROOT_PATH . '/activities/offers', 'activities#index', 'index_activities_offers'),
    array('GET', ROOT_PATH . '/activities/asks', 'activities#index', 'index_activities_asks'),
    // '/offers'
    array('GET', ROOT_PATH . '/offers', 'offers#index', 'offers_index'),
    array('PUT', ROOT_PATH . '/offers/[i:id]', 'offers#update', 'offers_update'),
    array('POST', ROOT_PATH . '/offers', 'offers#create', 'offers_create'),
    // '/asks'
    array('POST', ROOT_PATH . '/asks', 'asks#create', 'asks_create'),
    // '/pages'
    array('PUT', ROOT_PATH . '/pages/[i:id]', 'pages#update', 'page_update'),
    array('POST', ROOT_PATH . '/pages/[i:id]', 'pages#update', 'page_update_background_image'),
    // warnings
    array('POST', ROOT_PATH . '/warnings/posts/[i:id]', 'warnings#create', 'warning_posts'),
    array('POST', ROOT_PATH . '/warnings/users/[i:id]', 'warnings#create', 'warning_users'),
    array('GET', ROOT_PATH . '/warnings', 'warnings#index', 'warning_index'),
    array('DELETE', ROOT_PATH . '/warnings/posts/[i:id]', 'warnings#destroy', 'warning_posts_destroy'),
    array('DELETE', ROOT_PATH . '/warnings/users/[i:id]', 'warnings#destroy', 'warning_users_destroy')
);
