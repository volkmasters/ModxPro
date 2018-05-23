<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/"><i class="fa fa-home"></i></a></li>
        <li class="breadcrumb-item"><a href="/blogs">{$.en ? 'Blogs' : 'Разделы'}</a></li>
        <li class="breadcrumb-item"><a href="/{$section_uri}">{$section_pagetitle}</a></li>
    </ol>
</nav>

<div id="topic-page">
    <h1 class="topic-title">
        {$pagetitle}
    </h1>

    {if $createdby == $_modx->user.id || $_modx->isMember('Administrator')}
        <div class="buttons">
            <a href="/topic/{$id}" class="btn btn-sm btn-outline-primary">
                <i class="far fa-edit"></i> {$.en ? 'Edit topic' : 'Изменить заметку'}
            </a>
            <a href="#draft" class="btn btn-sm btn-outline-danger">
                <i class="far fa-power-off"></i> {$.en ? 'Move to drafts' : 'Убрать в черновики'}
            </a>
        </div>
    {/if}

    <div class="topic-content">
        {$content | jevix | prism}
    </div>
    {include 'file:chunks/topics/_meta.tpl' item=$_pls user=$user}
    {include 'file:chunks/promo/page.tpl'}

    <div class="topic-comments">
        {var $res = 'community/comment/getcomments' | processor : [
            'topic' => $id,
            'limit' => 0,
        ]}

        {$res.results}
    </div>
</div>