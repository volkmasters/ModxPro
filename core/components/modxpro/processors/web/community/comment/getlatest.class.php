<?php

require_once dirname(dirname(dirname(__FILE__))) . '/getlist.class.php';

class CommentGetLatestProcessor extends AppGetListProcessor
{
    public $objectType = 'comComment';
    public $classKey = 'comComment';
    public $defaultSortField = 'createdon';
    public $defaultSortDirection = 'desc';

    public $getCount = false;
    public $tpl = '@FILE chunks/comments/latest.tpl';


    /**
     * @param xPDOQuery $c
     *
     * @return xPDOQuery
     */
    public function prepareQueryBeforeCount(xPDOQuery $c)
    {
        $last = $this->App->pdoTools->getCollection('comThread', [
            'context' => $this->modx->context->key,
        ], [
            'select' => [
                'comThread' => 'comment_last',
            ],
            'sortby' => 'comment_time',
            'sortdir' => 'desc',
            'limit' => $this->getProperty('limit'),
            'setTotal' => false,
        ]);

        $where = [
            $this->classKey . '.deleted' => false,
            'id:IN' => [],
        ];
        foreach ($last as $v) {
            $where['id:IN'][] = $v['comment_last'];
        }
        $c->where($where);

        return $c;
    }


    /**
     * @param xPDOQuery $c
     *
     * @return xPDOQuery
     */
    public function prepareQueryAfterCount(xPDOQuery $c)
    {
        $c->leftJoin('comThread', 'Thread');
        $c->leftJoin('comTopic', 'Topic', 'Thread.topic = Topic.id');
        $c->leftJoin('modUser', 'User');
        $c->leftJoin('modUserProfile', 'UserProfile');

        $c->select('comComment.id, comComment.text, comComment.createdon, comComment.createdby');
        $c->select('Thread.topic, Thread.comments');
        $c->select('User.username');
        $c->select('UserProfile.fullname, UserProfile.photo, UserProfile.email, UserProfile.usename');
        $c->select('Topic.pagetitle as pagetitle, Topic.uri as uri');

        return $c;
    }

}

return 'CommentGetLatestProcessor';