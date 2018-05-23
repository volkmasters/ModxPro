{if $.en}
    <a href="https://modstore.slack.com/messages/general/" target="_blank">
        We have <strong class="total">{$total}</strong> registered members.
    </a>
    <div>
        Online right now &mdash; <strong class="text-green">{$active}</strong>.
    </div>
{else}
    <a href="https://modstore.slack.com/messages/general/" target="_blank">
        Нас уже <strong class="total">{$total}</strong> {$total | declension:"человек|человека|человек"}.
    </a>
    <div>
        Прямо сейчас на связи &mdash; <strong class="text-green">{$active}</strong>
    </div>
{/if}