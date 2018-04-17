<div class="mt-5 text-center text-md-left">
    {if rand(0,1) == 1}
        {if $.en}
            <a href="https://en.modhost.pro" target="_blank">
                <img src="/assets/components/modxpro/img/promo/hosting-en.png" alt="Modhost"
                     srcset="/assets/components/modxpro/img/promo/hosting-en@2x.png 2x">
            </a>
        {else}
            <a href="https://modhost.pro" target="_blank">
                <img src="/assets/components/modxpro/img/promo/hosting-ru.png" alt="Modhost"
                     srcset="/assets/components/modxpro/img/promo/hosting-ru@2x.png 2x">
            </a>
        {/if}
    {else}
        <a href="https://modx3.org/funding" target="_blank">
            <img src="/assets/components/modxpro/img/promo/modxpro-modx3-portrait.png"
                 alt="Help us build MODX3">
        </a>
    {/if}
</div>