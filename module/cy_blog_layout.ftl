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

        <#--引用CY-BLOG需要的一些样式与脚本-->
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
            <script src="https://cdn.jsdelivr.net/npm/clipboard@2.0.4/dist/clipboard.min.js" integrity="sha256-FiZwavyI2V6+EXO1U+xzLG3IKldpiTFf3153ea9zikQ=" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js" integrity="sha256-yt2kYMy0w8AbtF89WXb2P1rfjcP/HTHLT7097U8Y5b8=" crossorigin="anonymous"></script>
            <script type="text/javascript" src="${theme_base!}/source/js/post.js"></script>
        <#--代码高亮库-->
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
        <#--BootStrap CSS-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha256-L/W5Wfqfa0sdBNIKN9cG6QA5F2qx4qICmU2VgLruv9Y=" crossorigin="anonymous">
        <#--Font Awesome 图标库-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.12.1/css/all.min.css" integrity="sha256-mmgLkCYLUQbXn0B1SRqzHar6dCnv9oZFPEC1g1cwlkk=" crossorigin="anonymous">
        <!-- 公共BootStrap支持使用的JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha256-/ijcOLwFf26xEYAjW75FizKVo5tnTYiQddPZoLUHHZ8=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha256-WqU1JavFxSAMcLP2WIOI+GB2zWmShMI82mTpLDcqFUg=" crossorigin="anonymous"></script>


    </head>

    </html>
</#macro>