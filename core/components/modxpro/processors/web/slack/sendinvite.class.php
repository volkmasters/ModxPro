<?php

class SlackSendInvite extends modProcessor
{

    /** @var App $App */
    public $App;


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
        $email = trim($this->getProperty('email'));
        if (!$email) {
            return $this->failure($this->modx->lexicon('app_slack_err_email'));
        }
        $result = $Slack->request('users.admin.invite', ['email' => $email]);
        if (!empty($result['ok'])) {
            return $this->success($this->modx->lexicon('app_slack_ok'), [
                'callback' => 'Slack.callbacks.invite',
            ]);
        }
        switch ($result['error']) {
            case 'already_invited':
                $message = $this->modx->lexicon('app_slack_err_invited');
                break;
            default:
                $message = $this->modx->lexicon('app_slack_err');
        }

        return $this->failure($message, [
            'callback' => 'Slack.callbacks.invite',
        ]);
    }
}

return 'SlackSendInvite';