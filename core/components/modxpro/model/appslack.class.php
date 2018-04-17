<?php

class AppSlack
{
    /** @var modX $modx */
    public $modx;
    public $config = [];


    /**
     * AppSlack constructor.
     *
     * @param modX $modx
     * @param array $config
     */
    function __construct(modX $modx, array $config = [])
    {
        $this->modx = $modx;
        $this->config = array_merge([
            'service' => $this->modx->getOption('app_slack_service'),
            'token' => $this->modx->getOption('app_slack_key'),
        ], $config);
    }


    /**
     * @param $method
     * @param array $options
     *
     * @return array|mixed
     */
    public function request($method, array $options = [])
    {
        $result = [];
        $options['token'] = $this->config['token'];

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->config['service'] . $method);
        curl_setopt($ch, CURLOPT_POST, count($options));
        curl_setopt($ch, CURLOPT_POSTFIELDS, $options);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_TIMEOUT, 10);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 0);
        if ($response = curl_exec($ch)) {
            $result = json_decode($response, true);
        }
        curl_close($ch);

        return $result;
    }
}