<table class=main><tr>
{foreach from=$menu key=$k item=$v}
<td class=rltop>
{if $k == $script_name}
<b>{$v}</b>
{else}
<a href="{$k}">{$v}</a>
{/if}
</td>
{/foreach}
</tr></table><br>