<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">

<title></title>
<script type="text/javascript" src="${ctxStatic}/jquery-validation/1.11.1/lib/jquery-1.7.2.js"></script>
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
	font-family: "Cambria Math";
	panose-1: 0 0 0 0 0 0 0 0 0 0;
	mso-font-charset: 1;
	mso-generic-font-family: roman;
	mso-font-format: other;
	mso-font-pitch: variable;
	mso-font-signature: 0 0 0 0 0 0;
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

p.MsoCommentText, li.MsoCommentText, div.MsoCommentText {
	mso-style-unhide: no;
	mso-style-link: "批注文字 Char";
	margin: 0cm;
	margin-bottom: .0001pt;
	mso-pagination: none;
	font-size: 10.5pt;
	mso-bidi-font-size: 12.0pt;
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

span.MsoCommentReference {
	mso-style-unhide: no;
	mso-ansi-font-size: 10.5pt;
	mso-bidi-font-size: 10.5pt;
}

p {
	mso-style-unhide: no;
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
	mso-bidi-font-size: 12.0pt;
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

span.Char1 {
	mso-style-name: "批注文字 Char";
	mso-style-unhide: no;
	mso-style-locked: yes;
	mso-style-link: 批注文字;
	mso-ansi-font-size: 10.5pt;
	mso-bidi-font-size: 12.0pt;
	mso-font-kerning: 1.0pt;
}

span.Char2 {
	mso-style-name: "批注主题 Char";
	mso-style-unhide: no;
	mso-style-locked: yes;
	mso-style-parent: "批注文字 Char";
	mso-style-link: 批注主题;
	mso-ansi-font-size: 10.5pt;
	mso-bidi-font-size: 12.0pt;
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
	mso-list-id: 1;
	mso-list-type: simple;
	mso-list-template-ids: 1;
}

@
list l0:level1 {
	mso-level-suffix: none;
	mso-level-text: %1、;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 0cm;
	text-indent: 0cm;
}

@
list l1 {
	mso-list-id: 4;
	mso-list-type: simple;
	mso-list-template-ids: 4;
}

@
list l1:level1 {
	mso-level-start-at: 5;
	mso-level-number-format: chinese-counting;
	mso-level-suffix: space;
	mso-level-text: 第%1条;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 0cm;
	text-indent: 0cm;
}

@
list l2 {
	mso-list-id: 13;
	mso-list-type: simple;
	mso-list-template-ids: 13;
}

@
list l2:level1 {
	mso-level-suffix: none;
	mso-level-text: %1、;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 0cm;
	text-indent: 0cm;
}

@
list l3 {
	mso-list-id: 128937424;
	mso-list-type: hybrid;
	mso-list-template-ids: -572648632 477818440 67698713 67698715 67698703
		67698713 67698715 67698703 67698713 67698715;
}

@
list l3:level1 {
	mso-level-text: %1、;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 40.0pt;
	text-indent: -18.0pt;
}

@
list l4 {
	mso-list-id: 167982591;
	mso-list-template-ids: 167982591;
}

@
list l4:level1 {
	mso-level-number-format: decimal-enclosed-circle;
	mso-level-text: %1;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 18.0pt;
	text-indent: -18.0pt;
}

@
list l5 {
	mso-list-id: 445470900;
	mso-list-template-ids: 445470900;
}

@
list l5:level1 {
	mso-level-start-at: 3;
	mso-level-text: %1．;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 39.0pt;
	text-indent: -18.0pt;
}

@
list l6 {
	mso-list-id: 464548030;
	mso-list-template-ids: 464548030;
}

@
list l6:level1 {
	mso-level-number-format: decimal-enclosed-circle;
	mso-level-text: %1;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 18.0pt;
	text-indent: -18.0pt;
}

@
list l7 {
	mso-list-id: 508640575;
	mso-list-template-ids: 508640575;
}

@
list l7:level1 {
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 42.0pt;
	text-indent: -21.0pt;
}

@
list l8 {
	mso-list-id: 637882243;
	mso-list-template-ids: 637882243;
}

@
list l8:level1 {
	mso-level-number-format: chinese-counting-thousand;
	mso-level-text: 第%1条;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 21.0pt;
	text-indent: -21.0pt;
}

@
list l9 {
	mso-list-id: 684676621;
	mso-list-template-ids: 684676621;
}

@
list l9:level1 {
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 42.0pt;
	text-indent: -21.0pt;
}

@
list l10 {
	mso-list-id: 839274947;
	mso-list-template-ids: 839274947;
}

@
list l10:level1 {
	mso-level-number-format: decimal-enclosed-circle;
	mso-level-text: %1;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 21.55pt;
	text-indent: -18.0pt;
}

@
list l11 {
	mso-list-id: 954947735;
	mso-list-type: hybrid;
	mso-list-template-ids: -988242286 -183441196 67698713 67698715 67698703
		67698713 67698715 67698703 67698713 67698715;
}

@
list l11:level1 {
	mso-level-number-format: japanese-counting;
	mso-level-text: 第%1条、;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 29.2pt;
	text-indent: -54.0pt;
}

@
list l12 {
	mso-list-id: 1063868912;
	mso-list-template-ids: 994609570;
}

@
list l12:level1 {
	mso-level-text: %1、;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 42.0pt;
	text-indent: -21.0pt;
	tab-stops: 42.0pt;
	mso-ascii-font-family: 宋体;
	mso-fareast-font-family: 宋体;
	mso-hansi-font-family: 宋体;
	mso-bidi-font-family: "Times New Roman";
}

@
list l13 {
	mso-list-id: 1094477662;
	mso-list-template-ids: -597631718;
}

@
list l13:level1 {
	mso-level-text: %1、;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 35.2pt;
	text-indent: -21.0pt;
	tab-stops: 35.2pt;
	mso-ascii-font-family: 宋体;
	mso-fareast-font-family: 宋体;
	mso-hansi-font-family: 宋体;
	mso-bidi-font-family: "Times New Roman";
}

@
list l14 {
	mso-list-id: 1105688730;
	mso-list-type: hybrid;
	mso-list-template-ids: -1646338724 44103278 67698713 67698715 67698703
		67698713 67698715 67698703 67698713 67698715;
}

@
list l14:level1 {
	mso-level-text: %1、;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 39.0pt;
	text-indent: -18.0pt;
}

@
list l15 {
	mso-list-id: 1195540192;
	mso-list-type: hybrid;
	mso-list-template-ids: 1009651052 -1942204764 67698713 67698715 67698703
		67698713 67698715 67698703 67698713 67698715;
}

@
list l15:level1 {
	mso-level-start-at: 3;
	mso-level-text: %1、;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 39.0pt;
	text-indent: -18.0pt;
}

@
list l16 {
	mso-list-id: 1239512066;
	mso-list-template-ids: 1239512066;
}

@
list l16:level1 {
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 42.0pt;
	text-indent: -21.0pt;
}

@
list l17 {
	mso-list-id: 1296988902;
	mso-list-type: hybrid;
	mso-list-template-ids: -1538479726 -268679222 67698713 67698715 67698703
		67698713 67698715 67698703 67698713 67698715;
}

@
list l17:level1 {
	mso-level-text: %1、;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 20.0pt;
	text-indent: -36.0pt;
}

@
list l18 {
	mso-list-id: 1338114657;
	mso-list-template-ids: 1338114657;
}

@
list l18:level1 {
	mso-level-start-at: 5;
	mso-level-number-format: japanese-counting;
	mso-level-text: 第%1条;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 41.25pt;
	text-indent: -36.0pt;
}

@
list l19 {
	mso-list-id: 1353729253;
	mso-list-template-ids: 1353729253;
}

@
list l19:level1 {
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 42.0pt;
	text-indent: -21.0pt;
}

@
list l20 {
	mso-list-id: 1355964238;
	mso-list-template-ids: -550354908;
}

@
list l20:level1 {
	mso-level-text: %1、;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 42.0pt;
	text-indent: -21.0pt;
	tab-stops: 42.0pt;
	mso-ascii-font-family: 宋体;
	mso-fareast-font-family: 宋体;
	mso-hansi-font-family: 宋体;
	mso-bidi-font-family: "Times New Roman";
}

@
list l21 {
	mso-list-id: 1380780367;
	mso-list-type: hybrid;
	mso-list-template-ids: 1879601046 -1415524950 67698713 67698715 67698703
		67698713 67698715 67698703 67698713 67698715;
}

@
list l21:level1 {
	mso-level-text: %1、;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 39.0pt;
	text-indent: -18.0pt;
	font-family: "Times New Roman", "serif";
}

@
list l22 {
	mso-list-id: 1398095109;
	mso-list-type: hybrid;
	mso-list-template-ids: -1457778120 -1164677898 67698713 67698715
		67698703 67698713 67698715 67698703 67698713 67698715;
}

@
list l22:level1 {
	mso-level-text: %1、;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 39.0pt;
	text-indent: -18.0pt;
}

@
list l23 {
	mso-list-id: 1447503809;
	mso-list-type: hybrid;
	mso-list-template-ids: -1264054758 -650349488 67698713 67698715 67698703
		67698713 67698715 67698703 67698713 67698715;
}

@
list l23:level1 {
	mso-level-start-at: 3;
	mso-level-text: %1、;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 39.0pt;
	text-indent: -18.0pt;
}

@
list l24 {
	mso-list-id: 1525166560;
	mso-list-type: hybrid;
	mso-list-template-ids: -422396334 774522862 67698713 67698715 67698703
		67698713 67698715 67698703 67698713 67698715;
}

@
list l24:level1 {
	mso-level-number-format: japanese-counting;
	mso-level-text: 第%1条、;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 54.0pt;
	text-indent: -54.0pt;
}

@
list l25 {
	mso-list-id: 1712608445;
	mso-list-template-ids: 1712608445;
}

@
list l25:level1 {
	mso-level-number-format: decimal-enclosed-circle;
	mso-level-text: %1;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 18.0pt;
	text-indent: -18.0pt;
}

@
list l26 {
	mso-list-id: 1747607771;
	mso-list-template-ids: 1747607771;
}

@
list l26:level1 {
	mso-level-number-format: decimal-enclosed-circle;
	mso-level-text: %1;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 18.0pt;
	text-indent: -18.0pt;
}

@
list l27 {
	mso-list-id: 1829204148;
	mso-list-type: hybrid;
	mso-list-template-ids: -301687172 1888914342 67698713 67698715 67698703
		67698713 67698715 67698703 67698713 67698715;
}

@
list l27:level1 {
	mso-level-text: %1、;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 60.0pt;
	text-indent: -18.0pt;
}

@
list l28 {
	mso-list-id: 1897544042;
	mso-list-type: hybrid;
	mso-list-template-ids: 316710642 1269837272 67698713 67698715 67698703
		67698713 67698715 67698703 67698713 67698715;
}

@
list l28:level1 {
	mso-level-text: %1、;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: -6.8pt;
	text-indent: -18.0pt;
}

@
list l29 {
	mso-list-id: 1933931359;
	mso-list-type: hybrid;
	mso-list-template-ids: 746860824 -876459468 67698713 67698715 67698703
		67698713 67698715 67698703 67698713 67698715;
}

@
list l29:level1 {
	mso-level-text: %1、;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 39.0pt;
	text-indent: -18.0pt;
}

@
list l30 {
	mso-list-id: 1994487738;
	mso-list-template-ids: 1994487738;
}

@
list l30:level1 {
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 35.2pt;
	text-indent: -21.0pt;
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
		for (var i = 1; i < 7; i++) {
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
		/* var head = "<html><head><title></title></head><body>";
		var footstr = "</body></html>";
		var printData = document.getElementById("div_print").innerHTML;
		var oldstr = document.body.innerHTML;
		document.body.innerHTML = head + printData + footstr;
		window.print();

		document.body.innerHTML = oldstr; */

		//var imgArea = document.getElementById("imgArea");
		//imgArea.removeChild(imgArea.lastChild);

		return false;
	}
</script>
</head>
<div id="print_div">
<a class="download_a" href="${ctx}/contract/contractPrint/purchasePrintWord?id=${purchasingcontractbase.id}&printType=${printType}">下载打印</a>
<!-- <input name="b_print" type="button" id="iprint" onclick="printHtml()" value=" 打印 " /> --> 
<input name="iback" type="button" id="iback" onclick="back()" value=" 返回 " />
</div>

<div id="div_print">

	<body lang=ZH-CN
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

			<!-- <p class=MsoNormalCxSpMiddle align=center
				style='text-align: center; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><input type="text" class="input_home" disable="true" value="J"/></b>
			</p> -->
			<p class=MsoNormalCxSpMiddle align=center
				style='text-align: center; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal'><span
					style='font-size: 28.0pt; mso-bidi-font-size: 26.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'>${purchasingcontractbase.contractJiafang}<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=center
				style='text-align: center; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b><span
					style='font-size: 26.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"'>采购基本合同</span></b><b
					style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 24.0pt; mso-bidi-font-size: 22.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p></o:p></span></b>
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

			<p class=MsoNormal
				style='text-indent: 99.0pt; mso-char-indent-count: 5.5; mso-layout-grid-align: none; text-autospace: none'>
				<b style='margin-left:100px;mso-bidi-font-weight: normal'><span
					style='font-size: 18.0pt; mso-bidi-font-size: 16.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'>甲<span
						lang=EN-US><span style='mso-spacerun: yes'>&nbsp; </span></span>方：
				</span></b><b style='mso-bidi-font-weight: normal'><u><input type="text" class="input_home" disable="true" value="${purchasingcontractbase.contractJiafang}"/></u></b><span lang=EN-US
					style='font-size: 14.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
			</p>
			
	<!-- 		<p class=MsoNormalCxSpMiddle align=left
				style='text-align: left; text-indent: 99.0pt; mso-char-indent-count: 5.5; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b style='margin-left:100px;mso-bidi-font-weight: normal'><span
					style='font-size: 18.0pt; mso-bidi-font-size: 16.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'>甲<span
						lang=EN-US><span style='mso-spacerun: yes'>&nbsp; </span></span>方：
				</span></b><b style='mso-bidi-font-weight: normal'><input type="text" class="input_home" disable="true" value="J"/></b><b
					style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 18.0pt; mso-bidi-font-size: 16.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p></o:p></span></b>
			</p> -->

			<p class=MsoNormal
				style='text-indent: 99.0pt; mso-char-indent-count: 5.5; mso-layout-grid-align: none; text-autospace: none'>
				<b style='margin-left:100px;mso-bidi-font-weight: normal'><span
					style='font-size: 18.0pt; mso-bidi-font-size: 16.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'>乙<span
						lang=EN-US><span style='mso-spacerun: yes'>&nbsp; </span></span>方：
				</span></b><b style='mso-bidi-font-weight: normal'><input type="text" class="input_home" disable="true" value="${purchasingcontractbase.partyBName}"/></b><span
					lang=EN-US
					style='font-size: 14.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
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
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; mso-bidi-font-size: 20.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal align=center
				style='text-align: center; line-height: 150%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b><span
					style='font-size: 22.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'>采购基本合同</span></b><b
					style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 22.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
			</p>

			<p class=MsoNormal
				style='text-indent: 23.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>本合同是旨在为甲、乙双方确立并维护相互之间长期稳定的合作关系、明确双方在合作过程中应尽的义务、减少合作过程中的争议、防止各种不正当行为的发生而订立的基本买卖合同，具体的合同标的、数量、交付日期等交易内容双方将通过附件或采购订单的方式确定。本合同的签订及生效，是乙方成为甲方合格供应商的必要条件之一。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 23.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>甲、乙双方经协商一致后，可对采购合同进行更新或修订。新的采购合同经双方正式签订生效后，原采购合同的效力正式终止。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 23.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>甲、乙双方确认经过平等协商、相互商讨，双方共同拟订了本采购基本合同。甲、乙双方均认为本采购基本合同是双方共同的真实意思表现，对合同条款已充分理解并完全同意。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 23.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal align=center
				style='text-align: center; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'>合同正文<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>1.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【证照资质】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>在签订本合同及其他协议前，乙方应按甲方规定提供下列书面及电子档有效文件：<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>1.1</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>乙方基本信息表。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>1.2</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>营业执照、税务登记证、组织机构代码证、开户许可证及其他资质证明复印件。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>上述文件记载的信息发生变化时，乙方应及时将记载变化的信息书面提供给甲方。</span><b
					style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>2.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【管理职责】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>甲方内部各部门与乙方相关的管理职责：<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>2.1</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>甲方<b
					style='mso-bidi-font-weight: normal'>合约部</b>是乙方与甲方商务谈判、签订采购合作协议的接口部门，负责乙方物料价格谈判、签订合同业务。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>2.2</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>甲方<b
					style='mso-bidi-font-weight: normal'>采购中心采购组</b>是乙方与甲方的业务接口部门，负责甲方采购业务，下达采购订单，跟催物料、财务结算和合同的最终执行及反馈，同时负责呆滞物料处理和消耗。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>2.3</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>甲方<b
					style='mso-bidi-font-weight: normal'>采购中心供应商管理组</b>是甲方与乙方的业务监督考核管理归口部门，负责供应商的监督考核管理。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>2.4</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>甲方<b
					style='mso-bidi-font-weight: normal'>技术部门</b>（如：<b
					style='mso-bidi-font-weight: normal'>设计中心</b>）可与乙方进行职能范围之内的技术交流和技术支持活动。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>2.5</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>甲方其他部门可根据业务需要，在必要时与乙方开展职责范围之内的业务活动。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>3.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【采购订单】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>采购订单是甲方向乙方提出交货要约的正式书面文件，乙方根据采购订单所载的产品（或称“货物”）品名、规格型号、数量、交货期限、交货地点等内容履行交付义务。采购订单原件除直接送达乙方外，甲方也可以通过电子邮件方式将采购订单送达乙方。乙方收到甲方采购订单后应在一个工作日内书面回复确认，逾期未确认的视为接受该采购订单。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>3.1</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; color: black'>甲方指定发送和接收相关信息的邮箱为：<input type="text" class="input_mail"></span><u><span
					lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></u>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>3.2</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; color: black'>乙方指定发送和接收订单及相关信息的邮箱为：<input type="text" class="input_mail"><u><span
						lang=EN-US><o:p></o:p></span></u></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>3.3</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>乙方指定接收订单人员为：<input type="text" class="input_mail"><u><span
						lang=EN-US><o:p></o:p></span></u></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>3.4</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>若甲方存放的订单与乙方存放的有不一致之处，乙方无条件同意以甲方存放的订单为准。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1'>4.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1'>【<span
						lang=EN-US>ERP</span>系统】
				</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>通过</span><span
					lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1'>ERP</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1'>系统，甲乙双方将能够更加</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>准确和及时的进行信息的传递，</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1'>甲方将给予乙方甲方<span
					lang=EN-US>ERP</span>系统的使用权限（账号和密码），乙方应确保该使用权限仅为完成本合同业务及由完成本合同业务的相关授权人员使用，并对通过<span
					lang=EN-US>ERP</span>系统所获悉的所有与甲方业务相关的信息进行保密，除完成业务外不作其他用途。乙方取得<span
					lang=EN-US>ERP</span>使用权限后应立即修改密码，乙方承诺对以乙方账号（用户名）在<span lang=EN-US>ERP</span>系统内的所有操作承担相应法律责任。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1'>4.1</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1'>在乙方开通<span
					lang=EN-US>ERP</span>系统账号后，甲方可通过<span lang=EN-US>ERP</span>系统向乙方发出采购订单、
				</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>送货计划等，乙方应及时确认和处理。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>4.2</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>应由</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1'>乙方负责录入数据和上传的相关附件，乙方必须确保准确和完整，如有错误、遗漏，所造成的责任由乙方负责。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>5.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>【价格】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>甲方根据双方《价格表》中确认的价格向乙方结算并支付产品货款；除非双方另有书面约定，否则甲方无须支付任何《价格表》约定价款以外的款项。《价格表》包含“产品名称、规则、单位、价格及具体材料要求等”，结算货币单位为人民币元。<b
					style='mso-bidi-font-weight: normal'><span lang=EN-US><o:p></o:p></span></b></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>5.1</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>乙方保证向甲方提供的产品报价具有竞争优势，不高于同期乙方向任何第三方所提供的产品报价及合法竞争情况下所确定的产品市场最低价。如乙方自行降价或向第三方提供更优惠的价格，甲方应同时享有降价优惠或更优惠的价格。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>5.2</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>甲方为保持采购成本的竞争力，对部分产品的采购采取公开竞价方式，明确合作的产品名称、规格等。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>6.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【包装】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>乙方的产品必须按照法律规及相关国家标准的规定进行包装，确保产品完好、储运安全，且便于识别。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>6.1</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>产品应捆扎稳妥，以保证在运输中产品不受磨擦损伤。对没有进行适当保护或受损的商品，甲方有权不予接受。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>6.2</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>具体《产品包装要求》详见本合同附件。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>7.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【物流】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>双方均应避免野蛮、危险操作，应采取合适的装卸、运输方式，确保产品能准时、完好地送达甲方指定地点。<b
					style='mso-bidi-font-weight: normal'><span lang=EN-US><o:p></o:p></span></b></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>7.1</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>装车费用由<u>乙</u>方承担，卸车费用由<u>乙</u>方承担。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>7.2</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>长途</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>运输费用由</span><b
					style='mso-bidi-font-weight: normal'><input type="text" class="input_text" disable="true" value="${purchasingcontractbase.isIncludeCarriage eq '1'?'乙方':'甲方'}"/></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>方承担。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>7.3</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>其他：</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>乙方工厂到装车地点之间的</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>运输费用由<u>乙</u>方承担
				</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>。</span><b
					style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>8.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【数量准确】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>乙方保证交付的产品数量与甲方采购订单所要求的数量相符合，不存在短装或多交情形。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>9.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【质量保证】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>乙方保证所提供的产品满足国家、行业或双方企业的质量标准，并以要求高者为准<b
					style='mso-bidi-font-weight: normal'>。</b>具体详见本合同附件《材料标准及验收标准》。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>9.1</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>乙方交付的产品不符合质量要求的，甲方有权退回乙方，乙方应按甲方要求的时间补齐合格产品，因此增加的运输费用以及其他成本由乙方承担，若因此未能在交付期限内提供合格产品，乙方应按照约定承担延迟履行责任。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>9.2</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>乙方不符合质量要求交货的产品，若可以折价使用的，双方协商确定，但不免除乙方的质量责任及延迟履行责任。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>10.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【权利保证】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>乙方承诺产品在交付甲方之前，乙方对该产品具有完全的所有权，未设置抵押或任何第三方可主张的权利，也不存在被司法机关或行政机关执行强制程序的可能。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>11.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【交付】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>乙方收到甲方下达的正式采购订单并确认接受后，应按照甲方指定的交付日期准时完好地将产品送达指定地点。乙方违反采购订单要求的，按照约定承担延迟履行责任。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>12.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【交付期限】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>乙方必须按照甲方书面指示的交付日期交付产品，不得延迟。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>12.1</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>乙方确需延迟交货的，在确认订单时应事先说明，并得到甲方的确认，由甲方修改交货时间。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>12.2</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>甲方有权变更交货时间或交货地点，具体以甲方通知为准。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>12.3</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>因甲方原因造成的产品不能按时发货，交货期限顺延。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>13.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【交付地点】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>乙方必须按照甲方采购订单要求，将产品送达指定交付地点。如乙方交付产品的地点与甲方采购订单所指示的交付地点不一致，乙方必须在交付期限内将产品转送至采购订单指定地点，因交付地点错误造成交付延迟的，乙方须按照约定承担相关违约责任。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>14.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【验收】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>乙方产品送达甲方指定地点后由甲方检查接收，自产品被甲方验收合格接受之时起乙方的交付义务正式完成。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>14.1</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>鉴于本行业的交易习惯及交易方便的需要，甲方在接收产品时只能抽查检验。因此，乙方应当恪守诚实信用原则，保证所交付的产品数量、质量符合甲方要求和双方约定，不存在短装现象或质量问题。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>14.2</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>甲方接收产品，并不免除乙方的交付保证责任；产品接收后甲方发现数量不准确或质量不符合标准的，甲方仍有权依据本合同的约定要求乙方退换货，并承担违约责任。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>14.3</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>在收到甲方通知后，乙方未能在十内日将不合格产品运离，视为乙方抛弃该些产品，凭甲方处置。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>14.4</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>《材料标准及验收标准》详见本合同附件。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>15.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【支付条款】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>甲方应按照双方约定的付款方式向乙方按时支付货款，不得无故延迟付款。付款前乙方应按照约定方式准时向甲方提交正规有效的</span><b
					style='mso-bidi-font-weight: normal'>					
					<select>
						   <option class="selectIn" ${purchasingcontractbase.invoiceType eq '增值税专用发票'?'selected="selected"':'' } >增值税专用</option>
						   <option class="selectIn" ${purchasingcontractbase.invoiceType eq '货物运输业增值税专用发票'?'selected="selected"':'' } >货物运输业增值税专用</option>
						   <option class="selectIn" ${purchasingcontractbase.invoiceType eq '普通发票'?'selected="selected"':'' } >普通</option>
						   <option class="selectIn" ${purchasingcontractbase.invoiceType eq '建安发票'?'selected="selected"':'' } >建安</option>
						   <option class="selectIn" ${purchasingcontractbase.invoiceType eq '不可开票'?'selected="selected"':'' } >不可开票</option>
					</select>
					
					</b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>发票（</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>税率</span><b
					style='mso-bidi-font-weight: normal'>					
					<select >
						   <option class="selectIn"  ${purchasingcontractbase.taxRate eq '17%'?'selected="selected"':'' } >17%</option>
						   <option class="selectIn"  ${purchasingcontractbase.taxRate eq '13%'?'selected="selected"':'' } >13%</option>
						   <option class="selectIn"  ${purchasingcontractbase.taxRate eq '11%'?'selected="selected"':'' } >11%</option>
						   <option class="selectIn"  ${purchasingcontractbase.taxRate eq '6%'?'selected="selected"':'' } >6%</option>
						   <option class="selectIn"  ${purchasingcontractbase.taxRate eq '3%'?'selected="selected"':'' } >3%</option>
						   <option class="selectIn"  ${purchasingcontractbase.taxRate eq '0%'?'selected="selected"':'' } >0%</option>
					  </select></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>）、付款凭证等进行对账、结算、请款，否则甲方有权延期付款，直至乙方提交为止；因此导致甲方付款延迟的，甲方无须承担延迟付款责任。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>15.1</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>结算方式：月结</span><b
					style='mso-bidi-font-weight: normal'>
					  <select >
						   <option class="selectIn" >60天</option>
						   <option class="selectIn" ${purchasingcontractbase.settlementType eq '月结'?'selected="selected"':'' } >30天</option>
						   <option class="selectIn" ${purchasingcontractbase.settlementType eq '零星付款'?'selected="selected"':'' }>零星付款</option>
						   <option class="selectIn" ${purchasingcontractbase.settlementType eq '按进度付款'?'selected="selected"':'' }>按进度付款</option>
					  </select>
					</b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>。即按月结算货款，满“<span
					lang=EN-US>X</span>”天以约定方式付款。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>15.2</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>支付方式：</span>
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
					<b style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体;'>银行承兑</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>汇票</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>（期限为<span
					lang=EN-US>6</span>个月）。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>16.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【抵消】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>甲方对乙方所负的债务到期时，如同时对乙方享有未履行的债权，不论该债权是否到期、与甲方所负债务性质是否相同，甲方均可在书面通知乙方后直接进行抵消。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>17.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【信息资料】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>乙方保证提供给甲方的信息或资料（包括但不限于企业登记注册资料、税务资料、银行账户资料、人员联系方式等）真实、准确、有效；信息如有变更，乙方应在四十八小时内通知甲方，否则视为提供虚假信息。如甲方要求，乙方应提供与产品有关的检测报告、质量证明或第三方机构的认证。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>18.<span
						style='color: black; mso-themecolor: text1'> </span></span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>【</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-themecolor: text1'>保证金</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-themecolor: text1'>】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>本合同生效后<span
					lang=EN-US>1</span>个月内，乙方
				</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>向甲方缴纳履约保证金</span><b
					style='mso-bidi-font-weight: normal'><input type="text" class="input_text" disable="true" value="${purchasingcontractbase.qualityGuaranteePrice}"/></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>万元，待合同期满或合法解除，乙方无其他未履行的义务后，甲方在<span
					lang=EN-US>5</span>天内无息退还。若乙方一个月内未缴纳履约保证金的，则视为授权甲方直接在应付乙方的货款中扣除。
				</span><b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>19.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【保密责任】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>乙方对合作过程中所知悉的甲方的全部信息（包括技术信息和经营信息等）负有保密义务，应采取妥善措施，防止保密信息外露。未经甲方事前书面同意或为履行本合同义务之需要，乙方不得使用、披露甲方的商业秘密。乙方违反前述约定的，应当赔偿由此给甲方造成的全部损失。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>20.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【廉洁责任】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>在业务往来过程中，甲乙双方应当自觉遵守商业道德和诚信廉洁原则，遵循正当合法的商业行为规范，开展正常的业务交往。乙方不得给予或者承诺给予甲方员工及其关系人任何形式的贿赂或其他不正当利益（低价值的文具类纪念品除外）。前述“甲方员工”包括但不限于合约、采购、设计、财务等部门人员，前述“关系人”包括配偶、直系血亲或其他关系密切之亲属或朋友。乙方的廉洁承诺及保证详见《合作方反贿赂<span
					lang=EN-US>/</span>反腐败承诺书》。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>21.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【留置】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>乙方承诺在任何情况下均不得扣押或留置甲方交付乙方的资产财物，发生争议应以本合同约定的方式和途径予以解决。双方合作结束时，如甲方尚有未到期的货款没有支付，乙方不得因此扣押留置甲方资产财物。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>22.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【违约责任】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>甲乙双方应按照合同约定履行各自的义务，如有违反，将按照以下约定承担违约责任：<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>22.1</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>虚假信息：乙方提供的信息存在重大虚假、错误、无效情况的，甲方有权随时解除本合同，并视影响大小要求乙方支付人民币一万元至五万元的违约金；因提供虚假、错误、无效的信息或资料给甲方造成实际损失的，乙方应另行赔偿甲方的实际损失。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>22.2</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>乙方未按【价格】条款约定向甲方提供最优惠价格或价格保护的，甲方有权要求乙方退还差额部分，并按所涉及的交易总金额的<span
					lang=EN-US>10%</span>向甲方支付违约金。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>22.3</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>乙方违反【保密责任】条款约定的，须赔偿甲方违约金人民币十万元，该违约金不足以弥补甲方损失的，则乙方应按照实际损失给予赔偿。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>22.4</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>乙方违反【廉洁责任】条款约定的，一经发现，无论甲方有无实际损失发生，甲方均有权直接免除乙方合格供应商资格，同时要求乙方支付人民币五十万元作为违约金；如违约金不足以弥补甲方因此产生的实际损失<span
					lang=EN-US>, </span>则乙方实际应承担的违约责任以甲方实际损失的<span lang=EN-US>300%</span>为准。前述违约金甲方均有权从未付给乙方的货款中直接予以扣除，如未付货款不足抵扣，甲方有权要求乙方另行支付。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>22.5</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>乙方违反【留置】条款约定扣押或留置甲方财物的，甲方有权要求乙方退还所扣押或留置的财物，并从未付货款中扣除违约金人民币一万元。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>22.6</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>乙方延迟交货的，每逾期交货一天，应向甲方支付<span
					lang=EN-US>200</span>元或当次采购订单产品货值总额<span lang=EN-US>0.5%</span>的违约金，以较高者为准。造成甲方停工、窝工的，则乙方应按照甲方实际损失给予赔偿。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>22.7</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>严重违约：乙方交付的产品存在质量问题导致甲方损失或者对第三方违约，致使甲方被客户取消合作资格、或被客户取消订单或索赔超过人民币一万元、或对甲方企业公众形象造成恶劣影响的，视为严重违约，甲方有权解除合同并取消乙方合格供应商资格，乙方应按照双方上一年度内交易总额的<span
					lang=EN-US>10%</span>，或人民币二十万元给予赔偿，以较高者为准；如仍不能弥补甲方损失，则以甲方实际损失为赔偿标准。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>22.8</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>任一方未按约定程序解除合同的，按严重违约处理，承担相应赔偿责任。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>23.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【赔偿方式】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>乙方依本合同承担的所有违约赔偿责任，甲方可直接从乙方</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>保证金或</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>应支付给乙方的货款中扣除（不限于该批货款），</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>保证金或</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>货款不足以抵扣的，乙方应在十五天内另行补足，限期内不予补足又不向甲方请求协商合理赔偿方案的，将从期限结束之日起，以未偿付的金额为本金，按照同期银行活期存款利息的<span
					lang=EN-US>2 </span>倍计算并收取滞纳金。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>24.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【不可抗力】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>任何一方受到不可抗力事件的影响而延迟或无履行合同义务的，可以减轻或免除违约责任。受不可抗力影响一方应在出现不可抗力之时起<span
					lang=EN-US>24 </span>小时内通知对方，并在不可抗力排除后七个工作日内提供不可抗力事件发生地的政府机构或公证机关出具的证明材料，否则视为未发生不可抗力。违约方迟延履行合同义务后发生的不可抗力事件不能免除其违约责任。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>25.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【争议解决方式】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>甲乙双方因本合同所发生的任何争议，应秉承友好合作的精神协商解决；协商无达成一致的，任何一方均可向合同签订地人民法院提起诉讼。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>26.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【合同效力】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>本合同一式肆份，甲方执三份，乙方执一份，具有同等律效力。自甲乙双方签字并盖章之日起生效。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>26.1</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>本合同生效前甲乙双方的约定与本合同不一致的，以本合同约定内容为准。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>26.2</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>甲乙双方可以通过书面协议方式对本合同进行修改和补充。经双方正式签署生效的修改条款和补充协议是本合同的组成部分，除非另有约定，否则与本合同具有同等效力。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>27.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【合同期限】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>本合同有效期为：</span><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'>自生效之日起至</span></b><b
					style='mso-bidi-font-weight: normal'><input type="text" class="input_date" disable="true" value="${purchasingcontractbase.endTime}"/></b><b style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; '>止。</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>如任何一方未于期限届满前三十天以书面方式通知另一方不再续签，则本合同自动延长一年，嗣后亦同。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>28.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【合同解除】</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>本合同生效期间内，未经双方协商同意达成一致书面意见，任何一方均不得随意解除合同；如任何一方因发展需要确须解除本合同，必须提前至少<span
					lang=EN-US>30</span>天书面通知另一方，双方就债权债务清理等善后事宜达成书面一致意见后，方可解除本合同。<b
					style='mso-bidi-font-weight: normal'><span lang=EN-US><o:p></o:p></span></b></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>29.</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【其他】<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>29.1</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>本合同中的标题仅作为参考，不影响本合同具体条款内容的含义及其解释。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>29.2</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>本合同终止或解除后，甲乙双方尚有未履行完毕的合同义务的（如尚有采购订单未交货或付款完毕），本合同相关条款的效力延长至合同义务履行完毕之日为止。但有关保密责任、商业廉洁、违约责任及纠纷解决方式等条款长期有效，不因本合同的终止或解除而失效。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>30<span
						style='mso-bidi-font-weight: bold'>.</span></span></b><b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>合同签订地</span></b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>】本合同于</span><u><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>佛山市顺德区<span
						lang=EN-US><span style='mso-spacerun: yes'>&nbsp;&nbsp;
						</span></span></span></u><span style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>签订。<b
					style='mso-bidi-font-weight: normal'><span lang=EN-US><o:p></o:p></span></b></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>31.</span></b><b><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>【本合同附件】</span></b><b
					style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>31.1</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>《价格表》<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>31.2</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>《合作方反贿赂<span
					lang=EN-US>/</span>反腐败承诺书》<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly; tab-stops: 99.0pt; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly; tab-stops: 99.0pt; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly; tab-stops: 99.0pt; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly; tab-stops: 99.0pt; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲方（名称及盖章）：<span
					lang=EN-US><span style='mso-spacerun: yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span>乙方（名称及盖章）： <span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly; tab-stops: 99.0pt; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 19.0pt; mso-line-height-rule: exactly; tab-stops: 99.0pt; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>授权代表人：<span
					lang=EN-US><span style='mso-spacerun: yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span>授权代表人：<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly; tab-stops: 99.0pt; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
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
				style='line-height: 20.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 150%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b><span
					style='font-size: 12.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'>《采购基本合同》附件：</span></b><span
					lang=EN-US
					style='font-size: 12.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
			</p>

			<p class=MsoNormal align=center
				style='text-align: center; line-height: 150%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span
					style='font-size: 14.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'>合作方反贿赂<span
						lang=EN-US>/</span>反腐败承诺书<span lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>致：</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>有限公司<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>承诺方作为受诺方的长期合作商，本着诚实信用、公平竞争、不损害双方及任何第三方利益的原则，依据国家相关法律的规定，经与受诺方协商一致，做出如下承诺：<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>1</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>、承诺方将严格按照国家法律和有关法规、规章，进行正当商业往来。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>2</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>、不以任何名义、理由借钱、借物给受诺方员工。否则，因该行为产生的一切后果由承诺方自行承担，与受诺方无关。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>3</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>、在双方合作过程中，不以任何名义给予受诺方员工回扣、提成等行为，或为其报销应由其个人支付的费用，不采取不正当手段获利。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>4</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>、不以任何名义、理由向受诺方员工馈赠礼物、现金、有价证券（卡）及安排宴请、娱乐消费、配偶子女工作以及旅游等活动。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>5</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>、不用黄、赌、贿等各种手段拉拢腐蚀甲方工作人员。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>6</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>、不违反国家有关维护农民工利益的各项法规和政策规定。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>7</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>、不接受受诺方员工以个人或亲朋好友名义提出的兼职、顾问、中介等有偿服务，若受诺方员工利用职务便利，在双方合作过程中提出该等要求，承诺方有责任立即反馈投诉至受诺方。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>8</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>、不接受受诺方员工以个人或亲朋好友名义提出的入股、联营等可能形成与受诺方业务相竞争或损害受诺方利益的合作。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>9</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>、若受诺方员工利用职务便利，在双方合作过程中有故意刁难或任何不公正行为，甚至以直接或暗示方式向承诺方索取回扣、物品，承诺方有责任立即反馈投诉至受诺方，投诉电话：</span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>18988676405</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>，</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>邮箱：</span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>jc@wangfanggroup.com</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>。</span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>如承诺方及代理人违背本承诺书所涉及条款，受诺方有权单方终止与我方的业务，取消我方的合作资格，同时有权要求我方支付</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>不超过<span
					lang=EN-US>50</span>万人民币的违约金
				</span><span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>，并由我方承担由此造成的全部损失（包括但不限于直接或间接损失、诉讼费用、律师费等）。对触犯刑法的，我方将配合进行司法程序。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>只要存在上述行为，受诺方</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>无须提供证据证明</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>承诺方</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>违反诚实惯例</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>，该行为</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>即被视为不正当竞争</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>本承诺经承诺方盖章或签名后生效，在双方任何合作、交易期间内均有效。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 82.5pt; mso-char-indent-count: 7.5; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>承诺单位（盖章）<span
					lang=EN-US>/</span>承诺人（签名及身份证号码）：<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 82.5pt; mso-char-indent-count: 7.5; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 319.0pt; mso-char-indent-count: 29.0; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>年<span
					lang=EN-US><span style='mso-spacerun: yes'>&nbsp;&nbsp;
					</span></span>月<span lang=EN-US><span style='mso-spacerun: yes'>&nbsp;&nbsp;
					</span></span>日<span lang=EN-US><o:p></o:p></span></span>
			</p>

		</div>

	</body>
</div>
</html>
