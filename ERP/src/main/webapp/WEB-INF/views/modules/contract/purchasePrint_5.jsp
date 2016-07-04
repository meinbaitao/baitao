<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">

<title></title>
<script type="text/javascript"
	src="${ctxStatic}/jquery-validation/1.11.1/lib/jquery-1.7.2.js"></script>
<script type="text/javascript" src="${ctxStatic}/common/common_service.js "></script>
<script type="text/javascript" src="${ctxStatic}/common/common.js "></script>
<script type="text/javascript" src="${ctxStatic}/common/jeesite.js "></script>
<style>
<!-- /* Font Definitions */
@font-face {
	font-family: 宋体;
	panose-1: 2 1 6 0 3 1 1 1 1 1;
	mso-font-alt: SimSun;
	mso-font-charset: 134;
	mso-generic-font-family: auto;
	mso-font-pitch: variable;
	mso-font-signature: 3 680460288 22 0 262145 0;
}

@font-face {
	font-family: 黑体;
	panose-1: 2 1 6 9 6 1 1 1 1 1;
	mso-font-alt: SimHei;
	mso-font-charset: 134;
	mso-generic-font-family: modern;
	mso-font-format: other;
	mso-font-pitch: fixed;
	mso-font-signature: 1 135135232 16 0 262144 0;
}

@font-face {
	font-family: "Cambria Math";
	panose-1: 0 0 0 0 0 0 0 0 0 0;
	mso-font-charset: 1;
	mso-generic-font-family: roman;
	mso-font-format: other;
	mso-font-pitch: variable;
	mso-font-signature: 0 0 0 0 0 0;
}

@font-face {
	font-family: 隶书;
	panose-1: 2 1 5 9 6 1 1 1 1 1;
	mso-font-charset: 134;
	mso-generic-font-family: modern;
	mso-font-pitch: fixed;
	mso-font-signature: 1 135135232 16 0 262144 0;
}

@font-face {
	font-family: 仿宋_GB2312;
	mso-font-alt: 仿宋;
	mso-font-charset: 134;
	mso-generic-font-family: modern;
	mso-font-pitch: fixed;
	mso-font-signature: 1 135135232 16 0 262144 0;
}

@font-face {
	font-family: 楷体_GB2312;
	mso-font-charset: 134;
	mso-generic-font-family: modern;
	mso-font-pitch: fixed;
	mso-font-signature: 1 135135232 16 0 262144 0;
}

@font-face {
	font-family: 微软雅黑;
	panose-1: 2 11 5 3 2 2 4 2 2 4;
	mso-font-charset: 134;
	mso-generic-font-family: swiss;
	mso-font-pitch: variable;
	mso-font-signature: -2147483001 672087122 22 0 262175 0;
}

@font-face {
	font-family: "\@微软雅黑";
	panose-1: 2 11 5 3 2 2 4 2 2 4;
	mso-font-charset: 134;
	mso-generic-font-family: swiss;
	mso-font-pitch: variable;
	mso-font-signature: -2147483001 672087122 22 0 262175 0;
}

@font-face {
	font-family: "\@宋体";
	panose-1: 2 1 6 0 3 1 1 1 1 1;
	mso-font-charset: 134;
	mso-generic-font-family: auto;
	mso-font-pitch: variable;
	mso-font-signature: 3 680460288 22 0 262145 0;
}

@font-face {
	font-family: "\@黑体";
	panose-1: 2 1 6 9 6 1 1 1 1 1;
	mso-font-charset: 134;
	mso-generic-font-family: modern;
	mso-font-pitch: fixed;
	mso-font-signature: -2147482945 953122042 22 0 262145 0;
}

@font-face {
	font-family: "\@楷体_GB2312";
	mso-font-charset: 134;
	mso-generic-font-family: modern;
	mso-font-pitch: fixed;
	mso-font-signature: 1 135135232 16 0 262144 0;
}

@font-face {
	font-family: "\@隶书";
	panose-1: 2 1 5 9 6 1 1 1 1 1;
	mso-font-charset: 134;
	mso-generic-font-family: modern;
	mso-font-pitch: fixed;
	mso-font-signature: 1 135135232 16 0 262144 0;
}

@font-face {
	font-family: "\@仿宋_GB2312";
	mso-font-charset: 134;
	mso-generic-font-family: modern;
	mso-font-pitch: fixed;
	mso-font-signature: 1 135135232 16 0 262144 0;
}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal {
	mso-style-unhide: no;
	mso-style-qformat: yes;
	mso-style-parent: "";
	margin: 0cm;
	margin-bottom: .0001pt;
	text-align: justify;
	text-justify: inter-ideograph;
	mso-pagination: none;
	font-size: 10.5pt;
	mso-bidi-font-size: 12.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 宋体;
	mso-font-kerning: 1.0pt;
}

h1 {
	mso-style-unhide: no;
	mso-style-qformat: yes;
	mso-style-link: "标题 1 Char";
	mso-style-next: 正文缩进;
	margin: 0cm;
	margin-bottom: .0001pt;
	text-align: justify;
	text-justify: inter-ideograph;
	text-indent: 1.0cm;
	line-height: 150%;
	mso-pagination: lines-together;
	page-break-after: avoid;
	mso-outline-level: 1;
	mso-list: l3 level1 lfo2;
	tab-stops: list 46.35pt;
	layout-grid-mode: char;
	font-size: 14.0pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 隶书;
	mso-font-kerning: 14.0pt;
	font-weight: bold;
	mso-bidi-font-weight: normal;
}

h2 {
	mso-style-unhide: no;
	mso-style-qformat: yes;
	mso-style-link: "标题 2 Char";
	mso-style-next: 正文缩进;
	margin: 0cm;
	margin-bottom: .0001pt;
	text-align: justify;
	text-justify: inter-ideograph;
	text-indent: 1.0cm;
	line-height: 150%;
	mso-pagination: lines-together;
	page-break-after: avoid;
	mso-outline-level: 2;
	mso-list: l2 level1 lfo1;
	tab-stops: list 64.35pt;
	layout-grid-mode: char;
	font-size: 14.0pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Arial", "sans-serif";
	mso-bidi-font-family: "Times New Roman";
	mso-font-kerning: 1.0pt;
	font-weight: bold;
	mso-bidi-font-weight: normal;
}

h3 {
	mso-style-unhide: no;
	mso-style-qformat: yes;
	mso-style-link: "标题 3 Char";
	mso-style-next: 正文缩进;
	margin-top: 0cm;
	margin-right: 0cm;
	margin-bottom: 0cm;
	margin-left: 1.0cm;
	margin-bottom: .0001pt;
	text-align: justify;
	text-justify: inter-ideograph;
	line-height: 150%;
	mso-pagination: lines-together;
	page-break-after: avoid;
	mso-outline-level: 3;
	layout-grid-mode: char;
	font-size: 14.0pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 仿宋_GB2312;
	mso-font-kerning: 1.0pt;
	font-weight: bold;
	mso-bidi-font-weight: normal;
}

h4 {
	mso-style-unhide: no;
	mso-style-qformat: yes;
	mso-style-parent: "";
	mso-style-link: "标题 4 Char";
	margin: 0cm;
	margin-bottom: .0001pt;
	line-height: 110%;
	mso-pagination: widow-orphan;
	mso-outline-level: 4;
	font-size: 10.5pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Times New Roman", "serif";
	font-weight: normal;
}

h5 {
	mso-style-unhide: no;
	mso-style-qformat: yes;
	mso-style-parent: "";
	mso-style-link: "标题 5 Char";
	margin: 0cm;
	margin-bottom: .0001pt;
	line-height: 110%;
	mso-pagination: none;
	mso-outline-level: 5;
	font-size: 10.5pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Times New Roman", "serif";
	font-weight: normal;
}

p.MsoHeading8, li.MsoHeading8, div.MsoHeading8 {
	mso-style-name: "标题 8\,正文分项目";
	mso-style-unhide: no;
	mso-style-qformat: yes;
	mso-style-link: "标题 8 Char\,正文分项目 Char";
	margin: 0cm;
	margin-bottom: .0001pt;
	text-indent: 21.25pt;
	line-height: 125%;
	mso-pagination: none;
	mso-outline-level: 8;
	mso-list: l0 level1 lfo3;
	tab-stops: list 39.25pt;
	font-size: 10.5pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 宋体;
}

p.MsoToc1, li.MsoToc1, div.MsoToc1 {
	mso-style-unhide: no;
	mso-style-next: 正文;
	margin-top: 6.0pt;
	margin-right: 0cm;
	margin-bottom: 6.0pt;
	margin-left: 0cm;
	mso-pagination: none;
	font-size: 12.0pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 隶书;
	mso-font-kerning: 1.0pt;
	font-weight: bold;
	mso-bidi-font-weight: normal;
}

p.MsoToc2, li.MsoToc2, div.MsoToc2 {
	mso-style-unhide: no;
	mso-style-next: 正文;
	margin-top: 0cm;
	margin-right: 0cm;
	margin-bottom: 0cm;
	margin-left: 10.5pt;
	margin-bottom: .0001pt;
	mso-pagination: none;
	font-size: 12.0pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 仿宋_GB2312;
	mso-font-kerning: 1.0pt;
	font-weight: bold;
	mso-bidi-font-weight: normal;
}

p.MsoToc3, li.MsoToc3, div.MsoToc3 {
	mso-style-unhide: no;
	mso-style-next: 正文;
	margin-top: 0cm;
	margin-right: 0cm;
	margin-bottom: 0cm;
	margin-left: 21.0pt;
	margin-bottom: .0001pt;
	mso-pagination: none;
	font-size: 12.0pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 仿宋_GB2312;
	mso-font-kerning: 1.0pt;
}

p.MsoToc4, li.MsoToc4, div.MsoToc4 {
	mso-style-update: auto;
	mso-style-unhide: no;
	mso-style-next: 正文;
	margin-top: 0cm;
	margin-right: 0cm;
	margin-bottom: 0cm;
	margin-left: 31.5pt;
	margin-bottom: .0001pt;
	mso-pagination: none;
	font-size: 9.0pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 宋体;
	mso-font-kerning: 1.0pt;
}

p.MsoToc5, li.MsoToc5, div.MsoToc5 {
	mso-style-update: auto;
	mso-style-unhide: no;
	mso-style-next: 正文;
	margin-top: 0cm;
	margin-right: 0cm;
	margin-bottom: 0cm;
	margin-left: 42.0pt;
	margin-bottom: .0001pt;
	mso-pagination: none;
	font-size: 9.0pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 宋体;
	mso-font-kerning: 1.0pt;
}

p.MsoToc6, li.MsoToc6, div.MsoToc6 {
	mso-style-update: auto;
	mso-style-unhide: no;
	mso-style-next: 正文;
	margin-top: 0cm;
	margin-right: 0cm;
	margin-bottom: 0cm;
	margin-left: 52.5pt;
	margin-bottom: .0001pt;
	mso-pagination: none;
	font-size: 9.0pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 宋体;
	mso-font-kerning: 1.0pt;
}

p.MsoToc7, li.MsoToc7, div.MsoToc7 {
	mso-style-update: auto;
	mso-style-unhide: no;
	mso-style-next: 正文;
	margin-top: 0cm;
	margin-right: 0cm;
	margin-bottom: 0cm;
	margin-left: 63.0pt;
	margin-bottom: .0001pt;
	mso-pagination: none;
	font-size: 9.0pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 宋体;
	mso-font-kerning: 1.0pt;
}

p.MsoToc8, li.MsoToc8, div.MsoToc8 {
	mso-style-update: auto;
	mso-style-unhide: no;
	mso-style-next: 正文;
	margin-top: 0cm;
	margin-right: 0cm;
	margin-bottom: 0cm;
	margin-left: 73.5pt;
	margin-bottom: .0001pt;
	mso-pagination: none;
	font-size: 9.0pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 宋体;
	mso-font-kerning: 1.0pt;
}

p.MsoToc9, li.MsoToc9, div.MsoToc9 {
	mso-style-update: auto;
	mso-style-unhide: no;
	mso-style-next: 正文;
	margin-top: 0cm;
	margin-right: 0cm;
	margin-bottom: 0cm;
	margin-left: 84.0pt;
	margin-bottom: .0001pt;
	mso-pagination: none;
	font-size: 9.0pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 宋体;
	mso-font-kerning: 1.0pt;
}

p.MsoNormalIndent, li.MsoNormalIndent, div.MsoNormalIndent {
	mso-style-unhide: no;
	margin: 0cm;
	margin-bottom: .0001pt;
	text-align: justify;
	text-justify: inter-ideograph;
	text-indent: 1.0cm;
	line-height: 135%;
	mso-pagination: none;
	layout-grid-mode: char;
	font-size: 14.0pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 仿宋_GB2312;
	mso-font-kerning: 1.0pt;
}

p.MsoCommentText, li.MsoCommentText, div.MsoCommentText {
	mso-style-unhide: no;
	mso-style-link: "批注文字 Char";
	margin: 0cm;
	margin-bottom: .0001pt;
	mso-pagination: none;
	font-size: 10.5pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 宋体;
	mso-font-kerning: 1.0pt;
}

p.MsoHeader, li.MsoHeader, div.MsoHeader {
	mso-style-unhide: no;
	mso-style-link: "页眉 Char";
	margin: 0cm;
	margin-bottom: .0001pt;
	text-align: center;
	mso-pagination: none;
	tab-stops: center 207.65pt right 415.3pt;
	layout-grid-mode: char;
	border: none;
	mso-border-bottom-alt: solid windowtext .75pt;
	padding: 0cm;
	mso-padding-alt: 0cm 0cm 1.0pt 0cm;
	font-size: 9.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 宋体;
	mso-font-kerning: 1.0pt;
}

p.MsoFooter, li.MsoFooter, div.MsoFooter {
	mso-style-priority: 99;
	mso-style-unhide: no;
	mso-style-link: "页脚 Char";
	margin: 0cm;
	margin-bottom: .0001pt;
	mso-pagination: none;
	tab-stops: center 207.65pt right 415.3pt;
	layout-grid-mode: char;
	font-size: 9.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 宋体;
	mso-font-kerning: 1.0pt;
}

p.MsoCaption, li.MsoCaption, div.MsoCaption {
	mso-style-unhide: no;
	mso-style-qformat: yes;
	mso-style-next: 正文;
	margin-top: 7.6pt;
	margin-right: 0cm;
	margin-bottom: 8.0pt;
	margin-left: 0cm;
	text-align: justify;
	text-justify: inter-ideograph;
	mso-pagination: none;
	font-size: 10.5pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Arial", "sans-serif";
	mso-fareast-font-family: 黑体;
	mso-bidi-font-family: "Times New Roman";
	mso-font-kerning: 1.0pt;
}

span.MsoCommentReference {
	mso-style-unhide: no;
	mso-style-parent: "";
	mso-ansi-font-size: 10.5pt;
	mso-bidi-font-size: 10.5pt;
}

p.MsoTitle, li.MsoTitle, div.MsoTitle {
	mso-style-unhide: no;
	mso-style-qformat: yes;
	mso-style-link: "标题 Char";
	mso-style-next: 正文缩进;
	margin-top: 6.0pt;
	margin-right: 0cm;
	margin-bottom: 18.0pt;
	margin-left: 0cm;
	text-align: center;
	line-height: 75%;
	mso-pagination: lines-together;
	page-break-after: avoid;
	layout-grid-mode: char;
	font-size: 18.0pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Arial", "sans-serif";
	mso-fareast-font-family: 隶书;
	mso-bidi-font-family: "Times New Roman";
	mso-font-kerning: 1.0pt;
	font-weight: bold;
	mso-bidi-font-weight: normal;
}

p.MsoBodyTextIndent, li.MsoBodyTextIndent, div.MsoBodyTextIndent {
	mso-style-unhide: no;
	mso-style-link: "正文文本缩进 Char";
	margin-top: 0cm;
	margin-right: 0cm;
	margin-bottom: 0cm;
	margin-left: 15.0pt;
	margin-bottom: .0001pt;
	text-align: justify;
	text-justify: inter-ideograph;
	mso-pagination: none;
	font-size: 15.0pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 楷体_GB2312;
	mso-font-kerning: 1.0pt;
}

p.MsoDate, li.MsoDate, div.MsoDate {
	mso-style-unhide: no;
	mso-style-link: "日期 Char";
	mso-style-next: 正文;
	margin: 0cm;
	margin-bottom: .0001pt;
	text-align: justify;
	text-justify: inter-ideograph;
	mso-pagination: none;
	font-size: 22.0pt;
	mso-bidi-font-size: 10.0pt;
	font-family: 隶书;
	mso-hansi-font-family: "Times New Roman";
	mso-bidi-font-family: "Times New Roman";
	mso-font-kerning: 1.0pt;
	font-weight: bold;
	mso-bidi-font-weight: normal;
}

p.MsoBodyTextIndent2, li.MsoBodyTextIndent2, div.MsoBodyTextIndent2 {
	mso-style-unhide: no;
	mso-style-link: "正文文本缩进 2 Char";
	margin-top: 0cm;
	margin-right: 0cm;
	margin-bottom: 0cm;
	margin-left: 28.65pt;
	margin-bottom: .0001pt;
	text-align: justify;
	text-justify: inter-ideograph;
	text-indent: 25.35pt;
	mso-char-indent-count: 1.95;
	line-height: 26.0pt;
	mso-line-height-rule: exactly;
	mso-pagination: none;
	font-size: 14.0pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 宋体;
	letter-spacing: -.5pt;
	mso-font-kerning: 1.0pt;
}

p.MsoBodyTextIndent3, li.MsoBodyTextIndent3, div.MsoBodyTextIndent3 {
	mso-style-unhide: no;
	mso-style-link: "正文文本缩进 3 Char";
	margin-top: 0cm;
	margin-right: 0cm;
	margin-bottom: 0cm;
	margin-left: 42.0pt;
	margin-bottom: .0001pt;
	text-align: justify;
	text-justify: inter-ideograph;
	line-height: 150%;
	mso-pagination: none;
	layout-grid-mode: char;
	mso-layout-grid-align: none;
	font-size: 12.0pt;
	mso-bidi-font-size: 10.0pt;
	font-family: 宋体;
	mso-hansi-font-family: "Times New Roman";
	mso-bidi-font-family: "Times New Roman";
	color: blue;
	mso-font-kerning: 1.0pt;
}

a:link, span.MsoHyperlink {
	mso-style-priority: 99;
	mso-style-unhide: no;
	mso-style-parent: "";
	color: blue;
	text-decoration: underline;
	text-underline: single;
}

a:visited, span.MsoHyperlinkFollowed {
	mso-style-unhide: no;
	color: purple;
	mso-themecolor: followedhyperlink;
	text-decoration: underline;
	text-underline: single;
}

em {
	mso-style-priority: 20;
	mso-style-unhide: no;
	mso-style-qformat: yes;
	color: #CC0000;
	font-style: normal;
}

p {
	mso-style-priority: 99;
	mso-style-unhide: no;
	mso-style-qformat: yes;
	mso-margin-top-alt: auto;
	margin-right: 0cm;
	mso-margin-bottom-alt: auto;
	margin-left: 0cm;
	mso-pagination: widow-orphan;
	font-size: 12.0pt;
	font-family: 宋体;
	mso-bidi-font-family: 宋体;
}

p.MsoCommentSubject, li.MsoCommentSubject, div.MsoCommentSubject {
	mso-style-unhide: no;
	mso-style-parent: 批注文字;
	mso-style-link: "批注主题 Char";
	mso-style-next: 批注文字;
	margin: 0cm;
	margin-bottom: .0001pt;
	mso-pagination: none;
	font-size: 10.5pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 宋体;
	mso-font-kerning: 1.0pt;
	font-weight: bold;
}

p.MsoAcetate, li.MsoAcetate, div.MsoAcetate {
	mso-style-noshow: yes;
	mso-style-unhide: no;
	margin: 0cm;
	margin-bottom: .0001pt;
	text-align: justify;
	text-justify: inter-ideograph;
	mso-pagination: none;
	font-size: 9.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 宋体;
	mso-font-kerning: 1.0pt;
}

p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph {
	mso-style-priority: 34;
	mso-style-unhide: no;
	mso-style-qformat: yes;
	margin: 0cm;
	margin-bottom: .0001pt;
	text-align: justify;
	text-justify: inter-ideograph;
	text-indent: 21.0pt;
	mso-char-indent-count: 2.0;
	mso-pagination: none;
	font-size: 10.5pt;
	mso-bidi-font-size: 12.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 宋体;
	mso-font-kerning: 1.0pt;
}

p.1, li.1, div.1 {
	mso-style-name: 列出段落1;
	mso-style-unhide: no;
	mso-style-qformat: yes;
	margin: 0cm;
	margin-bottom: .0001pt;
	text-align: justify;
	text-justify: inter-ideograph;
	text-indent: 21.0pt;
	mso-char-indent-count: 2.0;
	mso-pagination: none;
	font-size: 10.5pt;
	mso-bidi-font-size: 12.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 宋体;
	mso-font-kerning: 1.0pt;
}

span.Char {
	mso-style-name: "页眉 Char";
	mso-style-unhide: no;
	mso-style-locked: yes;
	mso-style-link: 页眉;
	mso-ansi-font-size: 9.0pt;
	mso-bidi-font-size: 9.0pt;
	mso-font-kerning: 1.0pt;
}

span.Char0 {
	mso-style-name: "页脚 Char";
	mso-style-priority: 99;
	mso-style-unhide: no;
	mso-style-locked: yes;
	mso-style-link: 页脚;
	mso-ansi-font-size: 9.0pt;
	mso-bidi-font-size: 9.0pt;
	mso-font-kerning: 1.0pt;
}

span.msoins0 {
	mso-style-name: msoins;
	mso-style-unhide: no;
}

span.msodel0 {
	mso-style-name: msodel;
	mso-style-unhide: no;
}

span.1Char {
	mso-style-name: "标题 1 Char";
	mso-style-unhide: no;
	mso-style-locked: yes;
	mso-style-link: "标题 1";
	mso-ansi-font-size: 14.0pt;
	font-family: 隶书;
	mso-fareast-font-family: 隶书;
	mso-font-kerning: 14.0pt;
	font-weight: bold;
	mso-bidi-font-weight: normal;
}

span.2Char {
	mso-style-name: "标题 2 Char";
	mso-style-unhide: no;
	mso-style-locked: yes;
	mso-style-link: "标题 2";
	mso-ansi-font-size: 14.0pt;
	font-family: "Arial", "sans-serif";
	mso-ascii-font-family: Arial;
	mso-hansi-font-family: Arial;
	mso-font-kerning: 1.0pt;
	font-weight: bold;
	mso-bidi-font-weight: normal;
}

span.3Char {
	mso-style-name: "标题 3 Char";
	mso-style-unhide: no;
	mso-style-locked: yes;
	mso-style-link: "标题 3";
	mso-ansi-font-size: 14.0pt;
	font-family: 仿宋_GB2312;
	mso-fareast-font-family: 仿宋_GB2312;
	mso-font-kerning: 1.0pt;
	font-weight: bold;
	mso-bidi-font-weight: normal;
}

span.4Char {
	mso-style-name: "标题 4 Char";
	mso-style-unhide: no;
	mso-style-locked: yes;
	mso-style-link: "标题 4";
	mso-ansi-font-size: 10.5pt;
}

span.5Char {
	mso-style-name: "标题 5 Char";
	mso-style-unhide: no;
	mso-style-locked: yes;
	mso-style-link: "标题 5";
	mso-ansi-font-size: 10.5pt;
}

span.8Char {
	mso-style-name: "标题 8 Char\,正文分项目 Char";
	mso-style-unhide: no;
	mso-style-locked: yes;
	mso-style-link: "标题 8\,正文分项目";
	mso-ansi-font-size: 10.5pt;
}

span.Char1 {
	mso-style-name: "标题 Char";
	mso-style-unhide: no;
	mso-style-locked: yes;
	mso-style-link: 标题;
	mso-ansi-font-size: 18.0pt;
	font-family: "Arial", "sans-serif";
	mso-ascii-font-family: Arial;
	mso-fareast-font-family: 隶书;
	mso-hansi-font-family: Arial;
	mso-font-kerning: 1.0pt;
	font-weight: bold;
	mso-bidi-font-weight: normal;
}

span.Char2 {
	mso-style-name: "日期 Char";
	mso-style-unhide: no;
	mso-style-locked: yes;
	mso-style-link: 日期;
	mso-ansi-font-size: 22.0pt;
	font-family: 隶书;
	mso-ascii-font-family: 隶书;
	mso-fareast-font-family: 隶书;
	mso-font-kerning: 1.0pt;
	font-weight: bold;
	mso-bidi-font-weight: normal;
}

span.Char3 {
	mso-style-name: "正文文本缩进 Char";
	mso-style-unhide: no;
	mso-style-locked: yes;
	mso-style-link: 正文文本缩进;
	mso-ansi-font-size: 15.0pt;
	font-family: 楷体_GB2312;
	mso-fareast-font-family: 楷体_GB2312;
	mso-font-kerning: 1.0pt;
}

span.2Char0 {
	mso-style-name: "正文文本缩进 2 Char";
	mso-style-unhide: no;
	mso-style-locked: yes;
	mso-style-link: "正文文本缩进 2";
	mso-ansi-font-size: 14.0pt;
	letter-spacing: -.5pt;
	mso-font-kerning: 1.0pt;
}

span.Char4 {
	mso-style-name: "批注文字 Char";
	mso-style-unhide: no;
	mso-style-locked: yes;
	mso-style-link: 批注文字;
	mso-ansi-font-size: 10.5pt;
	mso-font-kerning: 1.0pt;
}

span.3Char0 {
	mso-style-name: "正文文本缩进 3 Char";
	mso-style-unhide: no;
	mso-style-locked: yes;
	mso-style-link: "正文文本缩进 3";
	mso-ansi-font-size: 12.0pt;
	font-family: 宋体;
	mso-ascii-font-family: 宋体;
	color: blue;
	mso-font-kerning: 1.0pt;
}

p.2, li.2, div.2 {
	mso-style-name: 正文2;
	mso-style-update: auto;
	mso-style-unhide: no;
	margin-top: 0cm;
	margin-right: 0cm;
	margin-bottom: 0cm;
	margin-left: 63.0pt;
	margin-bottom: .0001pt;
	text-align: justify;
	text-justify: inter-ideograph;
	text-indent: -21.0pt;
	line-height: 150%;
	mso-pagination: none;
	mso-list: l1 level5 lfo4;
	tab-stops: list 63.0pt;
	layout-grid-mode: char;
	mso-layout-grid-align: none;
	font-size: 10.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 宋体;
	mso-font-kerning: 1.0pt;
}

p.a, li.a, div.a {
	mso-style-name: 正文标题;
	mso-style-unhide: no;
	mso-style-parent: "";
	mso-style-next: 正文;
	margin-top: 2.0pt;
	margin-right: 0cm;
	margin-bottom: 0cm;
	margin-left: 0cm;
	margin-bottom: .0001pt;
	line-height: 200%;
	mso-pagination: widow-orphan;
	tab-stops: list 18.0pt;
	font-size: 10.5pt;
	mso-bidi-font-size: 10.0pt;
	font-family: 黑体;
	mso-hansi-font-family: "Times New Roman";
	mso-bidi-font-family: "Times New Roman";
	mso-no-proof: yes;
}

p.a0, li.a0, div.a0 {
	mso-style-name: 基准行距;
	mso-style-unhide: no;
	mso-style-parent: "";
	margin: 0cm;
	margin-bottom: .0001pt;
	line-height: 125%;
	mso-pagination: none;
	font-size: 10.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 宋体;
	mso-no-proof: yes;
}

p.New, li.New, div.New {
	mso-style-name: "正文 New";
	mso-style-unhide: no;
	mso-style-parent: "";
	margin: 0cm;
	margin-bottom: .0001pt;
	text-align: justify;
	text-justify: inter-ideograph;
	mso-pagination: none;
	font-size: 10.5pt;
	mso-bidi-font-size: 12.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 宋体;
	mso-font-kerning: 1.0pt;
}

p.20, li.20, div.20 {
	mso-style-name: 列出段落2;
	mso-style-unhide: no;
	margin: 0cm;
	margin-bottom: .0001pt;
	text-align: justify;
	text-justify: inter-ideograph;
	text-indent: 21.0pt;
	mso-char-indent-count: 2.0;
	mso-pagination: none;
	font-size: 10.5pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 宋体;
	mso-font-kerning: 1.0pt;
}

span.Char5 {
	mso-style-name: "批注主题 Char";
	mso-style-unhide: no;
	mso-style-locked: yes;
	mso-style-parent: "批注文字 Char";
	mso-style-link: 批注主题;
	mso-ansi-font-size: 10.5pt;
	mso-font-kerning: 1.0pt;
	font-weight: bold;
}

.MsoChpDefault {
	mso-style-type: export-only;
	mso-default-props: yes;
	font-size: 10.0pt;
	mso-ansi-font-size: 10.0pt;
	mso-bidi-font-size: 10.0pt;
	mso-ascii-font-family: "Times New Roman";
	mso-fareast-font-family: 宋体;
	mso-hansi-font-family: "Times New Roman";
	mso-font-kerning: 0pt;
}
/* Page Definitions */
@page {
	mso-page-border-surround-header: no;
	mso-page-border-surround-footer: no;
}

@page Section1 {
	size: 595.3pt 841.9pt;
	margin: 78.0pt 3.0cm 49.65pt 3.0cm;
	mso-header-margin: 42.55pt;
	mso-footer-margin: 49.6pt;
	mso-paper-source: 0;
	layout-grid: 15.6pt;
}

div.Section1 {
	page: Section1;
}
/* List Definitions */
@
list l0 {
	mso-list-id: 68576610;
	mso-list-type: simple;
	mso-list-template-ids: 1443664324;
}

@
list l0:level1 {
	mso-level-number-format: alpha-lower;
	mso-level-style-link: "标题 8";
	mso-level-text: "%1\)";
	mso-level-tab-stop: 39.25pt;
	mso-level-number-position: left;
	margin-left: 0cm;
	text-indent: 21.25pt;
	mso-ansi-font-size: 10.5pt;
	font-family: 黑体;
	color: black;
	mso-text-animation: none;
	mso-hide: none;
	position: relative;
	top: 0pt;
	mso-text-raise: 0pt;
	letter-spacing: 0pt;
	mso-font-width: 100%;
	mso-font-kerning: 8.0pt;
	mso-ansi-font-weight: normal;
	mso-ansi-font-style: normal;
	text-decoration: none;
	text-underline: none;
	text-decoration: none;
	text-line-through: none;
	vertical-align: baseline;
}

@
list l1 {
	mso-list-id: 1195384975;
	mso-list-type: hybrid;
	mso-list-template-ids: -2101706094 2125497038 67698713 67698715 67698703
		-1415295062 67698715 67698703 67698713 67698715;
}

@
list l1:level1 {
	mso-level-text: %1;
	mso-level-tab-stop: 42.55pt;
	mso-level-number-position: left;
	margin-left: 42.55pt;
	text-indent: -42.55pt;
}

@
list l1:level2 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%2\)";
	mso-level-tab-stop: 42.0pt;
	mso-level-number-position: left;
	margin-left: 42.0pt;
	text-indent: -21.0pt;
}

@
list l1:level3 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 63.0pt;
	mso-level-number-position: right;
	margin-left: 63.0pt;
	text-indent: -21.0pt;
}

@
list l1:level4 {
	mso-level-tab-stop: 84.0pt;
	mso-level-number-position: left;
	margin-left: 84.0pt;
	text-indent: -21.0pt;
}

@
list l1:level5 {
	mso-level-style-link: 正文2;
	mso-level-text: "%5\)";
	mso-level-tab-stop: 105.0pt;
	mso-level-number-position: left;
	margin-left: 105.0pt;
	text-indent: -21.0pt;
}

@
list l2 {
	mso-list-id: 1274824230;
	mso-list-type: simple;
	mso-list-template-ids: 1354688844;
}

@
list l2:level1 {
	mso-level-style-link: "标题 2";
	mso-level-text: %1．;
	mso-level-tab-stop: 64.35pt;
	mso-level-number-position: left;
	margin-left: 0cm;
	text-indent: 1.0cm;
}

@
list l3 {
	mso-list-id: 1664503735;
	mso-list-type: simple;
	mso-list-template-ids: 1419138682;
}

@
list l3:level1 {
	mso-level-number-format: chinese-counting-thousand;
	mso-level-style-link: "标题 1";
	mso-level-tab-stop: 46.35pt;
	mso-level-number-position: left;
	margin-left: 0cm;
	text-indent: 1.0cm;
}

ol {
	margin-bottom: 0cm;
}

ul {
	margin-bottom: 0cm;
}


.input_home {
	border-right: #eff0f4 0px solid;
	border-top: #eff0f4 0px solid;
	border-left: #eff0f4 0px solid;
	border-bottom: #000000 2px solid;
	background-color: #eff0f4;
	line-height: 115%; 
	font-family: "微软雅黑", "sans-serif";
	text-align: left;
    font-size: 12.0pt;
    font-weight: bold;
    width: 385px;
}

.input_date {
	border-right: #eff0f4 0px solid;
	border-top: #eff0f4 0px solid;
	border-left: #eff0f4 0px solid;
	border-bottom: #000000 1px solid;
	background-color: #eff0f4;
	line-height: 115%; 
	font-family: "微软雅黑", "sans-serif";
	width:120px;
	text-align:center;
}

.input_text {
	border-right: #eff0f4 0px solid;
	border-top: #eff0f4 0px solid;
	border-left: #eff0f4 0px solid;
	border-bottom: #000000 1px solid;
	background-color: #eff0f4;
	line-height: 115%; 
	font-family: "微软雅黑", "sans-serif";
	width:60px;
	text-align:center;
}


.input_mail {
	border-right: #eff0f4 0px solid;
	border-top: #eff0f4 0px solid;
	border-left: #eff0f4 0px solid;
	border-bottom: #000000 1px solid;
	background-color: #eff0f4;
	line-height: 115%; 
	font-family: "微软雅黑", "sans-serif";
	width:180px;
	text-align:center;
}

.selectIn {
	width:200px;
	line-height: 115%; 
	font-family: "微软雅黑", "sans-serif";
	text-align:center;
	background-color:EFF0F4;
	border:1px solid EFF0F4;
}

#print_div {
	position: fixed;
	top: 30px;
	right: 5px;
	display: inline;
}

.download_a{
    border: 1px solid #666;
    color: #333;
    text-decoration: none;
    font-size: 12px;
    width: 62px;
    height: 19px;
    display: inline-block;
    text-align: center;
    line-height: 19px;
}
-->
</style>

<script type="text/javascript">
	$(function() {
		for (var i = 1; i < 12; i++) {
			$("<img/>").attr('src', "${ctxStatic}/img/waterprint.png").css(
					{
						"position" : "absolute",
						"left" : "150px",
						"top" : i * 1000 + 150 + "px",
						"z-index" : "-1"
					}).appendTo($("#imgArea"));
		}
	});

	function back() {
		history.back();
		return false;
	}

	function printHtml() {
		var d = {"id":"${purchasingcontractbase.id}","printType":"${printType}"};
		var url = "/a/contract/contractPrint/purchasePrintWord";
		startUp.postData(url,d,function(data){
			var res= data.result;
			alertx("调用打印成功！");
		});
	/* 	
		var head = "<html><head><title></title></head><body>";
		var footstr = "</body></html>";
		var printData = document.getElementById("div_print").innerHTML;
		var oldstr = document.body.innerHTML;
		document.body.innerHTML = head + printData + footstr;
		window.print();

		document.body.innerHTML = oldstr;

		//var imgArea = document.getElementById("imgArea");
		//imgArea.removeChild(imgArea.lastChild);

		return false; */
	}
</script>
</head>
<div id="print_div">
<a class="download_a" href="${ctx}/contract/contractPrint/purchasePrintWord?id=${purchasingcontractbase.id}&printType=${printType}">下载打印</a>
<!-- <input name="b_print" type="button" id="iprint" onclick="printHtml()" value=" 打印 " /> --> 
<input name="iback" type="button" id="iback" onclick="back()" value=" 返回 " />
</div>

<div id="div_print">
	<body lang=ZH-CN link=blue vlink=purple
		style='tab-interval: 21.0pt; text-justify-trim: punctuation'>
		<span id="imgArea"></span>
		<div class=Section1 style='layout-grid: 15.6pt'>

			<p class=MsoNormalCxSpFirst align=center
				style='text-align: center; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=center
				style='text-align: center; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=center
				style='text-align: center; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=center
				style='text-align: center; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span
					style='font-size: 28.0pt; mso-bidi-font-size: 26.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; width:400px;color: black; mso-font-kerning: 0pt'>广东万方建设有限公司<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=center
				style='text-align: center; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b><span
					style='font-size: 26.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"'>石材类承揽基本合同</span></b><b
					style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 24.0pt; mso-bidi-font-size: 22.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p></o:p></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=center
				style='text-align: center; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=center
				style='text-align: center; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=center
				style='text-align: center; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=center
				style='text-align: center; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>
			
			<p class=MsoNormalCxSpMiddle align=center
				style='text-align: center; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=center
				style='text-align: center; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=center
				style='text-align: center; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=center
				style='text-align: center; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=center
				style='text-align: center; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=center
				style='text-align: center; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=left
				style='text-align: left; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=left
				style='text-align: left; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=left
				style='text-align: left; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=left
				style='text-align: left; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=left
				style='text-align: left; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 16.0pt; mso-bidi-font-size: 14.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=left
				style='text-align: left; text-indent: 96.0pt; mso-char-indent-count: 6.0; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='margin-left:100px;mso-bidi-font-weight: normal'><span
					style='font-size: 16.0pt; mso-bidi-font-size: 14.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'>合同编号：</span></b><a
					name="_GoBack"><b style='mso-bidi-font-weight: normal'><input type="text" class="input_home" disable="true" value="${purchasingcontractbase.contractNo}"/></b></a><span
					style='mso-bookmark: _GoBack'></span><b
					style='mso-bidi-font-weight: normal'><u><span lang=EN-US
						style='font-size: 16.0pt; mso-bidi-font-size: 14.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p></o:p></span></u></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=left
				style='text-align: left; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'></b>
			</p>

			<!-- <p class=MsoNormalCxSpMiddle align=left
				style='text-align: left; text-indent: 99.0pt; mso-char-indent-count: 5.5; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='margin-left:100px;mso-bidi-font-weight: normal'><span
					style='font-size: 18.0pt; mso-bidi-font-size: 16.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'>甲<span
						lang=EN-US><span style='mso-spacerun: yes'>&nbsp; </span></span>方：
						<u>广东万方建设有限公司 </u><span lang=EN-US><o:p></o:p></span></span></b>
			</p>
			 -->
			<p class=MsoNormal
				style='text-indent: 99.0pt; mso-char-indent-count: 5.5; mso-layout-grid-align: none; text-autospace: none'>
				<b style='margin-left:100px;mso-bidi-font-weight: normal'><span
					style='font-size: 18.0pt; mso-bidi-font-size: 16.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'>甲<span
						lang=EN-US><span style='mso-spacerun: yes'>&nbsp; </span></span>方：
				</span></b><b style='mso-bidi-font-weight: normal'><u><input type="text" class="input_home" disable="true" value="广东万方建设有限公司"/></u></b><span lang=EN-US
					style='font-size: 14.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 99.0pt; mso-char-indent-count: 5.5; mso-layout-grid-align: none; text-autospace: none'>
				<b style='margin-left:100px;mso-bidi-font-weight: normal'><span
					style='font-size: 18.0pt; mso-bidi-font-size: 16.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'>乙<span
						lang=EN-US><span style='mso-spacerun: yes'>&nbsp; </span></span>方：
				</span></b><b style='mso-bidi-font-weight: normal'><input type="text" class="input_home" disable="true" value="${purchasingcontractbase.partyBName}"/></b><span lang=EN-US
					style='font-size: 14.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 150%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 14.0pt; mso-bidi-font-size: 12.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>
			
			<p class=MsoNormalCxSpMiddle align=left
				style='text-align: left; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=left
				style='text-align: left; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>
			
			<p class=MsoNormal
				style='line-height: 150%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 14.0pt; mso-bidi-font-size: 12.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>
			
			<p class=MsoNormalCxSpMiddle align=left
				style='text-align: left; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=left
				style='text-align: left; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>
			
			<p class=MsoNormalCxSpMiddle align=left
				style='text-align: left; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=left
				style='text-align: left; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal align=center
				style='text-align: center; line-height: 150%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b><span
					style='font-size: 22.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'>石材类承揽基本合同</span></b><b
					style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 22.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>本合同是旨在为甲、乙双方确立并维护相互之间长期稳定的合作关系、明确双方在合作过程中应尽的义务、减少合作过程中的争议、防止各种不正当行为的发生而订立的基本承揽合同，具体的合同标的、数量、交付日期等内容双方将通过附件或承揽订单的方式确定。本合同的签订及生效，是乙方成为甲方合格承揽商的必要条件之一。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲、乙双方经协商一致后，可对承揽合同进行更新或修订。新的承揽合同经双方正式签订生效后，原承揽合同的效力正式终止。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲、乙双方确认经过平等协商、相互商讨，双方共同拟订了本承揽基本合同。甲、乙双方均认为本承揽基本合同是双方共同的真实意思表现，对合同条款已充分理解并完全同意。</span><span
					lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
			</p>

			<p class=MsoNormal align=center
				style='text-align: center; line-height: 125%'>
				<b style='mso-bidi-font-weight: normal'><span
					style='font-size: 16.0pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"'>合同正文<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>1.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【证照资质】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>在签订本合同及其他协议前，乙方应按甲方规定提供下列书面及电子档有效文件：<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>1.1</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方<span
					style='mso-bidi-font-weight: bold'>资料调查表。<span lang=EN-US><o:p></o:p></span></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>1.2</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>营业执照、税务登记证、开户许可证及其他资质证明的复印件。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>上述文件记载的信息发生变化时，乙方应及时将记载变化的信息书面提供给甲方。</span><b
					style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>2.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【管理职责】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲方内部各部门与乙方相关的管理职责：<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>2.1</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲方<b
					style='mso-bidi-font-weight: normal'>合约部</b>是乙方与甲方商务谈判、签订承揽合作协议的接口部门，负责乙方承揽价格谈判、签订合同业务。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>2.2</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>甲方<b
					style='mso-bidi-font-weight: normal'>生产中心</b>是乙方与甲方的业务接口部门，负责甲方承揽业务，下达承揽订单，跟催物料、财务结算，并负责呆滞物料处理和消耗。同时负责承揽商的监督考核管理。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>2.3</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>甲方<b
					style='mso-bidi-font-weight: normal'>技术部门</b>（如：<b
					style='mso-bidi-font-weight: normal'>设计中心</b>）可与乙方进行职能范围之内的技术交流和技术支持活动。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>2.4</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲方其他部门可根据业务需要，在必要时与乙方开展职责范围之内的业务活动。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>3.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【材料提供】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>本条款所指的材料为产品主材『石材』，其他完成承揽工作所需的辅料（除非在《价格表》内有特别说明），否则均由乙方提供，承揽费中已包含该些辅料价格。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>3.1</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>产品主材由<b
					style='mso-bidi-font-weight: normal'><u>甲</u></b>方提供。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>3.2</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>产品主材由乙方提供的，必须为双方约定石材种类，并保证石材色泽均一，无明显色差，有封样的应与双方封存样板相符。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>3.3</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>产品主材由甲方提供的，乙方必须承担以下约定义务，否则由此造成的相关责任由乙方承担，并按双方约定处理或负赔偿或违约责任。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>3.3.1</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>石材出材率不低于：大理石<span
					lang=EN-US>84%</span>；花岗岩<span lang=EN-US>90%</span>。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>3.3.2</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>负责对进入乙方仓库的甲方石材进行出入<span
					style='color: black; mso-themecolor: text1'>库管理，包括入库石材的验收责任等，具体管理规定见《承揽商石材出入库管理规定》。<span
						lang=EN-US><o:p></o:p></span></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>4.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>【承揽订单】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>承揽订单是甲方向乙方提出交货的正式书面文件，乙方根据承揽订单所载的产品（或称“货物”）品名、规格型号、数量、交货期限、交货地点等内容及其所列各项要求（如加工说明等）、所附图纸进行生产，履行交付义务。承揽订单原件除直接送达乙方外，甲方也可以通过电子邮件方式将承揽订单送达乙方</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>。乙方收到甲方承揽订单后应在一个工作日内书面回复确认，逾期未确认的视为接受该承揽订单。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>4.1</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲方指定发送、接收相关信息的邮箱为：<input type="text" class="input_mail"><u><span
						lang=EN-US><o:p></o:p></span></u></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>4.2</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方指定发送、接收订单及相关信息的邮箱为：<input type="text" class="input_mail"><u><span
						lang=EN-US><o:p></o:p></span></u></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>4.3</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方必须清楚，由甲方指定员工<input type="text" class="input_mail">、乙方负责人共同签名的承揽订单及图纸才能作为结算凭证。承揽订单及图纸相对应的电子档甲方将通过邮件提供给乙方。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>4.4</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方收到并确认甲方的订单后，应在订单上签名或盖章，并将该签名或盖章的订单寄送给甲方，以作为履约交货后结算的依据。若乙方未及时寄送订单，造成货款延误的责任由乙方自行承担。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>4.5</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>若甲方存放的订单与乙方存放的有不一致之处，乙方无条件同意以甲方存放的订单为准。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1'>5.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1'>【<span
						lang=EN-US>ERP</span>系统】
				</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>通过</span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1'>ERP</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1'>系统，甲乙双方将能够更加</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>准确和及时的进行信息的传递，</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1'>甲方将给予乙方甲方<span
					lang=EN-US>ERP</span>系统的使用权限（账号和密码），乙方应确保该使用权限仅为完成本合同业务及由完成本合同业务的相关授权人员使用，并对通过<span
					lang=EN-US>ERP</span>系统所获悉的所有与甲方业务相关的信息进行保密，除完成业务外不作其他用途。乙方取得<span
					lang=EN-US>ERP</span>使用权限后应立即修改密码，乙方承诺对以乙方账号（用户名）在<span lang=EN-US>ERP</span>系统内的所有操作承担相应法律责任。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1'>5.1</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1'>在乙方开通<span
					lang=EN-US>ERP</span>系统账号后，甲方可通过<span lang=EN-US>ERP</span>系统向乙方发出承揽订单、
				</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>送货计划、技术文件（包括设计图纸、更改通知单、验收标准、质量技术要求、实样及其它约定条件的文件等）等，乙方应及时确认和处理。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>5.2</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>应由</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1'>乙方负责录入数据和上传的相关附件，乙方必须确保准确和完整，如有错误、遗漏，所造成的责任由乙方负责。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>6.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【价格】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲方根据双方《价格表》中确认的价格向乙方结算并支付报酬；除非双方另有书面约定，否则甲方无须支付任何《价格表》约定价款以外的款项。《价格表》包含“产品名称、规则、单位、价格及具体材料要求等”，结算货币单位为人民币元。<b
					style='mso-bidi-font-weight: normal'><span lang=EN-US><o:p></o:p></span></b></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>6.1</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方保证向甲方提供的产品报价具有竞争优势，不高于同期乙方向任何第三方所提供的产品报价及合法竞争情况下所确定的产品市场最低价。如乙方自行降价或向第三方提供更优惠的价格，甲方应同时享有降价优惠或更优惠的价格。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>6.2</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲方为保持产品成本的竞争力，对部分产品采取公开竞价方式，明确合作的产品名称、规格等。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>7.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【包装】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方应根据产品特性，按照法律规及相关国家标准及双方确定的包装标准进行妥善包装，确保产品在运输、装卸过程中得到完好保护，且便于识别。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>7.1</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>产品应捆扎稳妥，以保证在运输中产品不受磨擦损伤。对没有进行适当保护或受损的商品，甲方有权不予接受。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>7.2</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>具体《产品包装要求及</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>发货、装卸流程</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>》详见本合同附件。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>7.3</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>双方确认的结算价格已包含包装及包装所需材料费用。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>8.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【物流】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>双方均应避免野蛮、危险操作，应采取合适的装卸、运输方式，确保产品能准时、完好地送达甲方指定地点。具体《产品包装要求及</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>发货、装卸流程</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>》详见本合同附件。<b
					style='mso-bidi-font-weight: normal'><span lang=EN-US><o:p></o:p></span></b></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>8.1</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>装车费用由<u><span
						lang=EN-US><span style='mso-spacerun: yes'>&nbsp; </span></span>乙
				</u>方承担，卸车费用由<u><span lang=EN-US><span
							style='mso-spacerun: yes'>&nbsp; </span></span>甲 </u>方承担。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>8.2</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>长途</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>运输费用由</span><b
					style='mso-bidi-font-weight: normal'><input type="text" class="input_text" disable="true" value="${purchasingcontractbase.isIncludeCarriage eq '1'?'乙方':'甲方'}"/></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>方承担。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>8.3</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>其他：</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>乙方工厂到装车地点之间的</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>运输费用由<u><span
						lang=EN-US><span style='mso-spacerun: yes'>&nbsp; </span></span>甲<span
						lang=EN-US><span style='mso-spacerun: yes'>&nbsp; </span></span></u>方承担
				</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>。</span><b
					style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>9.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【数量准确】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方保证交付的产品数量与甲方承揽订单所要求的数量相符合，不存在短装或多交情形。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>10.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【质量保证】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方保证所提供的产品满足国家、行业或双方企业的质量标准，并以要求高者为准<b
					style='mso-bidi-font-weight: normal'>。</b><span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>10.1</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方交付的产品不符合质量要求的，甲方有权退回乙方，因此增加的运输费用以及其他成本由乙方承担，若因此未能在交付期限内提供合格产品，乙方应按照约定承担延迟履行责任。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>10.2</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方不符合质量要求交货的产品，若可以折价使用的，双方协商确定，但不免除乙方的质量责任及延迟履行责任。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>10.3</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>双方约定的质量标准、技术要求<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>10.3.1</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方以甲方提供的产品样板、加工图纸或承揽单中注明的质量要求等为标准进行生产。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>10.3.2</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方有义务确保产品质量符合相关国家、地方与行业标准，如：<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>10.3.2.1</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>天然花岗石建筑板材
					国家标准<span lang=EN-US>GB/T18601</span>，<span lang=EN-US>2009<o:p></o:p></span>
				</span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>10.3.2.2</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>天然大理石建筑板材
					建材行业标准<span lang=EN-US>JC/T79</span>，<span lang=EN-US>2009<o:p></o:p></span>
				</span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>10.3.2.3</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>异型装饰石材<span
					lang=EN-US><span style='mso-spacerun: yes'>&nbsp; </span></span>建材行业标准<span
					lang=EN-US>JC/T847.2-3</span>，<span lang=EN-US>1999<o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>10.3.2.4</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>天然饰面石材实验方法<span
					lang=EN-US><span style='mso-spacerun: yes'>&nbsp; </span></span>国家标准<span
					lang=EN-US>GB/T9966.1-8</span>，<span lang=EN-US>2009<o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>10.3.2.5</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>天然石材统一编号<span
					lang=EN-US><span style='mso-spacerun: yes'>&nbsp; </span></span>国家标准<span
					lang=EN-US>GB/T17670</span>，<span lang=EN-US>2008<o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>10.3.2.6</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>建筑材料放射性核素限量
					国家标准<span lang=EN-US>GB6566</span>，<span lang=EN-US>2009<o:p></o:p></span>
				</span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>10.3.3</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>甲方将每种产品的材料、效果定好样板后提供给乙方，乙方加工效果不得偏离样板效果。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>10.3.4</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方使用的防水<span
					style='color: black; mso-themecolor: text1'>材料（品牌）必须经甲方确</span>认后才能使用。
				</span><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>10.3.5</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方必须设置专职质检人员在各道工序进行质量控制，严格依照国家标准、建材行业标准进行检验，确保发到甲方工地的产品全部符合甲方的品质要求。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>10.3.6</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>为确保产品的质量，甲方有权随时检查乙方的生产过程和原辅料的使用，乙方不得拒绝并应提供必须的配合。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>11.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【权利保证】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>产品主材由乙方提供的，乙方承诺产品在交付甲方之前，乙方对该产品具有完全的所有权，未设置抵押或任何第三方可主张的权利，也不存在被司法机关或行政机关执行强制程序的可能。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>12.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【交付】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方收到甲方下达的正式承揽订单并确认接受后，应按照甲方指定的交付日期准时完好地将产品送达指定地点。乙方违反承揽订单要求的，按照约定承担延迟履行责任。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>13.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【交付期限】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方必须按照甲方书面指示的交付日期交付产品，不得延迟。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>13.1</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方确需延迟交货的，在确认订单时应事先说明，并得到甲方的确认，由甲方修改交货时间。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>13.2</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲方有权变更交货时间或交货地点，具体以甲方通知为准。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>13.3</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>因甲方原因造成的产品不能按时发货，交货期限顺延。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>14.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【交付地点】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方必须按照甲方承揽订单要求，将产品送达指定交付地点。如乙方交付产品的地点与甲方承揽订单所指示的交付地点不一致，乙方必须在交付期限内将产品转送至承揽订单指定地点，因交付地点错误造成交付延迟的，乙方须按照约定承担相关违约责任。</span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体;'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>15.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【验收】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>根据本行业的交易习惯及交易方便，甲方收货时只清点数量和破损，因此收货签收不代表已对产品进行质量验收。乙方应当恪守诚实信用原则，保证所交付的产品数量、质量符合甲方要求和双方约定，不存在短装现象或质量问题。双方对质量验收标准、方法及期限等具体约定详见本合同附件《产品质量验收标准》。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>16.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>【维修、返工】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>存在质量问题但可维修解决的产品</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>，乙方应到甲方工地</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>进行更换或维修</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>。若乙方接到通知后不安排或者确认无法派人</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>进行更换或维修的，甲方有权委托第三人进行更换或维修，由此所产生的所有费用由</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>乙方承担。</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>因返工所产生的所有费用由</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>乙方承担</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>17.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>【售后】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>工地安装过程中需要委派工地售后人员的，由乙方委派工地售后人员到工地。售后人员选用的交通工具及所有的报销以甲方售后服务经理签字确认为准，其标准为：人工费用<span
					lang=EN-US>200</span>元<span lang=EN-US>/</span>天、住宿费用<span
					lang=EN-US>80</span>元<span lang=EN-US>/</span>天（甲方提供住宿的不报销住宿费用）、往返车票实报实销。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>18.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【支付条款】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲方应按照双方约定的付款方式向乙方按时支付货款，不得无故延迟付款。付款前乙方应按照约定方式准时向甲方提交正规有效的</span><b
					style='mso-bidi-font-weight: normal'>
					<select>
						   <option class="selectIn" ${purchasingcontractbase.invoiceType eq '增值税专用发票'?'selected="selected"':'' } >增值税专用</option>
						   <option class="selectIn" ${purchasingcontractbase.invoiceType eq '货物运输业增值税专用发票'?'selected="selected"':'' } >货物运输业增值税专用</option>
						   <option class="selectIn" ${purchasingcontractbase.invoiceType eq '普通发票'?'selected="selected"':'' } >普通</option>
						   <option class="selectIn" ${purchasingcontractbase.invoiceType eq '建安发票'?'selected="selected"':'' } >建安</option>
						   <option class="selectIn" ${purchasingcontractbase.invoiceType eq '不可开票'?'selected="selected"':'' } >不可开票</option>
					</select>
					</b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>发票（</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>税率</span><b
					style='mso-bidi-font-weight: normal'>
						<select >
						   <option class="selectIn"  ${purchasingcontractbase.taxRate eq '17%'?'selected="selected"':'' } >17%</option>
						   <option class="selectIn"  ${purchasingcontractbase.taxRate eq '13%'?'selected="selected"':'' } >13%</option>
						   <option class="selectIn"  ${purchasingcontractbase.taxRate eq '11%'?'selected="selected"':'' } >11%</option>
						   <option class="selectIn"  ${purchasingcontractbase.taxRate eq '6%'?'selected="selected"':'' } >6%</option>
						   <option class="selectIn"  ${purchasingcontractbase.taxRate eq '3%'?'selected="selected"':'' } >3%</option>
						   <option class="selectIn"  ${purchasingcontractbase.taxRate eq '0%'?'selected="selected"':'' } >0%</option>
					  </select>
					</b><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'></span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>）、付款凭证等进行对账、结算、请款，否则甲方有权延期付款，直至乙方提交为止；因此导致甲方付款延迟的，甲方无须承担延迟付款责任。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>18.1</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>结算方式：月结</span><b
					style='mso-bidi-font-weight: normal'>					  
					<select >
						   <option class="selectIn" >60天</option>
						   <option class="selectIn" ${purchasingcontractbase.settlementType eq '月结'?'selected="selected"':'' } >30天</option>
						   <option class="selectIn" ${purchasingcontractbase.settlementType eq '零星付款'?'selected="selected"':'' }>零星付款</option>
						   <option class="selectIn" ${purchasingcontractbase.settlementType eq '按进度付款'?'selected="selected"':'' }>按进度付款</option>
					  </select></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>。即按月结算货款，满“<span
					lang=EN-US>X</span>”天以约定方式付款。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>18.1.1</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>结算时间每月<span
					lang=EN-US>3</span>号前对上月加工费金额进行结算，并在每月<span lang=EN-US>25</span>号前把经甲方审核确认结算金额的发票寄送到甲方财务。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>18.2</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>支付方式：</span>					
					<c:choose>
					   <c:when test="${(purchasingcontractbase.paymentType eq '承兑汇票')||(purchasingcontractbase.paymentType eq '银行承兑')}">  
							<b style='mso-bidi-font-weight: normal'><input type="text" class="input_text" disable="true" value="0"/></b>
							<b style='mso-bidi-font-weight: normal'>
							<span lang=EN-US style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体;'>%</span>
							</b>
							<b style='mso-bidi-font-weight: normal'>
							<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体;'>银行转账，</span>
							</b>
							<b style='mso-bidi-font-weight: normal'><input type="text" class="input_text" disable="true" value="100"/></b>
							<b style='mso-bidi-font-weight: normal'>
							<span lang=EN-US style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体;'>%</span></b>
					   </c:when>
					   <c:when test="${(purchasingcontractbase.paymentType eq '转账')||(purchasingcontractbase.paymentType eq '银行转账')}">  
							<b style='mso-bidi-font-weight: normal'><input type="text" class="input_text" disable="true" value="100"/></b>
							<b style='mso-bidi-font-weight: normal'>
							<span lang=EN-US style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体;'>%</span>
							</b>
							<b style='mso-bidi-font-weight: normal'>
							<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体;'>银行转账，</span>
							</b>
							<b style='mso-bidi-font-weight: normal'><input type="text" class="input_text" disable="true" value="0"/></b>
							<b style='mso-bidi-font-weight: normal'>
							<span lang=EN-US style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体;'>%</span></b>
					   </c:when>
					   <c:when test="${(purchasingcontractbase.paymentType eq '转账,承兑汇票') || (purchasingcontractbase.paymentType eq '承兑汇票,转账')||(purchasingcontractbase.paymentType eq '银行转账,银行承兑') || (purchasingcontractbase.paymentType eq '银行承兑,银行转账')}">  
							<b style='mso-bidi-font-weight: normal'><input type="text" class="input_text" disable="true" value="30"/></b>
							<b style='mso-bidi-font-weight: normal'>
							<span lang=EN-US style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体;'>%</span>
							</b>
							<b style='mso-bidi-font-weight: normal'>
							<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体;'>银行转账，</span>
							</b>
							<b style='mso-bidi-font-weight: normal'><input type="text" class="input_text" disable="true" value="70"/></b>
							<b style='mso-bidi-font-weight: normal'>
							<span lang=EN-US style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体;'>%</span></b>
					   </c:when>
					   <c:otherwise> 
					   <b style='mso-bidi-font-weight: normal'><input type="text" class="input_text" disable="true" value="0"/></b>
							<b style='mso-bidi-font-weight: normal'>
							<span lang=EN-US style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体;'>%</span>
							</b>
							<b style='mso-bidi-font-weight: normal'>
							<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体;'>银行转账，</span>
							</b>
							<b style='mso-bidi-font-weight: normal'><input type="text" class="input_text" disable="true" value="0"/></b>
							<b style='mso-bidi-font-weight: normal'>
							<span lang=EN-US style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体;'>%</span></b>
					   </c:otherwise>
					</c:choose>
					<b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体;'>银行承兑</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体;mso-font-kerning: 0pt'>汇票</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>（期限为<span
					lang=EN-US>6</span>个月）。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>19.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>【</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1'>质量保修</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>】<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>19.1</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1'>乙方对产品的质量保修时间为一年，</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>在上述<span
					lang=EN-US>1</span>年的期间内，因乙方加工原因出现质量问题的，甲方通知乙方维修或更换。乙方接到甲方通知后，应在<u><span
						lang=EN-US> 3 </span></u>天内到场进行维修（不能维修的应予更换）。如乙方不到场维修或更换的，甲方有权另行委托第三方进行维修或更换，所需费用（以甲方支付给第三方的维修、更换款为准）在乙方的质保金中扣除。<b
					style='mso-bidi-font-weight: normal'><span lang=EN-US
						style='color: black; mso-themecolor: text1'><o:p></o:p></span></b></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>20.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>【</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1'>保证金</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>】<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>20.1</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>双方同意在乙方加工费中暂扣质量保修金，质量保修金金额为：</span><b
					style='mso-bidi-font-weight: normal'><input type="text" class="input_text" disable="true" value="${purchasingcontractbase.qualityGuaranteePrice}"/></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>元，<span
					style='color: black; mso-themecolor: text1'>合同生效后<span
						lang=EN-US>3</span>个月内
				</span>由甲方在乙方加工费金额中扣除<span style='color: black; mso-themecolor: text1'>。</span></span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>自原合同期满之日起届满<span
					lang=EN-US>1</span>年后<span lang=EN-US>15</span>个工作日内，并在扣除乙方应当承担的费用后无息返还给乙方。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>21.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【保密责任】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方对合作过程中所知悉的甲方的全部信息（包括技术信息和经营信息等，如图纸、样板等）负有保密义务，应采取妥善措施，防止保密信息外露。甲方合法持有并基于本合同目的提供给乙方的产品图形、文字及其组合的外观设计，乙方不得擅自使用或泄漏，且不得允许第三方使用或泄漏给任何第三方。未经甲方事前书面同意或为履行本合同义务之需要，乙方不得使用、披露甲方的商业秘密。乙方违反前述约定的，应当赔偿由此给甲方造成的全部损失。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>22.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【廉洁责任】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>在业务往来过程中，甲乙双方应当自觉遵守商业道德和诚信廉洁原则，遵循正当合法的商业行为规范，开展正常的业务交往。乙方不得给予或者承诺给予甲方员工及其关系人任何形式的贿赂或其他不正当利益（低价值的文具类纪念品除外）。前述“甲方员工”包括但不限于合约、采购、设计、财务等部门人员，前述“关系人”包括配偶、直系血亲或其他关系密切之亲属或朋友。乙方的廉洁承诺及保证详见《合作方反贿赂<span
					lang=EN-US>/</span>反腐败承诺书》。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>23.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【留置】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方承诺在任何情况下均不得扣押或留置甲方交付乙方的资产财物，发生争议应以本合同约定的方式和途径予以解决。双方合作结束时，如甲方尚有未到期的货款没有支付，乙方不得因此扣押留置甲方资产财物。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>24.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【违约责任】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲乙双方应按照合同约定履行各自的义务，如有违反，将按照以下约定承担违约责任：<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>24.1</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>虚假信息：乙方提供的信息存在重大虚假、错误、无效情况的，甲方有权随时解除本合同，并视影响大小要求乙方支付人民币一万元至五万元的违约金；因提供虚假、错误、无效的信息或资料给甲方造成实际损失的，乙方应另行赔偿甲方的实际损失。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>24.2</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方未按【价格】条款约定向甲方提供最优惠价格或价格保护的，甲方有权要求乙方退还差额部分，并按所涉及的交易总金额的<span
					lang=EN-US>10%</span>向甲方支付违约金。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>24.3</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方违反【保密责任】条款约定的，须赔偿甲方违约金人民币十万元，该违约金不足以弥补甲方损失的，则乙方应按照实际损失给予赔偿。即使乙方已经与甲方合作结束或不再合作，一旦如发现乙方或乙方员工对甲方机密信息进行泄密，甲方有权向乙方索取相应的经济损失；如发现乙方向外单位提供甲方所拥有的技术、设计或知识产权的，乙方同意向甲方支付二十万元人民币的赔偿。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>24.4</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方违反【廉洁责任】条款约定的，一经发现，无论甲方有无实际损失发生，甲方均有权直接免除乙方合格承揽商资格，同时要求乙方支付人民币五十万元作为违约金；如违约金不足以弥补甲方因此产生的实际损失<span
					lang=EN-US>, </span>则乙方实际应承担的违约责任以甲方实际损失的<span lang=EN-US>300%</span>为准。前述违约金甲方均有权从未付给乙方的货款中直接予以扣除，如未付货款不足抵扣，甲方有权要求乙方另行支付。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>24.5</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方违反【留置】条款约定扣押或留置甲方财物的，甲方有权要求乙方退还所扣押或留置的财物，并支付违约金人民币一万元。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>24.6</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方延迟交货的，每逾期交货一天，应向甲方支付当次承揽订单产品货值总额<span
					lang=EN-US>0.5%</span>的违约金，但累计违约金不超过该批货品订单货值总额的<span lang=EN-US>10%</span>。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>24.7</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>若</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方未在<span
					lang=EN-US>3</span>天内补齐或更换存在质量问题的产品，或承担由此增加的运输费用以及其他成本费用的，按延迟交货处理。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>24.8</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>因</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>乙方发货时未按甲方要求根据墙面方位配套所需材料，造成延误工期或工班窝工的，乙方须赔偿甲方因此所造成的实际损失，同时甲方有权根据问题的大小程度，要求乙方支付<span
					lang=EN-US>500</span>～<span lang=EN-US>2000</span>元<span lang=EN-US>/</span>次的违约金。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>24.9</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>因乙方产品质量不合格造成甲方损失的，如影响项目竣工验收、收楼、工期等，乙方应赔偿甲方由此造成的所有实际损失和采取必要补救措施所产生的额外费用，同时甲方有权根据问题的大小程度，要求乙方支付<span
					lang=EN-US>5000</span>～<span lang=EN-US>20000</span>元<span
					lang=EN-US>/</span>次的违约金。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>24.10</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>产品表面如带有超出标准的黑胆、扫花、色差、裂缝、臭洞、假线、色线等明显缺陷和其他影响材料外观效果的隐性质量问题等，乙方除按本合同约定承担（包括但不限于）一切不合格品的材料费、运输费及造成甲方二次拆装费等所有费用外，还应向甲方支付违约金。违约金的</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>具体约定详见本合同附件《产品质量验收标准》。</span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>24.11</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>若乙方擅自更换未经甲方确认的防水材料或使用假冒产品、以次充好的，一经发现，甲方有解除合同的权利，并要求乙方承担违约金人民币十万元及赔偿由此给甲方造成的所有实际损失。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>24.12</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>因乙方提供产品的缺陷或质量问题，导致了甲方及任何第三方的人身或财产损失，引发的该产品责任索赔，而导致的赔偿责任均由乙方承担。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>24.13</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>若甲方发现乙方货品存在掺杂、掺假、以假充真、以次充好等情况，将有权视为乙方所有已送和未送的货品全部质量不合格，乙方必须退还甲方所有已付的货款并赔偿甲方因此产生的实际损失。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>24.14</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>严重违约：乙方交付的产品存在质量问题导致甲方损失或者对第三方违约，致使甲方被客户取消合作资格、或被客户取消订单或索赔超过人民币<span
					lang=EN-US>1</span>万元、或对甲方企业公众形象造成恶劣影响的，视为严重违约，甲方有权解除合同并取消乙方合格供应商资格，乙方应按照双方上一年度内交易总额的<span
					lang=EN-US>10%</span>，或人民币二十万元给予赔偿，以较高者为准；如仍不能弥补甲方损失，则以甲方实际损失为赔偿标准。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>25.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【赔偿方式】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方依本合同承担的所有违约赔偿责任，甲方可直接从应支付给乙方的货款中扣除（不限于该批货款），货款不足以抵扣的，乙方应在十五天内另行补足，限期内不予补足又不向甲方请求协商合理赔偿方案的，将从期限结束之日起，以未偿付的金额为本金，按照同期银行活期存款利息的<span
					lang=EN-US>2 </span>倍计算并收取滞纳金。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>26.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【不可抗力】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>任何一方受到不可抗力事件的影响而延迟或无履行合同义务的，可以减轻或免除违约责任。受不可抗力影响一方应在出现不可抗力之时起<span
					lang=EN-US>24 </span>小时内通知对方，并在不可抗力排除后七个工作日内提供不可抗力事件发生地的政府机构或公证机关出具的证明材料，否则视为未发生不可抗力。违约方迟延履行合同义务后发生的不可抗力事件不能免除其违约责任。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>27.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【争议解决方式】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲乙双方因本合同所发生的任何争议，应秉承友好合作的精神协商解决；协商无达成一致的，任何一方可向甲方所在地人民法院提起诉讼。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>28.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【合同效力】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>本合同一式肆份，甲方执三份，乙方执一份，具有同等律效力。自甲乙双方签字并盖章之日起生效。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>28.1</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>本合同生效前甲乙双方的约定与本合同不一致的，以本合同约定内容为准。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>28.2</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲乙双方可以通过书面协议方式对本合同进行修改和补充。经双方正式签署生效的修改条款和补充协议是本合同的组成部分，除非另有约定，否则与本合同具有同等效力。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>29.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【合同期限】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>本合同有效期为：<b
					style='mso-bidi-font-weight: normal'><span>自生效之日起至</span></b></span><b
					style='mso-bidi-font-weight: normal'><input type="text" class="input_date" disable="true" value="${purchasingcontractbase.endTime}"/></b><b style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'>止。</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>如任何一方未于期限届满前三十天以书面方式通知另一方不再续签，则本合同自动延长一年，嗣后亦同。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>30.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【合同解除】</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>本合同生效期间内，未经双方协商同意达成一致书面意见，任何一方均不得随意解除合同；如任何一方因发展需要确须解除本合同，必须提前至少<span
					lang=EN-US>30</span>天书面通知另一方，双方就债权债务清理等善后事宜达成书面一致意见后，方可解除本合同。<b
					style='mso-bidi-font-weight: normal'><span lang=EN-US><o:p></o:p></span></b></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>31.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【其他】<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>31.1</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>本合同中的标题仅作为参考，不影响本合同具体条款内容的含义及其解释。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>31.2</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>本合同终止或解除后，甲乙双方尚有未履行完毕的合同义务的（如尚有承揽订单未交货或付款完毕），本合同相关条款的效力延长至合同义务履行完毕之日为止。但有关保密责任、商业廉洁、违约责任及纠纷解决方式等条款长期有效，不因本合同的终止或解除而失效。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>31.3</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>双方确认，计算“实际损失”或其他赔偿时，产品价格均按甲方市场售价计，人工成本按实际人工成本计。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>32.</span></b><b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>【本合同附件】</span></b><b
					style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>32.1</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>《承揽商石材出入库管理规定》</span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>32.2</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>《价格表》<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>32.3</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>《产品包装要求及</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>发货、装卸流程</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>》<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>32.4</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>《产品质量验收标准》<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>32.5</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>《合作方反贿赂<span
					lang=EN-US>/</span>反腐败承诺书》<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly; tab-stops: 99.0pt; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲方（名称及盖章）：<span
					lang=EN-US><span style='mso-spacerun: yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span>乙方（名称及盖章）： <span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly; tab-stops: 99.0pt; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>授权代表人：<span
					lang=EN-US><span style='mso-spacerun: yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span>授权代表人：<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 150%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span
					style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif";'>日期：</span></b><b
					style='mso-bidi-font-weight: normal'><input type="text" class="input_date" disable="true" value="${purchasingcontractbase.startTime}"/></b><b
					style='mso-bidi-font-weight: normal'>
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span
					style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif";'>日期：<span
						lang=EN-US><span style='mso-spacerun: yes'>&nbsp;&nbsp;
						</span></span></span></b><b style='mso-bidi-font-weight: normal'><input type="text" class="input_date" disable="true" value="${purchasingcontractbase.startTime}"/></b><b
					style='mso-bidi-font-weight: normal'><u><span lang=EN-US
						style='font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif";'><o:p></o:p></span></u></b>
			</p>
			
			<p class=MsoNormal
				style='line-height: 125%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>
			
			<p class=MsoNormal
				style='line-height: 125%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>
			<p class=MsoNormal
				style='line-height: 125%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>
			
			<p class=MsoNormal
				style='line-height: 125%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>
			<p class=MsoNormal
				style='line-height: 125%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 125%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span
					style='mso-bidi-font-size: 10.5pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"'>《承揽基本合同》附件：<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 125%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p align=center
				style='margin: 0cm; margin-bottom: .0001pt; text-align: center; line-height: 150%;'>
				<b style='mso-bidi-font-weight: normal'><span
					style='font-size: 16.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>承揽商石材出入库管理规定<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>1.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>目的<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>为加强对进入承揽商（以下根据合同，简称乙方）仓库板材的管理，保障板材出入库管理正常和有序，界定我公司（以下根据合同，简称甲方）与乙方各自的合法权益，确保双方合作顺利进行，达到双赢的目的，现根据双方合作约定并结合实际，制定本规定。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>2.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>适用范围<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>2.1</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>适用于乙方及乙方员工。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>2.2</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>适用于所有根据合同约定进入乙方仓库的石材。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>3.
				</span></b><b style='mso-bidi-font-weight: normal'><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>乙方的责任<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>根据双方合同的约定，乙方对甲方送到乙方仓库的石材有“收货”、“发货”、“存放”和“管理”的责任，重点包括对板材质量的验收，收、发货手续办理，出入库登记、石材出材率的保证等等。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>4.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>原材料（板材）入库管理</span></b><span
					lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'><o:p></o:p></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>4.1</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>甲方安排运送到乙方处卸货的板材，乙方应在货到后当天指定专人进行验收。验收内容包括：名称、尺码单、总架（篇）数、面积、批号、等级、包装状况和合格证明等。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>4.2</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>乙方经验收确认板材合格的，应登记供货厂家、到货日期等相关信息并办理签收入库；若有不合格的，乙方应立即（货到当天）通知甲方外协或仓库管理人员到场确认。到货后乙方不验收或验收后未通知验收结果的，均视为质量合格，板材质量责任由乙方负责。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>4.3</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>乙方使用板材时要开领料单，领料单必须注明项目名称、订单号、大板（板材）编号、数量等并通知甲方仓库管理人员。乙方所领的大板（板材）没有使用完的，要及时办理退库并通知甲方仓库管理人员。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>4.4</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>乙方发现板材的出材率确因客观原因不能达到合同约定的出材率的，必须及时通知甲方外协管理人员进行确认，如情况属实，可予适当调整，否则由乙方负责赔偿。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>4.5</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>乙方对入库板材的数量、规格、尺寸、质量等负管理责任，若有破损、丢失等由乙方负责赔偿。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>4.6</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>甲方仓库管理人员每周将到乙方处对板材库存等进行检查，乙方应与配合，不得推拖。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>5.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>储存管理</span></b><span
					lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'><o:p></o:p></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>5.1</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>乙方库存板材的标识应当清晰，便于识别，标识应当包括名称或代号、型号<span
					lang=EN-US>/</span>规格<span lang=EN-US>/</span>尺寸、数量、批号、入库日期等等，并有挂标牌的方法做出。若产品外包装已有上述标识的，可仅挂产品型号的标识牌。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>5.2</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>库存板材存放应做到<span
					lang=EN-US>“</span>三齐<span lang=EN-US>”</span>、<span lang=EN-US>“</span>五距<span
					lang=EN-US>”</span>，即堆放齐、码垛齐、排列齐和离灯、离柱、离墙大于<span lang=EN-US>50</span>厘米、与屋顶保持一定距离、垛与垛之间应有适当间隔。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>5.3</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>箱装石材成品必须按订单号、批号、箱号码放，高度不得超过<span
					lang=EN-US>2</span>层，以确保安全。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>5.4</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>大板存放按类别、品种、颜色，分类、分区域整齐码放，纸箱包装码放高度不得超过规定层数；袋包装和桶包装码放高度不宜过高，以防损坏产品。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>6.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>发放管理<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>6.1</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>生产人员应凭《生产订单》和《配<span
					lang=EN-US>/</span>领料单》到仓库领取板材、辅料或半成品。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>6.2</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>库管员应按《生产订单》和《配<span
					lang=EN-US>/</span>领料单》批准的实际数量备料、发放。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>6.2.1</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>发放时，如果发现批准数量和实际发放数量不符时，库管员应在《配<span
					lang=EN-US>/</span>领料单》备注栏中填写实际发放的数量。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>6.2.2</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>实行批次管理的辅料，仓管员每天备料、发料时应在《配<span
					lang=EN-US>/</span>领料单》上填写该原料的批号，以达到可追溯的目的。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>6.3</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>大板或石材成品出库时必须有甲方财务中心审批的《出库单》。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>6.4</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>仓管员发放板材、半成品或成品时应做到：<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>6.4.1</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>认真核对《配<span
					lang=EN-US>/</span>领料单》或《出库单》或《收款发货通知单》的各项内容，凡填写不齐全、字迹不清晰、审批手续不完备的不得发放。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>6.4.2</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>认真核对实物的订单号、品名、尺寸和数量，符合领料或出库凭证要求的才能发放。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>6.4.3</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>发放完毕，应对《配<span
					lang=EN-US>/</span>领料单》或《出库单》或《收款发货通知单》进行审核，财务记账联应及时上交甲方会计，其余单据应妥善保管。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>6.4.4</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>若产品标识破损、字迹不清，应重新作出标识后再发放。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>6.4.5</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>同一规格的原料、半成品、成品应按<span
					lang=EN-US>“</span>先进后出<span lang=EN-US>”</span>的原则进行发放。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>7.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>甲方的管理<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>7.1</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>甲方将对乙方仓库进行不定期的抽查，检查账、物、卡相符状况，存放情况、标识情况等等。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>7.2</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>甲方将对乙方仓库进行动态盘点，以便做到日清日结，保持账、物相符，配合乙方做好年中和年末的库存盘点工作。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>8</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>、其他<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>8.1</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>乙方承诺严格执行本规定。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p
				style='margin: 0cm; margin-bottom: .0001pt; line-height: 19.0pt; mso-line-height-rule: exactly; '>
				<span lang=EN-US
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>8.2</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>本规定为双方签订的《</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>承揽基本合同</span><span
					style='font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial; color: black; mso-themecolor: text1'>》的补充约定，具有同等法律效力。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 125%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 125%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 125%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 125%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 125%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 125%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 125%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 125%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 125%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span
					style='mso-bidi-font-size: 10.5pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"'>《承揽基本合同》附件：<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 125%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal align=center
				style='text-align: center; line-height: 125%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span
					style='font-size: 16.0pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"'>产品包装要求及</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 16.0pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>发货、装卸流程</span></b><b
					style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 16.0pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>1.</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>乙方应根据产品特性，按照法律规及相关国家标准及双方确定的包装标准进行妥善包装，确保产品在运输、装卸过程中得到完好保护，且便于识别。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>1.1</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>产品应捆扎稳妥，以保证在运输中产品不受磨擦损伤。对没有进行适当保护或受损的商品，甲方有权不予接受。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>1.2</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>甲乙双方确认的结算价格已包含包装及包装所需材料费用。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2.</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>包装及发货标准要求：</span><span
					lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2.1</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>甲方成品装箱标准：</span><b
					style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2.1.1</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>木箱包装（以内装、橱柜成品为主）</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif";'>：<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2.1.1.1</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>木箱立柱用料为杂木，木材规格为<span
					lang=EN-US>2cm*8cm (</span>厚度和宽度的尺寸误差为<span lang=EN-US>0-2mm)</span>；其他部位用杂木<span
					lang=EN-US>, </span>木材规格为<span lang=EN-US>2cm*7cm (</span>厚度和宽度的尺寸误差为<span
					lang=EN-US>0- -2mm)</span>；底部木方规格<span lang=EN-US>5cm*8cm (</span>厚度和宽度的尺寸误差为<span
					lang=EN-US>0--2mm)</span>。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2.1.1.2</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>箱内石材叠装不超过六层。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2.1.1.3</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>单件石材长度在<span
					lang=EN-US>50cm</span>以下可以分两排装箱，超过<span lang=EN-US>50cm</span>一排过。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2.1.1.4</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>箱内空隙要用富有弹性的柔软材料填充。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2.1.1.5</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>将石材光面相对，顺序立放于放有防潮纸的木箱内，四周用包装棉保护。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2.1.2</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>地台板、包装带包装（以幕墙成品为主）</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; '>：<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2.1.2.1</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>用新鲜木材订制地台板，三根垫木需规则方柱形，触地面宽度不低于<span
					lang=EN-US>7-8cm</span>。
				</span><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2.1.2.2</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>木板尺寸为<span
					lang=EN-US>2*8cm</span>，数量不少于<span lang=EN-US>5</span>块。
				</span><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2.1.2.3</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>将石材平整平放在地台板上，正确材料码放必须上小下大（指尺寸），层与层之间垫放竹篾片或布条，底层石材长度以不超过地台板边缘<span
					lang=EN-US>5-10cm</span>为宜。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2.1.2.4</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>将石材用塑钢包装带按“井”字型捆扎，每捆扎点不少于四道；石材棱角用竹篾片包起来，然后用塑钢包装带捆扎紧。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2.1.2.5</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>单件成品码放高度不超过<span
					lang=EN-US>120cm</span>，单件成品重量不超过<span lang=EN-US>2</span>吨。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2.1.2.6</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>使用包装带包装的材料装车时，为避免相邻两扎产品直接接触，扎距要在<span
					lang=EN-US>10cm</span>以上，且需放置防撞木方，以防相互碰撞造成棱角破裂。
				</span><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>2.2</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>整体包装必须使用实木板、箱牢固包装，以适应长途运输及装卸。</span><span
					lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>2.3</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>包装箱上必须装订经过塑防水处理的本箱货品清单（即唛头）及排板图。</span><span
					lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>2.4</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>乙方必须严格按照甲方承揽订单的装箱安排进行装箱。如乙方提出改变装箱清单，必须提前向甲方提交更改装箱安排的书面报告，得到甲方同意并重新出具装箱清单后才可更改。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>2.4.1</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>未经甲方书面同意，乙方擅自更改装箱安排的，甲方所造成的所有损失由乙方承担。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>2.4.2</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>甲方同意乙方更改装箱安排的，乙方的更改装箱报告书作为发货及后续结算附件。（一式<span
					lang=EN-US>5</span>份，外协跟单员一份、外委加工厂一份、统计结算留底一份、财务中心一份、运营现场跟单员一份）
				</span><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>2.5</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>包装上不得出现任何非甲方公司的标识。</span><span
					lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>2.6</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>乙方必须在每块材料的侧面或非可视面使用防水、防擦的墨水清晰、完整的标注材料的箱号、编号、规格尺寸，三者缺一不可。货到工地如发现标注不齐，从第四次起，甲方有权根据问题的大小程度，要求乙方支付<span
					lang=EN-US>500</span>～<span lang=EN-US>2000</span>元<span lang=EN-US>/</span>次的违约金。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>2.7</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1'>凡因货不对板，货不对标签，超出总量千分之五，由乙方派人前往工地与石材工程业主协调解决，由此造成甲方的工期延误或者其他损失，所产生的费用也由乙方全部承担。</span><span
					lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2.8</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>因产品包装不符合要求（标准）、包装不牢固等造成产品在包装内破损或运输破损的，损失由乙方承担，甲方有权在应付乙方的货款中直接抵扣该些损失，损失包括破损产品价值、运输及管理费等。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>发货、装卸流程为：</span><span
					lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>2.8.1</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>装车及发货由乙方自行与甲方委托的物流公司联系，并按计划安排人员装车和制作发货清单等，现场拍照确认有无包装问题。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>2.8.2</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>货到工地，甲方卸车前查看有无破损现象，并拍照留底。若包装无松散现象（塑钢带无断裂、地台板无变形损坏）的，破损由乙方承担，反之破损由运输公司承担。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>2.8.3</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>卸车由运输公司与甲方工地材料员进行交接，每箱数量由乙方与甲方工地材料员交接，避免货不对单及数量缺失。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>2.8.4
				</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>乙方可在材料侧面把编号拍照留底确认单货一致。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2.9</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>对乙方原因造成的甲方损失，甲方将根据实际情况制作违约扣款单，乙方如有异议必须在<span
					lang=EN-US>5</span>个工作日内提出，若过期不回复，则视为乙方确认事实同意甲方的扣款决定和金额。乙方同意甲方可直接在应付给乙方的货款中直接扣减。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal style='line-height: 150%'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal style='line-height: 150%'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal style='line-height: 150%'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal style='line-height: 150%'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal style='line-height: 150%'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal style='line-height: 150%'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal style='line-height: 150%'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal style='line-height: 150%'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal style='line-height: 150%'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 125%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span
					style='mso-bidi-font-size: 10.5pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"'>《承揽基本合同》附件：<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal align=center
				style='text-align: center; line-height: 125%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span
					style='font-size: 16.0pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"'>产品质量验收标准<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 17.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'>1.</span><span
					style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'>甲乙双方对质量验收标准、方法及期限等具体约定如下：<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 17.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'>1.1</span><span
					style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'>产品（石材）必须色泽均一，无明显色差，并与双方封存样板相符；石材表面不能带有黑胆、扫花、色差、裂缝、臭洞、假线、色线等明显缺陷。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 17.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'>1.2</span><span
					style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'>公差按加工图纸的尺寸误差应控制在厚度负<span
					lang=EN-US>1mm</span>、正<span lang=EN-US>2mm</span>；长宽数正负<span
					lang=EN-US>1mm</span>；对角线数正负<span lang=EN-US>1mm</span>。其他尺寸要求和公差控制详见订单。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 17.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'>1.3</span><span
					style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'>石材阴阳角连接处、或需进行密缝安装的，必经拼装检验合格后才可包装。石材拼口应平滑过渡，并在每件非装饰面的封头写上拼接编号。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 17.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'>1.4</span><span
					style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'>乙方交货时应提交经甲方确认样式的该批货品的名称、型号、数量、编号和装箱清单。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 17.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'>1.5</span><span
					style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'>甲方收货后<span
					lang=EN-US>7</span>日内发现数量有误或乙方所加工产品的规格、表面质量等达不到验收标准的，书面通知乙方，乙方应在<span
					lang=EN-US>3</span>天内完成更换，并承担因此而产生的全部费用。如上述期限内甲方未提出书面异议的，视为甲方对该批货物的数量、规格和表面质量问题确认验收合格。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 17.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'>1.6</span><span
					style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'>乙方确认，产品隐性质量问题和加工工艺错误的，甲方有权在项目工程完结前任何时间提出异议。乙方接到书面通知后应在<span
					lang=EN-US>3</span>天内完成更换，并承担因此而产生的全部费用。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 17.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'>1.7</span><span
					style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'>在收到甲方通知后，乙方未能在三十内日将不合格产品运离，视为乙方抛弃该些产品，凭甲方处置。</span><span
					lang=EN-US
					style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 17.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>1.8</span><span
					style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>主要检查项目、执行标准、处罚（指违约金）标准见下表：<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<div align=center>

				<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
					width=718
					style='width: 538.7pt; margin-left: -8.8pt; border-collapse: collapse; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>
					<tr
						style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; height: 19.5pt'>
						<td width=38
							style='width: 28.4pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.5pt'>
							<p class=MsoNormal align=center
								style='text-align: center; line-height: 15.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<b style='mso-bidi-font-weight: normal'><span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>序号<span
										lang=EN-US><o:p></o:p></span></span></b>
							</p>
						</td>
						<td width=142
							style='width: 106.3pt; border: solid windowtext 1.0pt; border-left: none; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.5pt'>
							<p class=MsoNormal align=center
								style='text-align: center; line-height: 15.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<b style='mso-bidi-font-weight: normal'><span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>检查项目<span
										lang=EN-US><o:p></o:p></span></span></b>
							</p>
						</td>
						<td width=161
							style='width: 120.5pt; border: solid windowtext 1.0pt; border-left: none; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.5pt'>
							<p class=MsoNormal align=center
								style='text-align: center; line-height: 15.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<b style='mso-bidi-font-weight: normal'><span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>执行标准<span
										lang=EN-US><o:p></o:p></span></span></b>
							</p>
						</td>
						<td width=170
							style='width: 127.55pt; border: solid windowtext 1.0pt; border-left: none; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.5pt'>
							<p class=MsoNormal align=center
								style='text-align: center; line-height: 15.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<b style='mso-bidi-font-weight: normal'><span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>处罚起点<span
										lang=EN-US><o:p></o:p></span></span></b>
							</p>
						</td>
						<td width=132
							style='width: 99.25pt; border: solid windowtext 1.0pt; border-left: none; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.5pt'>
							<p class=MsoNormal align=center
								style='text-align: center; line-height: 15.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<b style='mso-bidi-font-weight: normal'><span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>处罚金额<span
										lang=EN-US><o:p></o:p></span></span></b>
							</p>
						</td>
						<td width=76
							style='width: 2.0cm; border: solid windowtext 1.0pt; border-left: none; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.5pt'>
							<p class=MsoNormal align=center
								style='text-align: center; line-height: 15.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<b style='mso-bidi-font-weight: normal'><span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>备注<span
										lang=EN-US><o:p></o:p></span></span></b>
							</p>
						</td>
					</tr>
					<tr style='mso-yfti-irow: 1; height: 28.5pt'>
						<td width=38
							style='width: 28.4pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 28.5pt'>
							<p class=MsoNormal align=center
								style='text-align: center; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span lang=EN-US
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>1<o:p></o:p></span>
							</p>
						</td>
						<td width=142
							style='width: 106.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 28.5pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>平板的拉槽深度及宽度<span
									lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=161
							style='width: 120.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 28.5pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>拉槽宽度误差不大于±<span
									lang=EN-US>1mm<o:p></o:p></span></span>
							</p>
							<p class=MsoNormal align=center
								style='text-align: center; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>拉槽深度误差不大于±<span
									lang=EN-US>1mm<o:p></o:p></span></span>
							</p>
						</td>
						<td width=170
							style='width: 127.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 28.5pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>单栋累计开槽深度或宽度不达标<span
									lang=EN-US>15</span>块以上<span lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=132
							style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 28.5pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>单栋<span
									lang=EN-US>1000</span>元，每增加<span lang=EN-US>15</span>块增加<span
									lang=EN-US>1000</span>元罚款<span lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=76 rowspan=10
							style='width: 2.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; layout-flow: vertical-ideographic; height: 28.5pt'>
							<p class=MsoNormal align=center
								style='text-align: center; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>一
									般 项 目 标 准<span lang=EN-US><o:p></o:p></span>
								</span>
							</p>
						</td>
					</tr>
					<tr style='mso-yfti-irow: 2; height: 6.8pt'>
						<td width=38
							style='width: 28.4pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 6.8pt'>
							<p class=MsoNormal align=center
								style='text-align: center; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span lang=EN-US
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>2<o:p></o:p></span>
							</p>
						</td>
						<td width=142
							style='width: 106.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 6.8pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>平板的厚度<span
									lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=161
							style='width: 120.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 6.8pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>厚度误差不大于±<span
									lang=EN-US>2mm<o:p></o:p></span></span>
							</p>
						</td>
						<td width=170
							style='width: 127.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 6.8pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>单栋累计厚度不达标<span
									lang=EN-US>30</span>块以上<span lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=132
							style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 6.8pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>单栋<span
									lang=EN-US>1000</span>元，每增加<span lang=EN-US>30</span>块增加<span
									lang=EN-US>1000</span>元罚款<span lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
					</tr>
					<tr style='mso-yfti-irow: 3; height: 3.5pt'>
						<td width=38
							style='width: 28.4pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 3.5pt'>
							<p class=MsoNormal align=center
								style='text-align: center; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span lang=EN-US
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>3<o:p></o:p></span>
							</p>
						</td>
						<td width=142
							style='width: 106.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 3.5pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>直线条的拼接<span
									lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=161
							style='width: 120.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 3.5pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>直线条拼接是否顺滑，拼接误差不大于±<span
									lang=EN-US>2mm<o:p></o:p></span></span>
							</p>
						</td>
						<td width=170
							style='width: 127.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 3.5pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>单栋累计直线条拼接不达标<span
									lang=EN-US>5</span>处以上<span lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=132
							style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 3.5pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>单栋<span
									lang=EN-US>1000</span>元，每增加<span lang=EN-US>5</span>处增加<span
									lang=EN-US>1000</span>元罚款<span lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
					</tr>
					<tr style='mso-yfti-irow: 4; height: 3.5pt'>
						<td width=38
							style='width: 28.4pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 3.5pt'>
							<p class=MsoNormal align=center
								style='text-align: center; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span lang=EN-US
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>4<o:p></o:p></span>
							</p>
						</td>
						<td width=142
							style='width: 106.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 3.5pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>弧形线条的拼接<span
									lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=161
							style='width: 120.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 3.5pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>弧形线条拼接是否顺滑，拼接误差不大于±<span
									lang=EN-US>2mm<o:p></o:p></span></span>
							</p>
						</td>
						<td width=170
							style='width: 127.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 3.5pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>单栋累计弧线条拼接不达标<span
									lang=EN-US>2</span>处以上<span lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=132
							style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 3.5pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>单栋<span
									lang=EN-US>1000</span>元，每增加<span lang=EN-US>2</span>处增加<span
									lang=EN-US>1000</span>元罚款<span lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
					</tr>
					<tr style='mso-yfti-irow: 5; height: 3.5pt'>
						<td width=38 rowspan=2
							style='width: 28.4pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 3.5pt'>
							<p class=MsoNormal align=center
								style='text-align: center; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span lang=EN-US
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>5<o:p></o:p></span>
							</p>
						</td>
						<td width=142 rowspan=2
							style='width: 106.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 3.5pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>罗马板、罗马柱<span
									lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=161
							style='width: 120.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 3.5pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span lang=EN-US
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>1</span><span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>、拼接是否顺滑，拼接误差不大于±<span
									lang=EN-US>1mm<o:p></o:p></span></span>
							</p>
						</td>
						<td width=170 rowspan=2
							style='width: 127.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 3.5pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>单栋累计不达标<span
									lang=EN-US>1</span>处以上<span lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=132 rowspan=2
							style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 3.5pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>每处<span
									lang=EN-US>1000</span>元罚款<span lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
					</tr>
					<tr style='mso-yfti-irow: 6; height: 3.5pt'>
						<td width=161
							style='width: 120.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 3.5pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span lang=EN-US
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>2</span><span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>、不允许有臭洞、黑胆、黑扫、色带等材质问题<span
									lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
					</tr>
					<tr style='mso-yfti-irow: 7; height: 21.85pt'>
						<td width=38 rowspan=2
							style='width: 28.4pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.85pt'>
							<p class=MsoNormal align=center
								style='text-align: center; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span lang=EN-US
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>6<o:p></o:p></span>
							</p>
						</td>
						<td width=142 rowspan=2
							style='width: 106.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.85pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>圆柱、栏杆<span
									lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=161
							style='width: 120.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.85pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span lang=EN-US
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>1</span><span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>、加工误差不大于±<span
									lang=EN-US>2mm<o:p></o:p></span></span>
							</p>
						</td>
						<td width=170 rowspan=2
							style='width: 127.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.85pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>单栋累计加工不达标<span
									lang=EN-US>5</span>处以上或出现臭洞、黑胆、黑扫、色带等材质问题<span lang=EN-US>1</span>处以上<span
									lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=132 rowspan=2
							style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.85pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>单栋<span
									lang=EN-US>500</span>元，每增加<span lang=EN-US>1</span>项增加<span
									lang=EN-US>500</span>元罚款<span lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
					</tr>
					<tr style='mso-yfti-irow: 8; height: 11.95pt'>
						<td width=161
							style='width: 120.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 11.95pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span lang=EN-US
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>2</span><span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>、不允许有臭洞、黑胆、黑扫、色带等材质问题<span
									lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
					</tr>
					<tr style='mso-yfti-irow: 9; height: 18.75pt'>
						<td width=38 rowspan=2
							style='width: 28.4pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.75pt'>
							<p class=MsoNormal align=center
								style='text-align: center; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span lang=EN-US
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>7<o:p></o:p></span>
							</p>
						</td>
						<td width=142 rowspan=2
							style='width: 106.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.75pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>雕刻<span
									lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=161
							style='width: 120.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.75pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span lang=EN-US
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>1</span><span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>、没有按图纸加工<span
									lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=170 rowspan=2
							style='width: 127.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.75pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>单栋累计加工不达标<span
									lang=EN-US>3</span>处以上<span lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=132 rowspan=2
							style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.75pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>单栋<span
									lang=EN-US>1000</span>元，每增加<span lang=EN-US>3</span>处增加<span
									lang=EN-US>1000</span>元罚款<span lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
					</tr>
					<tr style='mso-yfti-irow: 10; height: 21.45pt'>
						<td width=161
							style='width: 120.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.45pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span lang=EN-US
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>2</span><span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>、雕刻深度及手工不达要求<span
									lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
					</tr>
					<tr style='mso-yfti-irow: 11; height: 25.45pt'>
						<td width=38
							style='width: 28.4pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 25.45pt'>
							<p class=MsoNormal align=center
								style='text-align: center; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span lang=EN-US
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>8<o:p></o:p></span>
							</p>
						</td>
						<td width=142
							style='width: 106.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 25.45pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>甲线、暗裂<span
									lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=161
							style='width: 120.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 25.45pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>材料存在甲线、暗裂<span
									lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=170
							style='width: 127.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 25.45pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>单栋累计<span
									lang=EN-US>10</span>处<span lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=132 rowspan=4
							style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 25.45pt'>
							<p class=MsoNormal align=center
								style='text-align: center; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>第一次触碰红线罚款<span
									lang=EN-US>20000</span>元；第二次触碰红线罚款<span lang=EN-US>50000</span>元；第三次触碰红线罚款一律清退，永不录用<span
									lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=76 rowspan=4
							style='width: 2.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; layout-flow: vertical-ideographic; height: 25.45pt'>
							<p class=MsoNormal align=center
								style='text-align: center; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>红
									线 项 目 标 准<span lang=EN-US><o:p></o:p></span>
								</span>
							</p>
						</td>
					</tr>
					<tr style='mso-yfti-irow: 12; height: 3.5pt'>
						<td width=38
							style='width: 28.4pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 3.5pt'>
							<p class=MsoNormal align=center
								style='text-align: center; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span lang=EN-US
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>9<o:p></o:p></span>
							</p>
						</td>
						<td width=142
							style='width: 106.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 3.5pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>板材、线条的臭洞、色斑黑胆、材质问题<span
									lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=161
							style='width: 120.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 3.5pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>允许不大于“五角硬币”面积的臭洞或色斑黑胆一面墙<span
									lang=EN-US>10</span>个<span lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=170
							style='width: 127.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 3.5pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>一面墙累计<span
									lang=EN-US>10</span>个以上<span lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
					</tr>
					<tr style='mso-yfti-irow: 13; height: 20.65pt'>
						<td width=38
							style='width: 28.4pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.65pt'>
							<p class=MsoNormal align=center
								style='text-align: center; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span lang=EN-US
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>10<o:p></o:p></span>
							</p>
						</td>
						<td width=142
							style='width: 106.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.65pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>板材、线条的黑扫、色带材质问题<span
									lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=161
							style='width: 120.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.65pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>不允许黑扫及色带<span
									lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=170
							style='width: 127.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.65pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>单栋累计不达标<span
									lang=EN-US>1</span>处以上<span lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
					</tr>
					<tr
						style='mso-yfti-irow: 14; mso-yfti-lastrow: yes; height: 27.25pt'>
						<td width=38
							style='width: 28.4pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 27.25pt'>
							<p class=MsoNormal align=center
								style='text-align: center; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span lang=EN-US
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>11<o:p></o:p></span>
							</p>
						</td>
						<td width=142
							style='width: 106.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 27.25pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>色差<span
									lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=161
							style='width: 120.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 27.25pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>不允许存在明显色差<span
									lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
						<td width=170
							style='width: 127.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 27.25pt'>
							<p class=MsoNormal align=left
								style='text-align: left; line-height: 11.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
								<span
									style='font-size: 8.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1; mso-font-kerning: 0pt'>单栋累计不达标<span
									lang=EN-US>1</span>处以上<span lang=EN-US><o:p></o:p></span></span>
							</p>
						</td>
					</tr>
				</table>

			</div>

			<p class=MsoNormal
				style='line-height: 125%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span
					style='mso-bidi-font-size: 10.5pt; line-height: 125%; font-family: "微软雅黑", "sans-serif"'>《承揽基本合同》附件：<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal align=center
				style='text-align: center; line-height: 18.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span
					style='font-size: 16.0pt; font-family: "微软雅黑", "sans-serif"'>合作方反贿赂<span
						lang=EN-US>/</span>反腐败承诺书<span lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>致：</span></b><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>广东万方建设有限公司<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>承诺方作为受诺方的长期合作商，本着诚实信用、公平竞争、不损害双方及任何第三方利益的原则，依据国家相关法律的规定，经与受诺方协商一致，做出如下承诺：<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>1</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、承诺方将严格按照国家法律和有关法规、规章，进行正当商业往来。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、不以任何名义、理由借钱、借物给受诺方员工。否则，因该行为产生的一切后果由承诺方自行承担，与受诺方无关。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>3</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、在双方合作过程中，不以任何名义给予受诺方员工回扣、提成等行为，或为其报销应由其个人支付的费用，不采取不正当手段获利。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>4</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、不以任何名义、理由向受诺方员工馈赠礼物、现金、有价证券（卡）及安排宴请、娱乐消费、配偶子女工作以及旅游等活动。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>5</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、不用黄、赌、贿等各种手段拉拢腐蚀甲方工作人员。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>6</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、不违反国家有关维护农民工利益的各项法规和政策规定。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>7</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、不接受受诺方员工以个人或亲朋好友名义提出的兼职、顾问、中介等有偿服务，若受诺方员工利用职务便利，在双方合作过程中提出该等要求，承诺方有责任立即反馈投诉至受诺方。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>8</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、不接受受诺方员工以个人或亲朋好友名义提出的入股、联营等可能形成与受诺方业务相竞争或损害受诺方利益的合作。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>9</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、若受诺方员工利用职务便利，在双方合作过程中有故意刁难或任何不公正行为，甚至以直接或暗示方式向承诺方索取回扣、物品，承诺方有责任立即反馈投诉至受诺方，投诉电话：</span><span
					lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>18988676405</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>，</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>邮箱：</span><span
					lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>jc@wangfanggroup.com</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>。</span><span
					lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>如承诺方及代理人违背本承诺书所涉及条款，受诺方有权单方终止与我方的业务，取消我方的合作资格，同时有权要求我方支付</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>不超过<span
					lang=EN-US>50</span>万人民币的违约金
				</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>，并由我方承担由此造成的全部损失（包括但不限于直接或间接损失、诉讼费用、律师费等）。对触犯刑法的，我方将配合进行司法程序。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>只要存在上述行为，受诺方</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>无须提供证据证明</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>承诺方</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>违反诚实惯例</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>，该行为</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>即被视为不正当竞争</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>本承诺经承诺方盖章或签名后生效，在双方任何合作、交易期间内均有效。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 78.75pt; mso-char-indent-count: 7.5; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>承诺单位（盖章）<span
					lang=EN-US>/</span>承诺人（签名及身份证号码）：<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 52.5pt; mso-char-indent-count: 5.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-spacerun: yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span></span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>年<span
					lang=EN-US><span style='mso-spacerun: yes'>&nbsp;&nbsp;
					</span></span>月<span lang=EN-US><span style='mso-spacerun: yes'>&nbsp;&nbsp;
					</span></span>日<span lang=EN-US><o:p></o:p></span></span>
			</p>

		</div>

	</body>
</div>
</html>
