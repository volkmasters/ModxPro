<?php

class CommunityStarCommentProcessor extends modObjectProcessor
{
    public $classKey = 'comStar';


    /**
     * @return bool|null|string
     */
    public function initialize()
    {
        return $this->modx->user->isAuthenticated($this->modx->context->key)
            ? true
            : $this->modx->lexicon('access_denied');
    }


    /**
     * @return array|mixed|string
     */
    public function process()
    {
        $key = [
            'id' => (int)$this->getProperty('id'),
            'class' => 'comComment',
            'createdby' => $this->modx->user->id,
        ];
        /** @var comStar $star */
        if (!$star = $this->modx->getObject($this->classKey, $key)) {
            $star = $this->modx->newObject($this->classKey, $key);
            $star->fromArray($key, '', true, true);
            $star->set('createdon', date('Y-m-d H:i:s'));
            /** @var comComment $object */
            if ($object = $this->modx->getObject('comComment', $key['id'])) {
                $star->set('owner', $object->createdby);
            }
            $star->save();

        } else {
            $star->remove();
        }

        if ($comment = $star->getOne('Comment')) {
            $comment->set('stars', $this->modx->getCount('comStar', ['id' => $comment->id, 'class' => 'comComment']));
            $comment->save();
        }

        return $this->success('', $comment ? $comment->get(['stars']) : 0);
    }

}

return 'CommunityStarCommentProcessor';