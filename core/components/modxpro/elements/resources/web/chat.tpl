{'<script type="text/javascript">requirejs(["app/slack"]);</script>' | htmlToBottom}
<div class="modx-slack">
    <h5 class="text-center">
        {if $.en}
            We suggest you to join the MODX-community on Slack for real-time communication.
            {else}
            Предлагаем вам присоединиться к тематическим MODX-каналам в сервисе Slack для общения в реальном времени.
        {/if}
        <br><i class="fa fa-chevron-down"></i>
    </h5>
    <img src="/assets/components/modxpro/img/chat/ru.png"
         srcset="/assets/components/modxpro/img/chat/ru@2x.png 2x">
    <div class="d-flex flex-wrap no-gutters">
        <div class="col-12 col-md-6 text-center">
            <h4>{$.en ? 'Russian Community' : 'Русскоговорящее сообщество'}</h4>
            <div class="mr-md-2 border rounded pt-3 pb-3 h-100">
                <div class="chat">
                    <img src="/assets/components/modxpro/img/chat/modstore.png"
                         srcset="/assets/components/modxpro/img/chat/modstore@2x.png 2x">
                    <div class="mt-3">
                        {if $.en}
                            Discussion topics related to the work of Modstore and Modhost.
                            There is also <strong>a private room</strong> for component authors.
                        {else}
                            Обсуждение тем, связанных с работой магазина дополнений Modstore и хостинга Modhost.<br>
                            Есть <strong>закрытая комната</strong> для авторов дополнений.
                        {/if}
                    </div>
                    <div class="mt-3 pr-3 pl-3">
                        <form action="slack/sendinvite" class="ajax-form">
                            <div class="input-group">
                                <input placeholder="Ваш email" type="email" name="email" class="form-control" required>
                                <div class="input-group-append">
                                    <button type="submit" class="input-group-text">
                                        <i class="far fa-thumbs-up"></i>
                                    </button>
                                </div>
                            </div>
                            {if $.en}
                                Get your invitation, if you still not in a team.
                            {else}
                                Получите приглашение, если вы еще не в команде.
                            {/if}
                        </form>
                    </div>
                    <div class="mt-5" id="chat-online">
                        <i class="fal fa-spinner-third fa-spin fa-2x"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12 col-md-6 text-center ml-md-auto mt-5 mt-md-0">
            <h4>{$.en ? 'International Community' : 'Международное сообщество'}</h4>
            <div class="ml-md-2 border rounded pt-3 pb-3 h-100">
                <img src="/assets/components/modxpro/img/chat/modx.png"
                     srcset="/assets/components/modxpro/img/chat/modx@2x.png 2x">
                <div class="mt-3">
                    {if $.en}
                        To get started, you need to get an invite from <strong>modx.org</strong>.
                        Once invited you will be able to chat with the entire community.
                    {else}
                        Чтобы начать работу, вам нужно получить приглашение через <strong>modx.org</strong>,
                        после чего вы сможете поболтать со всем сообществом.
                    {/if}
                </div>
                <div class="mt-3">
                    <a href="http://modx.org" target="_blank" class="btn btn-primary">
                        {$.en ? 'Join!' : 'Присоединиться!'}</a>
                </div>
                <img src="/assets/components/modxpro/img/lang-ru.png" class="mt-5"
                     srcset="/assets/components/modxpro/img/lang-ru@2x.png 2x">
                <div class="mt-2">
                    {if $.en}
                        There is
                        <a href="https://modxcommunity.slack.com/messages/russian/" target="_blank">a separate room</a>
                        <br>for Russian-speaking developers.
                    {else}
                        Для русскоговорящих разработчиков<br>есть
                        <a href="https://modxcommunity.slack.com/messages/russian/" target="_blank">отдельная комната</a>.
                    {/if}
                </div>
            </div>
        </div>
    </div>
</div>