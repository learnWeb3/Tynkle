<?php
$routes = array(
    array('GET', ROOT_PATH . '/', 'home#index', 'home'),
    array('GET', ROOT_PATH . '/signin', 'sessions#new', 'new_session'),
    array('POST', ROOT_PATH . '/login', 'sessions#create', 'create_session'),
    array('DELETE', ROOT_PATH . '/logout', 'sessions#destroy', 'destroy_session'),
    //  '/users'
    array('GET', ROOT_PATH . '/users', 'users#index', 'index_user'),
    array('GET', ROOT_PATH . '/register', 'users#new', 'new_user'),
    array('GET', ROOT_PATH . '/profile', 'users#edit', 'edit_user'),
    array('GET', ROOT_PATH . '/users/[:id]', 'users#show', 'show_user'),
    array('POST', ROOT_PATH . '/users', 'users#create', 'create_user'),
    array('POST', ROOT_PATH . '/users/[:id]', 'users#update', 'update_user'),
    array('POST', ROOT_PATH . '/users/[:user_id]/skills', 'skills#create', 'create_user_skills'),
    array('DELETE', ROOT_PATH . '/users/[:username]', 'users#destroy', 'destroy_user'),
    // '/posts'
    array('GET', ROOT_PATH . '/posts', 'posts#index', 'index_post'),
    array('GET', ROOT_PATH . '/posts/[i:id]', 'posts#show', 'show_post'),
    array('GET', ROOT_PATH . '/posts/[i:id]/edit', 'posts#edit', 'edit_post'),
    array('GET', ROOT_PATH . '/posts/new', 'posts#new', 'new_post'),
    array('POST', ROOT_PATH . '/posts', 'posts#create', 'create_post'),
    array('POST', ROOT_PATH . '/posts/[i:id]', 'posts#update', 'update_post'),
    array('DELETE', ROOT_PATH . '/posts/[i:id]', 'posts#destroy', 'destroy_post'),
    // /chats
    array('GET', ROOT_PATH . '/chats', 'chats#index', 'index_chat'),
    array('GET', ROOT_PATH . '/chats/[:chat_id]', 'chats#show', 'show_chat'),
    array('POST', ROOT_PATH . '/chats/[:chat_id]', 'chats#create', 'create_message'),
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
    // '/offers'
    array('GET', ROOT_PATH . '/offers', 'offers#index', 'offers_index'),
    array('PUT', ROOT_PATH . '/offers/[i:id]', 'offers#update', 'offers_update'),
    array('POST', ROOT_PATH . '/offers', 'offers#create', 'offers_create'),
    // '/asks'
    array('POST', ROOT_PATH . '/asks', 'asks#create', 'asks_create')
);
