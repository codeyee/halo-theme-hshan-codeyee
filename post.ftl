<#include "module/macro.ftl">
<#--<#include "module/cy_blog_post.ftl">-->

<@layout title="${post.title!options.blog_title}">
    <div id="page" class="site post-template">
        <main class="site-main" id="main">
            <#--进度条-->
            <div id="readProgress">
                <div class="read-progress-bar" role="progressbar" style="width: 0"></div>
            </div>
            <div class="site-content post-page">
                <article class="post tag-getting-started" id="siteContent">
                    <#--                    <div id="postHeader"></div>-->

                    <#--文章头部信息-->
                    <header class="bg-cover post-header" id="postHeader">
                        <#if post.thumbnail?? && post.thumbnail!=''>
                            <div class="cover-bg">
                                <img src="${post.thumbnail!}" alt="${post.title!}"/>
                            </div>
                        <#else>
                            <div class="default-cover-bg">
                            </div>
                        </#if>
                        <div class="cover-content">
                            <div class="inner">
                                <div class="post-tags">
                                    <#if post.tags?? && post.tags?size gt 0>
                                        <#list post.tags as tag>
                                            <a href="${tag.fullPath!}" data-ajax>${tag.name!}
                                                &nbsp;&nbsp;&nbsp;</a>
                                        </#list>
                                    </#if>
                                </div>
                                <h1 class="post-title js-toc-ignore">${post.title}</h1>
                                <div class="post-meta">
                                    <span class="post-meta-wrap">
                                        <img class="author-avatar"
                                             srcset="${user.avatar!}, ${user.avatar!} 2x"
                                             src="${user.avatar!}" alt=""/>
                                        <span class="post-author">${post.visits} 次访问</span>
                                        <time class="published"
                                              datetime="${post.createTime?string("yyyy-MM-dd")}">${post.createTime?string("yyyy-MM-dd")}
                                        </time>
                                    </span>
                                    <div>${user.nickname!}</div>
                                </div>
                                <#if settings.enabled_visual_height!true>
                                    <a href="#post-content" class="arrow-down" data-scroll><span
                                                class="screen-reader-text">Scroll Down</span></a>
                                </#if>
                            </div>
                        </div>
                    </header>

                    <#--文章主题内容最外层的盒子-->
                    <div class="post-inner">
                        <#-- 主容器 -->
                        <div class="container px-lg-2 pb-3 bg-white">
                            <div class="row">
                                <#--Xue主题文章目录-->
                                <div id="tocFlag"></div>
                                <#if settings.post_toc!true>
                                    <aside id="toc" class="toc font-sans"></aside>
                                </#if>
                                <#--左侧-->
                                <div id="write" class="post-content-new md-content" class="col-lg-8 pr-xl-5 px-lg-3 px-4">
                                    <#-- 面包屑 -->
                                    <#include "module/post/breadcrumb.ftl">
                                    <#include "module/post/left.ftl">
                                </div>

                                <#-- 右侧 -->
                                <div id="right" class="col-lg-4">
                                    <#include "module/post/right.ftl">
                                </div>
                            </div>
                        </div>

                        <#--手机端目录-->
                        <div id="catalogButton" class="d-lg-none d-none" onclick="mobileCatalogControl()">
                            <span><i class="fas fa-bars"></i></span>
                        </div>
                        <#--手机上文章目录后面的蒙版-->
                        <div id="catalogOverBox" class="d-lg-none"></div>

                    </div>
                </article>
            </div>

        </main>
    </div>
    <style>
    </style>
    <script>
        // alert("测试")
        // $(window).scroll(function() {
        //     if(/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) {
        //         $('#catalogBox').css({
        //             'display' : 'none'
        //         })
        //
        //     }else{
        //
        //         if($(window).scrollTop() > 900) {    //具体数值根据需求来设
        //             $('#catalogBox').css({
        //                 "position": "fixed",
        //                 "top": "65px",
        //                 "width": "25%"
        //             })
        //             //正常情况
        //         } else {
        //             $('#catalogBox').css({
        //                 "position": "",
        //                 "top": "0px",
        //                 "width": "100%"
        //             })
        //         }
        //     }
        //
        // });
    </script>
</@layout>
