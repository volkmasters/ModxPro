{if empty($mode)}
    {var $res = 'community/topic/getlist' | processor : [
        'limit' => 10,
        'showSection' => true,
        'where' => [
            'Section.alias:NOT IN' => ['help', 'work'],
            'comTopic.important:>=' => 0,
            'comTopic.rating:>' => -3,
        ],
    ]}
{/if}

{include 'file:chunks/_banner.tpl'}
<ul class="nav main-tickets-filter nav-pills justify-content-center justify-content-md-end mb-5 mb-md-3">
    <li class="nav-item">
        <a class="nav-link{if $mode == ''} active{/if}" href="/">{$.en ? 'New' : 'Новые'}</a>
    </li>
    <li class="nav-item">
        <a class="nav-link{if $mode == 'popular'} active{/if}" href="/popular">{$.en ? 'Popular' : 'Популярные'}</a>
    </li>
    <li class="nav-item">
        <a class="nav-link{if $mode == 'best'} active{/if}" href="/best">{$.en ? 'Best' : 'Лучшие'}</a>
    </li>
    <li class="nav-item">
        <a class="nav-link{if $mode == 'all'} active{/if}" href="/all">
            {$.en ? 'All, including questions' : 'Все, включая вопросы'}
        </a>
    </li>
</ul>
<div class="topics-list">
    {$res.results}
    {include 'file:chunks/promo/page.tpl'}
    {include 'file:chunks/_pagination.tpl' res=$res}
</div>
