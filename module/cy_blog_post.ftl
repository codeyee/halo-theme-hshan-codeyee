<#--用来做HTML大概的框架，和一些重要的css和js文件的引入-->
<#macro layout title>
    <!DOCTYPE html>
    <html lang="zh">
    <head>
        <meta charset="UTF-8">
        <#--防止用户缩放-->
        <meta name="viewport"
              content="width=device-width,
              initial-scale=1,
              minimum-scale=1.0,
              maximum-scale=1.0,
              user-scalable=no,
              shrink-to-fit=no">
        <meta name="keywords" content="${meta_keywords!}"/>
        <meta name="description" content="${meta_description!}"/>
        <meta name="site" content="${blog_url!}"/>

        <#--BootStrap CSS-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha256-L/W5Wfqfa0sdBNIKN9cG6QA5F2qx4qICmU2VgLruv9Y=" crossorigin="anonymous">
        <#--Font Awesome 图标库-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.12.1/css/all.min.css" integrity="sha256-mmgLkCYLUQbXn0B1SRqzHar6dCnv9oZFPEC1g1cwlkk=" crossorigin="anonymous">
        <#--主页添加的CSS-->
        <#if is_index?? || is_search?? || is_category?? || is_tag?? || is_sheet??>
            <link rel="stylesheet" href="${theme_base!}/source/css/index.css">
            <style>
                /* 列表项中a标签划过样式 */
                .list-item a:hover {
                    color: ${settings.hover_color!'#dc3545'} !important;
                }

                /* 搜索高亮颜色 */
                .search-highlight {
                    color: ${settings.link_color!'#007bff'} !important;
                }

                /* 搜索高亮划过色 */
                a:hover .search-highlight {
                    color: ${settings.hover_color!'#dc3545'} !important;
                }
            </style>
        </#if>
        <#--归档界面添加的CSS-->
        <#if is_archives?? || is_tags?? || is_categories??>
            <link rel="stylesheet" href="${theme_base!}/source/css/time-line.css">
            <style>
                /* 列表盒子中每一个a标签的划过样式 */
                ul.title-list li a:hover {
                    color: ${settings.hover_color!'#dc3545'} !important;
                }

                /* 导航盒子中的链接划过样式 */
                #navigationList a:hover {
                    color: ${settings.hover_color!'#dc3545'} !important;
                }
            </style>
        </#if>
        <#if is_category??>
            <link rel="stylesheet" href="${theme_base!}/source/css/category.css">
        </#if>
        <#--文章界面需要引入的CSS-->
        <#if is_post??>
        <#--Github MarkDown的引入-->
            <link rel="stylesheet" href="${theme_base!}/source/css/github-markdown.css">
            <link rel="stylesheet" href="${theme_base!}/source/css/post.css">
        <#--代码高亮用到的CSS-->
            <link href="${settings.code_css_url!'https://cdn.staticfile.org/highlight.js/9.18.1/styles/github.min.css'}"
                  rel="stylesheet">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" integrity="sha256-Vzbj7sDDS/woiFS3uNKo8eIuni59rjyNGtXfstRzStA=" crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/social-share.js@1.0.16/dist/css/share.min.css" integrity="sha256-0EDwznjUTDEicOuZhOL03fpflUqzhkByvhwol8YGkp4=" crossorigin="anonymous">
            <style>

                article pre code {
                    font-family: ${settings.code_font_family!'"SFMono-Regular", Consolas, "Liberation Mono", Menlo, Courier, monospace'} !important;
                }

                /* 目录链接划过样式 */
                #catalogs p a:hover {
                    color: ${settings.hover_color!'#dc3545'} !important;
                }

                /* 目录被激活的时候的样式 */
                .catalog-active {
                    color: ${settings.hover_color!'#dc3545'} !important;
                }

                /* 鼠标滑过复制按钮的时候的颜色 */
                .btn-clipboard:hover {
                    opacity: 1;
                    background: ${settings.link_color!'#007bff'} !important;
                }

                /* 文章中的标题标签划过的颜色 */
                #content article h1:hover, h2:hover, h3:hover, h4:hover, h5:hover, h6:hover {
                    cursor: pointer;
                    color: ${settings.hover_color!'#dc3545'} !important;
                }

                /* 阅读进度的进度条颜色 */
                #readProgress .read-progress-bar {
                    background: ${settings.progress_color!'#dc3545'} !important;
                    height: 0.1875rem;
                }
            </style>
        </#if>
        <#--日志界面的样式-->
        <#if is_journal?? || is_journals??>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" integrity="sha256-Vzbj7sDDS/woiFS3uNKo8eIuni59rjyNGtXfstRzStA=" crossorigin="anonymous">
            <link rel="stylesheet" href="${theme_base!}/source/css/journals.css">
            <style>
                /*用户的操作链接划过颜色*/
                .journals .journal-item .journal-operation a:hover {
                    color: ${settings.hover_color!'#dc3545'} !important;
                }
            </style>
        </#if>
        <#if is_sheet??>
            <link rel="stylesheet" href="${theme_base!}/source/css/sheet.css">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/social-share.js@1.0.16/dist/css/share.min.css" integrity="sha256-0EDwznjUTDEicOuZhOL03fpflUqzhkByvhwol8YGkp4=" crossorigin="anonymous">
        </#if>
        <#--页面公用的CSS-->
        <link rel="stylesheet" href="${theme_base!}/source/css/style.css">

        <style>
            /* 定义滚动条滑块颜色 */
            ::-webkit-scrollbar-thumb {
                background-color: ${settings.scrollbar_background_color!'#6c757d'} !important;
            }

            /* 全局a标签的颜色 */
            a {
                color: ${settings.link_color!'#007bff'};
                text-decoration: none !important;
            }

            /* 全局a标签划过的样式 */
            a:hover {
                color: ${settings.hover_color!'#dc3545'};
                text-decoration: none !important;
            }

            /* 面包屑里面的链接划过的样式 */
            .breadcrumb a:hover {
                color: ${settings.hover_color!'#dc3545'} !important;
                text-decoration: none !important;
            }

            /* 页面footer的链接划过样式 */
            footer .link-info a:hover {
                color: ${settings.hover_color!'#dc3545'} !important;
            }
        </style>

        <#--公共 head 代码，包含：Favicon，站点验证代码-->
        <@global.head />

        <title>${title}</title>

    </head>

    <body>
        <#include "header.ftl">

        <#nested >

        <#include "footer.ftl">
    </body>
    </html>
</#macro>