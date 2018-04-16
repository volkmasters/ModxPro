<?php

require_once dirname(dirname(dirname(__FILE__))) . '/getlist.class.php';

class TopicGetLatestProcessor extends AppGetListProcessor
{
    public $objectType = 'comTopic';
    public $classKey = 'comTopic';
    public $defaultSortField = 'createdon';
    public $defaultSortDirection = 'desc';

    public $tpl = '@FILE chunks/topics/latest.tpl';


    /**
     * @param xPDOQuery $c
     *
     * @return xPDOQuery
     */
    public function prepareQueryBeforeCount(xPDOQuery $c)
    {
        $c->leftJoin('comSection', 'Section');

        $where = [
            $this->classKey . '.published' => true,
            $this->classKey . '.context' => $this->modx->context->key
        ];

        if ($tmp = $this->getProperty('where', [])) {
            $where = array_merge($where, $tmp);
        }
        if ($where) {
            $c->where($where);
        }

        return $c;
    }


    /**
     * @param xPDOQuery $c
     *
     * @return xPDOQuery
     */
    public function prepareQueryAfterCount(xPDOQuery $c)
    {
        $c->select($this->modx->getSelectColumns($this->classKey, $this->classKey, '', ['content'], true));
        $c->leftJoin('modUser', 'User');
        $c->leftJoin('modUserProfile', 'UserProfile');

        $c->select('Section.pagetitle as section_title, Section.uri as section_uri');
        $c->select('User.username, UserProfile.photo, UserProfile.email, UserProfile.fullname, UserProfile.usename');

        return $c;
    }
}

return 'TopicGetLatestProcessor';