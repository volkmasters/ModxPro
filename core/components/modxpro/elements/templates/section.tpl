{extends 'file:templates/base.tpl'}

{block 'content'}
    {var $res = 'community/topic/getlist' | processor : [
        'where' => ['comTopic.parent' => $_modx->resource.id],
    ]}

    <h1 class="section-title">
        {$_modx->resource.pagetitle}
    </h1>
    <div class="buttons">
        <a href="" class="btn btn-outline-primary mb-3">
            {$.en ? 'Write a topic' : 'Написать заметку'}
        </a>
    </div>
    <div class="topics-list">
        {$res.results}
        {include 'file:chunks/promo/page.tpl'}
        {include 'file:chunks/_pagination.tpl' res=$res}
    </div>
{/block}