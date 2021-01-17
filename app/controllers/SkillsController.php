<?php

class SkillsController extends ApplicationController
{

    public function __construct(array $params, string $asked_method)
    {
        parent::__construct($params, $asked_method);
        $this->beforeAction(['destroy', 'update']);
    }
    public function create()
    {
        if (isset($this->current_user, $_POST['name'])) {
            Skill::create(
                $this->connection,
                ['name'],
                array(
                    $this->current_user['id'],
                    $_POST['name'],
                )
            );
        } else {
            $this->handleError(422);
        }
    }

    public function update()
    {
        if (isset($_POST['name'])) {
            Skill::update($this->connection, ['name'], [$_POST['name']], 'id', $this->skill['id']);
        } else {
            $this->handleError(422);
        }
    }

    public function index()
    {
    }

    public function destroy()
    {
        Skill::delete($this->connection, [], 'id', $this->skill['id']);
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
