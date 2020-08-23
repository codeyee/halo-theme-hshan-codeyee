<div id="post-list" class="post-list inner">
    <#if posts?? && posts.getTotalElements() gt 0>
        <#list posts.content as post>
            <article class="post-item postItem post-item-simple card-item-vel">

                <#if post.thumbnail?? && post.thumbnail!=''>
                    <a href="${post.fullPath!}" data-ajax class="post-feature-image"
                       style="background-image: url(${post.thumbnail!})">
                    </a>
                </#if>
                <div class="padding-left">
                    <h2 class="post-item-title">
                        <a href="${post.fullPath!}" data-ajax>${post.title!}
                            <#if post.topPriority?? && post.topPriority gt 0>
                                <span>🔥</span>
                            </#if>
                        </a>
                    </h2>
                    <p class="post-item-summary">
                        ${post.summary!}
                    </p>
                    <p class="post-item-info">
                        <time class="published"
                              datetime="${post.createTime}">发布于
                            · ${post.createTime?string("yyyy-MM-dd hh:mm")} ·
                        </time>

                        <time class="published"
                              datetime="${post.updateTime}">上次更新
                            · ${post.updateTime?string("yyyy-MM-dd hh:mm")} ·
                        </time>

                        <span class="post-item-tags">
                        <#if post.tags?? && post.tags?size gt 0>
                            <#list post.tags as tag>
                                <a href="${tag.fullPath}" data-ajax> #${tag.name!}&nbsp;&nbsp;</a>
                            </#list>
                        </#if>
                        </span>
                    </p>
                </div>

            </article>
        </#list>
    </#if>
</div>
