{var $res = 'community/comment/getlist' | processor : [
    'limit' => 20,
]}

{include 'file:chunks/_banner.tpl'}
<div class="comments-list">
    <h4 class="section-title">
        {if $.en}
            Total {number_format($res['total'], 0, '.', ' ')} {$res['total'] | declension : 'comment|comments'}
        {else}
            Всего {number_format($res['total'], 0, '.', ' ')} {$res['total'] | declension : 'комментарий|комментария|комментариев'}
        {/if}
    </h4>
    {$res.results}

    {include 'file:chunks/_pagination.tpl' res=$res}
</div>