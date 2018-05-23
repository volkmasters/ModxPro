{foreach $results as $item}
    <div class="comment-row">
        <div class="comment-wrapper">
            <div class="comment-meta d-flex flex-wrap no-gutters align-items-center item-data" data-id="{$item.id}" data-type="comment">
                <div class="col-12 col-md-6 d-flex align-items-center justify-content-center justify-content-md-start">
                    {if !$user}
                        {$item | avatar : 40}
                        <div class="ml-2 created">
                            <div class="author">
                                <a href="/users/{$item.usename ? $item.username : $item.createdby}">{$item.fullname}</a>
                            </div>
                            <div class="date">{$item.createdon | dateago}</div>
                        </div>
                    {else}
                        <div class="date">
                            <i class="far fa-calendar-alt"></i> {$item.createdon | dateago}
                        </div>
                    {/if}
                </div>
                <div class="col-12 col-md-6 mt-2 mt-md-0 col-md-3 ml-md-auto d-flex justify-content-around justify-content-md-end">
                    <div class="d-flex">
                        <div class="link-comment">
                            <a href="/{$item.uri}/{$item.topic}#comment-{$item.id}">
                                <i class="far fa-hashtag"></i>
                            </a>
                        </div>
                        <div class="star ml-3{if $item.star} active{/if}">
                            {if $_modx->isAuthenticated()}
                                <a href="#">
                                    <div> <span class="placeholder">{$item.stars ?: ''}</span></div>
                                </a>
                            {else}
                                <div> {$item.stars ?: ''}</div>
                            {/if}
                        </div>
                    </div>
                    <div class="ml-md-5">
                        <div class="rating">
                            <i class="far fa-arrow-up mr-2"></i>
                            {if $item.rating > 0}
                                <span class="text-success">+{$item.rating}</span>
                            {elseif $item.rating < 0}
                                <span class="text-danger">{$item.rating}</span>
                            {else}
                                <span>{$item.rating}</span>
                            {/if}
                            <i class="far fa-arrow-down ml-2"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="comment-text mt-2">
                {$item.text | escape | prism}
            </div>
            <div class="comment-footer mt-2 d-flex flex-wrap justify-content-center justify-content-md-start">
                <div>
                    <a href="/{$item.uri}">
                        <i class="far fa-folder-open"></i> {$item.section_title}
                    </a>
                </div>
                <div class="ml-2 mr-2">/</div>
                <div>
                    <a href="/{$item.uri}/{$item.topic}">
                        {$item.topic_title}
                    </a>&nbsp;&nbsp;<i class="far fa-comment"></i> {$item.comments}
                </div>
            </div>
        </div>
    </div>
{/foreach}