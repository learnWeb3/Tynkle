<?php

class SkillsController extends ApplicationController
{

    public function __construct(array $params, string $route_name, string $asked_method)
    {
        parent::__construct($params, $route_name, $asked_method);
        $this->beforeAction(['update']);
    }

    public function create()
    {
        if (isset($this->current_user, $this->params['user_id'])) {
            try {
                $this->current_user->updateSkills($this->connection, $_POST);
                $flash = new Flash(
                    ['compétences mises à jour avec succès'],
                    'success'
                );
                $flash->storeInSession();
                die(header('Location:' . ROOT_PATH . '/profile#skills'));
            } catch (\Throwable $th) {
                $flash = new Flash(
                    ['Une erreure est survenue'],
                    'danger'
                );
                $flash->storeInSession();
                die(header('Location:' . ROOT_PATH . '/profile'));
            }
        } else if (isset($this->current_user, $_POST['name'])) {
            try {
                Skill::create(
                    $this->connection,
                    ['name'],
                    array(
                        $this->current_user['id'],
                        $_POST['name'],
                    )
                );
            } catch (\Throwable $th) {
                die(http_response_code(500));
            }
        } else {
            $this->handleError(422);
        }
    }

    public function update()
    {
        if (isset($_POST['name'])) {
            try {
                Skill::update($this->connection, ['name'], [$_POST['name']], 'id', $this->skill['id']);
            } catch (\Throwable $th) {
                die(http_response_code(500));
            }
        } else {
            $this->handleError(422);
        }
    }

    public function destroy()
    {
        try {
            Skill::delete($this->connection, [], 'id', $this->skill['id']);
        } catch (\Throwable $th) {
            die(http_response_code(500));
        }
    }

    private function beforeAction(array $targeted_method_names)
    {
        if (in_array($this->asked_method, $targeted_method_names)) {
            $user = User::find($this->connection, $this->current_user['id'])->fetchAll(PDO::FETCH_ASSOC);
            if (!empty($user)) {
                if ($user[0]['is_admin']) {
                    $skill = Skill::find($this->connection, $this->params['id'])->fetchAll(PDO::FETCH_ASSOC);
                    if (!empty($skill)) {
                        $this->skill = $skill[0];
                    } else {
                        die($this->handleError(404));
                    }
                } else {
                    $this->handleError(403);
                }
            } else {
                $this->handleError(422);
            }
        }
    }
}
