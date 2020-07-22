<#include "module/macro.ftl">
<@layout title="${blog_title!}">
    <div id="page" class="site">
        <main class="site-main" id="main">
            <div class="site-content home-content">
                <!-- 封面 -->
                <header class="bg-cover hero">
                    <#if settings.home_cover?? && settings.home_cover!=''>
                        <div class="cover-bg-index">
                            <img src="${settings.home_cover!}" alt="">
                        </div>
                    <#else>
                        <div class="default-cover-bg">
                        </div>
                    </#if>
                    <div class="cover-content">
                        <!-- 封面内容 -->
                        <div class="inner">
                            <h1 class="hero-title">${settings.home_title!options.blog_title!}</h1>
                            <p class="hero-text">${settings.home_description!}</p>
                            <#if settings.enabled_index_cover_height!true>
                                <a href="#postContainer" class="arrow-down" data-scroll><span
                                            class="screen-reader-text">Scroll Down</span></a>
                            </#if>
                        </div>
                    </div>
                </header>

                <!-- Main Content -->
                <div class="container">
                    <div class="row">
                        <!-- USE SIDEBAR -->
                        <!-- Post Container -->
                        <div class="
                                col-lg-8 col-lg-offset-1
                                col-md-8 col-md-offset-1
                                col-sm-12
                                col-xs-12
                                post-container
                            ">
                            <#--文章内容-->
                            <div id="postContainer">
                                <!-- post-list -->
                                <#if (settings.post_list_style!'standard') == 'standard'>
                                    <#include "module/post-list-style/standard.ftl">
                                <#elseif settings.post_list_style == 'simple'>
                                    <#include "module/post-list-style/simple.ftl">
                                <#else>
                                    <#include "module/post-list-style/random-card.ftl">
                                </#if>
                            </div>
                            <#if posts.totalPages gt 1>
                                <@paginationTag method="index" page="${posts.number}" total="${posts.totalPages}" display="3">
                                    <#include "module/pagination.ftl">
                                </@paginationTag>
                            </#if>
                        </div>
                        <!-- Sidebar Container -->
                        <div class="
                                col-lg-3 col-lg-offset-0
                                col-md-3 col-md-offset-0
                                col-sm-12
                                col-xs-12
                                sidebar-container
                            " style="padding: 20px;">
                            <!-- Featured Tags -->
                            <#if settings.sidebar_tags!true>
                                <section>
                                    <hr class="hidden-sm hidden-xs">
                                    <h5><a href="${tags_url!}">FEATURED TAGS >></a></h5>
                                    <div class="tags">
                                        <@tagTag method="list">
                                            <#if tags?? && tags?size gt 0>
                                                <#list tags as tag>
                                                    <a href="${tags_url!}/${tag.slug!}" title="${tag.name}"
                                                       rel="">
                                                        ${tag.name}
                                                    </a>
                                                </#list>
                                            </#if>
                                        </@tagTag>
                                    </div>
                                </section>
                            </#if>

                            <!-- Short About -->
                            <section class="visible-md visible-lg">
                                <hr>
                                <h5><a href="${blog_url!}/s/about">ABOUT ME >></a></h5>
                                <div class="short-about">
                                    <img src="${user.avatar!}"/>
                                    <p>${user.description!}</p>
                                    <!-- SNS Link -->
                                    <ul class="list-inline">
                                        <#if settings.rss!true>
                                            <li>
                                                <a href="${rss_url!}" title="RSS">
                                                    <span class="fa-stack fa-lg">
                                                        <i class="fa fa-circle fa-stack-2x"></i>
                                                        <i class="fa fa-rss fa-stack-1x fa-inverse"></i>
                                                    </span>
                                                </a>
                                            </li>
                                        </#if>
                                        <#if settings.twitter??>
                                            <li>
                                                <a href="${settings.twitter}" title="Twitter">
                                                    <span class="fa-stack fa-lg">
                                                        <i class="fa fa-circle fa-stack-2x"></i>
                                                        <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
                                                    </span>
                                                </a>
                                            </li>
                                        </#if>
                                        <#if settings.zhihu??>
                                            <li>
                                                <a target="_blank" href="${settings.zhihu}" title="知乎">
                                                    <span class="fa-stack fa-lg">
                                                        <i class="fa fa-circle fa-stack-2x"></i>
                                                        <i class="fa  fa-stack-1x fa-inverse">知</i>
                                                    </span>
                                                </a>
                                            </li>
                                        </#if>
                                        <#if settings.weibo??>
                                            <li>
                                                <a target="_blank" href="${settings.weibo}" title="微博">
                                                    <span class="fa-stack fa-lg">
                                                        <i class="fa fa-circle fa-stack-2x"></i>
                                                        <i class="fa fa-weibo fa-stack-1x fa-inverse"></i>
                                                    </span>
                                                </a>
                                            </li>
                                        </#if>
                                        <#if settings.facebook??>
                                            <li>
                                                <a target="_blank" href="${settings.facebook}" title="FaceBook">
                                                    <span class="fa-stack fa-lg">
                                                        <i class="fa fa-circle fa-stack-2x"></i>
                                                        <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
                                                    </span>
                                                </a>
                                            </li>
                                        </#if>
                                        <#if settings.bilibili??>
                                            <li>
                                                <a target="_blank" href="${settings.bilibili}" title="bilibili">
                                                    <span class="fa-stack fa-lg">
                                                        <i class="fa fa-circle fa-stack-2x"></i>
                                                        <i class="fa fa-stack-1x fa-width-90 biliFont fa-inverse">1</i>
                                                    </span>
                                                </a>
                                            </li>
                                        </#if>
                                        <#if settings.github??>
                                            <li>
                                                <a target="_blank" href="${settings.github}" title="GitHub">
                                                    <span class="fa-stack fa-lg">
                                                        <i class="fa fa-circle fa-stack-2x"></i>
                                                        <i class="fa fa-github fa-stack-1x fa-inverse"></i>
                                                    </span>
                                                </a>
                                            </li>
                                        </#if>
                                    </ul>
                                </div>
                            </section>
                            <!-- Friends Blog -->
                            <#if settings.sidebar_links!true>
                                <hr>
                                <h5><a href="${blog_url!}/links">FRIENDS >></a></h5>
                                <ul class="list-inline">
                                    <@linkTag method="list">
                                        <#if links?? && links?size gt 0>
                                            <#list links as link>
                                                <li><a href="${link.url}" target="_blank"
                                                       title="${link.description}">${link.name}</a></li>
                                            </#list>
                                        </#if>
                                    </@linkTag>
                                </ul>
                            </#if>
                        </div>
                    </div>
                </div>

            </div>
        </main>
    </div>
    <style>
    </style>
</@layout>