<#macro layout title>
    <!DOCTYPE html>
    <html lang="zh">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keywords" content="${meta_keywords!}"/>
        <meta name="description" content="${meta_description!}"/>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>

        <@global.head />

        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" type='text/css' media='all'/>
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/viewerjs@1.5.0/dist/viewer.min.css">
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/social-share.js@1.0.16/dist/css/share.min.css">
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/lightgallery@1.6.8/dist/css/lightgallery.min.css">
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/justifiedGallery@3.7.0/dist/css/justifiedGallery.min.css">

        <#--标题-->
        <title>${title}</title>


        <#--Hshan主题样式-->
        <link rel="stylesheet" href="${theme_base!}/assets/styles/main.min.css?ver=${.now?long}">

        <#--Xue主题样式-->
        <link rel="stylesheet" href="${theme_base!}/assets/styles/xue-style.min.css?ver=${.now?long}">

        <script type="text/javascript">
            var katex_config = {
                delimiters:
                    [
                        {left: "$$", right: "$$", display: true},
                        {left: "$", right: "$", display: false},
                        {left: "\\(", right: "\\)", display: false},
                        {left: "\\[", right: "\\]", display: true},
                    ]
            };
            var openToc = false;
            <#if settings.post_toc!true>
            openToc = true;
            </#if>
        </script>
        <#--标签云页面引入hux样式-->
        <#if is_tags??>
            <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/bootstrap@3.3.2/dist/css/bootstrap.min.css">
            <link rel="stylesheet" href="${theme_base!}/source/css/hux-blog.min.css">
            <script type="text/javascript" src="${theme_base!}/source/js/archive.js"></script>
            <style>
                .page-header {
                    margin: 0;
                }
            </style>
        </#if>

        <#--index引入hux的样式-->
        <#if is_index??>
            <link rel="stylesheet" href="${theme_base!}/source/css/hux-blog.min.css">
            <!-- Bootstrap Core CSS -->
            <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/bootstrap@3.3.2/dist/css/bootstrap.min.css">
        </#if>

        <#--引用CY-BLOG需要的一些样式与脚本-->
        <#--文章界面需要引入的CSS-->
        <#if is_post??>
            <#--Github MarkDown的引入-->
            <link rel="stylesheet" href="${theme_base!}/source/css/github-markdown.css">
            <link rel="stylesheet" href="${theme_base!}/source/css/post.css">
            <#--BootStrap CSS-->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha256-L/W5Wfqfa0sdBNIKN9cG6QA5F2qx4qICmU2VgLruv9Y=" crossorigin="anonymous">
            <#--Font Awesome 图标库-->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.12.1/css/all.min.css" integrity="sha256-mmgLkCYLUQbXn0B1SRqzHar6dCnv9oZFPEC1g1cwlkk=" crossorigin="anonymous">
             <#--代码高亮用到的CSS-->
            <link href="${settings.code_css_url!'https://cdn.staticfile.org/highlight.js/9.18.1/styles/github.min.css'}"
                  rel="stylesheet">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" integrity="sha256-Vzbj7sDDS/woiFS3uNKo8eIuni59rjyNGtXfstRzStA=" crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/social-share.js@1.0.16/dist/css/share.min.css" integrity="sha256-0EDwznjUTDEicOuZhOL03fpflUqzhkByvhwol8YGkp4=" crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.12.1/css/all.min.css" integrity="sha256-mmgLkCYLUQbXn0B1SRqzHar6dCnv9oZFPEC1g1cwlkk=" crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdn.staticfile.org/highlight.js/9.18.1/styles/monokai-sublime.min.css">
             <#--页面公用的CSS-->
            <link rel="stylesheet" href="${theme_base!}/source/css/style.css">

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

                .circle {
                    line-height: 0;
                }
                /*解决目录无法使用sticky的问题*/
                .site{
                    overflow: unset;
                }
            </style>
        </#if>

        <script language=javascript>
            <!--
            window.onerror=function(){return true;}
            // -->
        </script>

        <style>
            :root {
                --post-max-width: ${settings.post_max_wdth!'800px'} !important;
                --content-font-size: ${settings.content_font_size!'1.12rem'} !important;
                --content-line-height: ${settings.content_line_height!'2rem'} !important;
                --base-color: ${settings.base_color!'#2474b5'};
                --post-head-color: rgb(219, 219, 226);
                --toc-bg-color: #8e8787;
                --night-toc-bg-color: #e5e5e5;
                --tag-bg-color: #ff5f5f;
                --header-bg-color: #fff;
                --header-child-hover-bg-color: #f5f5f5;
                --index-title-color: #555;
                --base-font-color: #34495e;
                --summary-color: #81878f;
                --night-input-color: #a9a9b3;
                --night-background: #292a2d;
                --night-color: #a9a9b3;
                --night-input-backgrround: #232125;
                --color: #333333;
                --background: #f7f7f7;
                --dark-backgound: #232125;
                --cardbgcolor: #fff;
                --cardcolor: #333;
                --cardtitlecolor: #333333;
                --navbarcolor: #333333;
                --navbarbgcolor: rgba(255, 255, 255, 0.7);
                --img-default-filter: none;
                --img-hover-filter: none;
                --btn-bg-color: whitesmoke;
                --btn-color: #333333;
                --btn-hover-color: #eeeeee;
                --link-color: #42b983;
                --link-hover-color: #42b983;
                --code-bg-color: #F1F3F3;
                --code-default-color: #A2A1A1;
                --code-line-numbers-bg-color: #EBEDED;
                --code-line-numbers-color: #888;
                --code-keyworks-color: #7012cc;
                --code-class-color: #f2777a;
                --code-cdata-color: hsl(313, 67%, 36%);
                --code-symbol-color: hsl(33, 83%, 45%);
                --code-variable-color: hsl(281, 89%, 64%);
                --code-regex-color: #e90;
                --code-deleted-color: red;
                --code-toolbar-bg-color: #EBEDED;
                --code-toolbar-color: #1485FE;
                --code-line-numbers-rows-color: #888;
                --toc-dot-color: #1485FE;
                --toc-dot-active-color: #1485FE;
                --toc-dot-active-bg-color: #ebedef;
                --toc-vertical-line-color: #1485FE;
                --toc-item-bg-hover: #1485FE;
                --code-dark-color: #969896;
                --code-dark-bg-color: #2d2d2d;
                --code-dark-line-numbers-bg-color: #333333;
                --code-dark-keywords-color: #cc99cd;
                --code-dark-class-color: #e2777a;
                --code-dark-cdata-color: #999;
                --code-dark-symbol-color: #f8c555;
                --code-dark-variable-color: #67cdcc;
            }

            <#--向英雄致敬-->
            <#if settings.xiang_ying_xiong_zhi_jing!false>
                html {
                    -webkit-filter: grayscale(100%);
                    -moz-filter: grayscale(100%);
                    -ms-filter: grayscale(100%);
                    -o-filter: grayscale(100%);
                    filter: grayscale(100%);
                    filter: progid:DXImageTransform.Microsoft.BasicImage(grayscale=1);
                }
            </#if>

            <#if settings.custom_scroller!true>
            /*定义滚动条高宽及背景 高宽分别对应横竖滚动条的尺寸*/
            ::-webkit-scrollbar {
                width: 5px;
                height: 5px;
                background-color: #eee;
            }

            #siteHeader::-webkit-scrollbar {
                width: 0;
                opacity: 0;
            }

            /*定义滚动条轨道 内阴影+圆角*/
            ::-webkit-scrollbar-track {
                border-radius: 10px;
                background-color: #eee;
            }

            /*定义滑块 内阴影+圆角*/
            ::-webkit-scrollbar-thumb {
                border-radius: 10px;
                background-color: ${settings.base_color?default('#2474b5')};
            }

            </#if>

            <#if settings.enabled_visual_height!true>
            @media only screen and (min-width: 861px) {
                .post-template .bg-cover {
                    height: 100vh !important;
                }
            }

            </#if>

            <#if settings.enabled_index_cover_height!true>
            @media only screen and (min-width: 861px) {
                .home-content .bg-cover {
                    height: 100vh !important;
                }
            }

            </#if>

        </style>
<#--        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/highlight.js@9.12.0/styles/atom-one-light.css">-->
<#--        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/loaders.css@0.1.2/loaders.min.css">-->
        <#if settings.Aplayer?? && settings.Aplayer != ''>
            <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/aplayer@1.10.1/dist/APlayer.min.css">
        </#if>
        <#if settings.enabled_mathjax!true>
            <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/katex@0.11.1/dist/katex.min.css" >
        </#if>
        <#if settings.Custom_css_src??>
            <!-- 自定义css -->
            <link rel="stylesheet" href="${settings.Custom_css_src!}">
        </#if>
        <#if settings.Custom_css??>
            <!-- 自定义css -->
            <style type="text/css">
                ${settings.Custom_css!}
            </style>
        </#if>

        <#if settings.Custom_js_head??>
            <!-- 自定义js -->
            <script type="text/javascript">
                ${settings.Custom_js_head!}
            </script>
        </#if>

    </head>

    <body>
    <#--通用头部内容-->
    <#include "header.ftl">

    <#nested >
    <!-- 公共BootStrap支持使用的JavaScript -->
    <#--            <script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>-->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha256-/ijcOLwFf26xEYAjW75FizKVo5tnTYiQddPZoLUHHZ8=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha256-WqU1JavFxSAMcLP2WIOI+GB2zWmShMI82mTpLDcqFUg=" crossorigin="anonymous"></script>
    <#--CYBLOG全局的JavaScript脚本-->
    <script type="text/javascript" src="${theme_base!}/source/js/index.js"></script>

    <#--右下角按钮-->
    <#include "menu.ftl">

    <#--通用的底部内容-->
    <#include "footer.ftl">

    <#-- 额外配置功能-->
    <#if is_post?? || is_sheet??>
        <script>
            var displayReadProgress = <#if (settings.open_read_progress)??>${settings.open_read_progress?c}<#else>true</#if>;
            var displayLineNumber = <#if (settings.line_number)??>${settings.line_number?c}<#else>true</#if>;
            var enableCodeCopy = <#if (settings.code_copy)??>${settings.code_copy?c}<#else>true</#if>;
            var displayCodeType = <#if (settings.code_type)??>${settings.code_type?c}<#else>true</#if>;
            <#--var displayMobileCatalog = <#if (settings.mobile_catalog)??>${settings.mobile_catalog?c}<#else>true</#if>;-->
            var displayMobileCatalog = <#if (settings.mobile_catalog)??>true<#else>false</#if>;
            var linkOnBlackPage = <#if (settings.link_on_blank_page)??>${settings.link_on_blank_page?c}<#else>true</#if>;
            var enableShare = <#if (settings.open_share)??>${settings.open_share?c}<#else>true</#if>;
            var twitterAccountShare = `${settings.twitter_account_share!}`;
            var postTitle = `${post.title!}`;
            var blogTitle = `${blog_title!}`;
            var blogUrl = `${blog_url!}`;
        </script>
        <script>
            // 为了提速，写在这里
            // pre默认背景色，
            $("article pre").addClass("hljs");
            // 表格响应式
            $("table").wrap(`<div class="table-responsive"></div>`);
        </script>
        <script src="https://cdn.jsdelivr.net/npm/social-share.js@1.0.16/dist/js/social-share.min.js" integrity="sha256-fGPu+icKh985TLPhO2v68U7i0CW0dE4kiR06RN4O6jo=" crossorigin="anonymous"></script>
    </#if>
    <#--代码高亮库-->
    <#if is_post??>
         <#--回到顶部浮窗按钮-->
<#--        <div id="backTop" class="back-top">-->
<#--            <span><i class="fas fa-caret-up"></i></span>-->
<#--        </div>-->
        <script src="https://cdn.jsdelivr.net/npm/clipboard@2.0.4/dist/clipboard.min.js" integrity="sha256-FiZwavyI2V6+EXO1U+xzLG3IKldpiTFf3153ea9zikQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js" integrity="sha256-yt2kYMy0w8AbtF89WXb2P1rfjcP/HTHLT7097U8Y5b8=" crossorigin="anonymous"></script>
        <script type="text/javascript" src="${theme_base!}/source/js/post.js"></script>
    <#--官方库的语言种类目前有185种
    1c、abnf、accesslog、actionscript、ada、angelscript、apache、applescript、arcade、arduino、armasm、
    asciidoc、aspectj、autohotkey、autoit、avrasm、awk、axapta、bash、basic、bnf、brainfuck、cal、capnproto、
    ceylon、clean、clojure-repl、clojure、cmake、coffeescript、coq、cos、cpp、crmsh、crystal、cs、csp、css、
    d、dart、delphi、diff、django、dns、dockerfile、dos、dsconfig、dts、dust、ebnf、elixir、elm、erb、erlang-repl、
    erlang、excel、fix、flix、fortran、fsharp、gams、gauss、gcode、gherkin、glsl、gml、go、golo、gradle、groovy、
    haml、handlebars、haskell、haxe、hsp、htmlbars、http、hy、inform7、ini、irpf90、isbl、java、javascript、
    jboss-cli、json、julia-repl、julia、kotlin、lasso、ldif、leaf、less、lisp、livecodeserver、livescript、
    llvm、lsl、lua、makefile、markdown、mathematica、matlab、maxima、mel、mercury、mipsasm、mizar、mojolicious、
    monkey、moonscript、n1ql、nginx、nimrod、nix、nsis、objectivec、ocaml、openscad、oxygene、parser3、perl、pf、
    pgsql、php、plaintext、pony、powershell、processing、profile、prolog、properties、protobuf、puppet、purebasic、
    python、q、qml、r、reasonml、rib、roboconf、routeros、rsl、ruby、ruleslanguage、rust、sas、scala、scheme、scilab、
    scss、shell、smali、smalltalk、sml、sqf、sql、stan、stata、step21、stylus、subunit、swift、taggerscript、tap、
    tcl、tex、thrift、tp、twig、typescript、vala、vbnet、vbscript-html、vbscript、verilog、vhdl、vim、x86asm、xl、
    xml、xquery、yaml、zephir
    -->
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/highlight.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/accesslog.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/actionscript.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/apache.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/aspectj.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/awk.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/bash.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/basic.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/coffeescript.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/cpp.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/css.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/dart.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/delphi.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/django.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/dns.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/dockerfile.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/dos.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/erlang-repl.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/erlang.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/go.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/gradle.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/groovy.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/http.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/ini.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/java.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/javascript.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/json.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/kotlin.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/less.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/lua.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/markdown.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/nginx.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/objectivec.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/perl.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/php.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/plaintext.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/powershell.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/properties.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/python.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/ruby.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/scala.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/scheme.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/scss.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/shell.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/smali.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/sql.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/swift.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/typescript.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/vbscript.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/vim.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/xml.min.js"></script>
        <script src="https://cdn.staticfile.org/highlight.js/9.18.1/languages/yaml.min.js"></script>
        <script>hljs.initHighlightingOnLoad();</script>
    </#if>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js" integrity="sha256-yt2kYMy0w8AbtF89WXb2P1rfjcP/HTHLT7097U8Y5b8=" crossorigin="anonymous"></script>
    <script src="${theme_base!}/assets/media/scripts/utils.min.js?ver=${.now?long}"></script>
    <!-- jquery.tagcloud.js -->

    <#include "script.ftl">


    <!-- 右下角按钮-->
    <script src="${theme_base!}/source/js/xue/moon-menu.js?ver=2020008092122"></script>

    <#--Xue主题文章页面脚本-->
    <script type="text/javascript" src="${theme_base!}/source/js/xue-post.js"></script>



    <#--HUX主题标签云-->
    <script>
        function async(u, c) {
            var d = document, t = 'script',
                o = d.createElement(t),
                s = d.getElementsByTagName(t)[0];
            o.src = u;
            if (c) {
                o.addEventListener('load', function (e) {
                    c(null, e);
                }, false);
            }
            s.parentNode.insertBefore(o, s);
        }
    </script>

    <!-- jquery.tagcloud.js -->
    <script>
        // only load tagcloud.js in tag.html
        if ($('#tag_cloud').length !== 0) {
            async("${theme_base!}/source/js/jquery.tagcloud.js", function () {
                $.fn.tagcloud.defaults = {
                    //size: {start: 1, end: 1, unit: 'em'},
                    color: {start: '#bbbbee', end: '#0085a1'},
                };
                $('#tag_cloud a').tagcloud();
            })
        }
    </script>

    <#--防止其他引入其他样式导致一些默认样式被替换,在这里重新覆盖-->
    <style>
        a:hover{
            text-decoration: none;
            color: var(--base-color);
        }
        a {
            color: var(--base-color);
            text-decoration: none;
        }
    </style>

    </html>
</#macro>

