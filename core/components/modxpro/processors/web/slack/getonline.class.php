<?php

class SlackGetOnline extends modProcessor
{
    /** @var App $App */
    public $App;
    public $tpl = '@FILE chunks/slack/online.tpl';


    /**
     * @return bool
     */
    public function initialize()
    {
        $this->App = $this->modx->getService('App');

        return true;
    }


    /**
     * @return mixed|string
     */
    public function process()
    {
        /** @var AppSlack $Slack */
        $Slack = $this->modx->getService('AppSlack', 'AppSlack', $this->App->config['modelPath']);
        $result = $Slack->request('users.list', ['presence' => true]);

        if (!empty($result['ok'])) {
            $total = $active = 0;
            foreach ($result['members'] as $user) {
                if ($user['id'] == 'USLACKBOT' || $user['is_bot'] || $user['deleted']) {
                    continue;
                }
                if ($user['presence'] == 'active') {
                    $active++;
                }
                $total++;
            }

            return $this->success('', [
                'html' => $this->App->pdoTools->getChunk($this->tpl, [
                    'total' => $total,
                    'active' => $active,
                ]),
            ]);
        }

        return $this->failure();
    }
}

return 'SlackGetOnline';