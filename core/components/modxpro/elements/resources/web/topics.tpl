{var $res = 'community/topic/getarchive' | processor : [
    'limit' => 100,
]}

{include 'file:chunks/_banner.tpl'}
<div class="topics-list">
    {$res.results}

    {include 'file:chunks/_pagination.tpl' res=$res}
</div>