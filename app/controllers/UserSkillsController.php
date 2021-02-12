<?php

class UserSkillsController extends ApplicationController
{

    public function __construct(array $params, string $route_name, string $asked_method)
    {
        parent::__construct($params, $route_name, $asked_method);
        $this->beforeAction(["destroy"]);
    }

    public function create()
    {
        if (isset($this->current_user)) {
            UserSkill::create(
                $this->connection,
                ['id_user', 'id_skill'],
                array(
                    $this->current_user['id'],
                    $_POST['id_skill'],
                )
            );
        } else {
            $this->handleError(422);
        }
    }

    public function destroy()
    {
        if (isset($this->current_user)) {
            if ($this->user_skill['id_user'] === $this->current_user['id']) {
                UserSkill::delete($this->connection, [], 'id', $this->user_skill['id']);
            } else {
                $this->handleError(403);
            }
        } else {
            $this->handleError(422);
        }
    }

    private function beforeAction(array $targeted_method_names)
    {
        if (in_array($this->asked_method, $targeted_method_names)) {
            $user_skill = UserSkill::find($this->connection, $this->params['id'])->fetchAll(PDO::FETCH_ASSOC);
            if (!empty($user_skill)) {
                $this->user_skill = $user_skill[0];
            } else {
                die($this->handleError(404));
            }
        }
    }
}
