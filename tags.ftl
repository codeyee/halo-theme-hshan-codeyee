<#include "module/macro.ftl">
<@layout title="${settings.tags_title!'标签列表'} | ${blog_title!}">
    <div id="page" class="site">
        <main class="site-main" id="main">
            <div class="site-content">
                <header class="bg-cover page-header">
                    <#if settings.tag_patternimg?? && settings.tag_patternimg!=''>
                        <div class="cover-bg">
                            <img src="${settings.tag_patternimg!}" alt="${settings.tags_title!'标签列表'}">
                        </div>
                    <#else>
                        <div class="default-cover-bg">
                        </div>
                    </#if>
                    <div class="cover-content">
                        <div class="inner">
                            <div class="post-count"></div>
                            <h1 class="page-title" style="font-size: 46px;">${settings.tags_title!'标签'}</h1>
                        </div>
                    </div>
                </header>

                <#--标签云-->
                <!-- Main Content -->
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                            <!-- 标签云 -->
                            <div id='tag_cloud' class="tags tags-sup js-tags">
                                <@tagTag method="list">
                                    <#if tags?? && tags?size gt 0>
                                        <a class="tag-button--all" data-encode="">
                                            Show All
                                            <@postTag method="count">
                                                <sup>${count}</sup>
                                            </@postTag>
                                        </a>
                                        <#list tags?sort_by('postCount')?reverse as tag>
                                            <a class="tag-button"
                                               data-encode="${tag.slug}"
                                               title="${tag.name}"
                                               rel="${tag.postCount}">${tag.name}
                                                <sup>${tag.postCount}</sup>
                                            </a>
                                        </#list>
                                    </#if>
                                </@tagTag>
                            </div>
                            <div class="mini-post-list js-result">
                                <@postTag method="archiveYear">
                                    <#list archives as archive>
                                        <section>
                        <span class="fa listing-seperator">
					    <span class="tag-text">${archive.year?c}</span>
                        <#list archive.posts as post>
                            <#assign postTags>
                                <@tagTag method="listByPostId" postId="${post.id?c}">
                                    <#if tags?? && tags?size gt 0>
                                        <#list tags as tag>
                                            ${tag.slug}<#sep>,<#t>
                                        </#list>
                                    </#if>
                                </@tagTag>
                            </#assign>
                            <div class="post-preview item" data-tags="${postTags!''}">
                                <a href="${post.fullPath!}">
                                    <h2 class="post-title">
                                        ${post.title!}
                                    </h2>
                                </a>
                                <hr>
                            </div>
                        </#list>
                                        </section>
                                    </#list>
                                </@postTag>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</@layout>
