{var $res = 'community/section/getlist' | processor : [
    'limit' => 0,
]}

{include 'file:chunks/_banner.tpl'}
<div class="topics-list">
    {$res.results}
</div>