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
	font-family: Batang;
	panose-1: 2 3 6 0 0 1 1 1 1 1;
	mso-font-alt: \BC14\D0D5;
	mso-font-charset: 129;
	mso-generic-font-family: auto;
	mso-font-format: other;
	mso-font-pitch: fixed;
	mso-font-signature: 1 151388160 16 0 524288 0;
}

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

@font-face {
	font-family: "\@Batang";
	panose-1: 2 3 6 0 0 1 1 1 1 1;
	mso-font-charset: 129;
	mso-generic-font-family: roman;
	mso-font-pitch: variable;
	mso-font-signature: -1342176593 1775729915 48 0 524447 0;
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
		for (var i = 1; i < 11; i++) {
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
			/* var res= data.result;
			alertx("调用打印成功！"); */
		});
		/* var head = "<html><head><title></title></head><body>";
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
	<!-- <a name="b_print" type="button" id="iprint" onclick="printHtml()"
		value=" 打印 " >

	<input name="b_print" type="button" id="iprint" onclick="printHtml()"
		value=" 打印 " /> --> <input name="iback" type="button" id="iback"
		onclick="back()" value=" 返回 " />
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
				<b style='mso-bidi-font-weight: normal'><span
					style='font-size: 28.0pt; mso-bidi-font-size: 26.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'>广东万方建设有限公司<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormalCxSpMiddle align=center
				style='text-align: center; line-height: 115%; tab-stops: 333.15pt; mso-layout-grid-align: none; text-autospace: none'>
				<b><span
					style='font-size: 26.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"'>采购基本合同</span></b><b
					style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 24.0pt; mso-bidi-font-size: 22.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'><o:p></o:p></span></b>
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
				<b style='margin-left: 100px; mso-bidi-font-weight: normal'><span
					style='font-size: 16.0pt; mso-bidi-font-size: 14.0pt; line-height: 115%; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'>合同编号：</span></b><a
					name="_GoBack"><b style='mso-bidi-font-weight: normal;'><u><input type="text" class="input_home" disable="true" value="${purchasingcontractbase.contractNo}"/></u></b></a><span
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
				</span></b><b style='mso-bidi-font-weight: normal'><u><input type="text" class="input_home" disable="true" value="广东万方建设有限公司"/></u></b><span lang=EN-US
					style='font-size: 14.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
			</p>
			<p class=MsoNormal
				style='text-indent: 99.0pt; mso-char-indent-count: 5.5; mso-layout-grid-align: none; text-autospace: none'>
				<b style='mso-bidi-font-weight: normal; margin-left: 100px;'><span
					style='font-size: 18.0pt; mso-bidi-font-size: 16.0pt; font-family: "微软雅黑", "sans-serif"; color: black; mso-font-kerning: 0pt'>乙<span
						lang=EN-US><span style='mso-spacerun: yes'>&nbsp; </span></span>方：
				</span></b><b style='mso-bidi-font-weight: normal'><u>
							<input type="text" class="input_home" disable="true" value="${purchasingcontractbase.partyBName}"/>
					</u></b><b
					style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 14.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
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
					style='mso-bidi-font-weight: normal'>
					<input type="text" class="input_text" disable="true" value="${purchasingcontractbase.isIncludeCarriage eq '1'?'乙方':'甲方'}"/>
						</b><span
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
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>税率</span><b style='mso-bidi-font-weight: normal'>
					
					<select >
						   <option class="selectIn"  ${purchasingcontractbase.taxRate eq '17%'?'selected="selected"':'' } >17%</option>
						   <option class="selectIn"  ${purchasingcontractbase.taxRate eq '13%'?'selected="selected"':'' } >13%</option>
						   <option class="selectIn"  ${purchasingcontractbase.taxRate eq '11%'?'selected="selected"':'' } >11%</option>
						   <option class="selectIn"  ${purchasingcontractbase.taxRate eq '6%'?'selected="selected"':'' } >6%</option>
						   <option class="selectIn"  ${purchasingcontractbase.taxRate eq '3%'?'selected="selected"':'' } >3%</option>
						   <option class="selectIn"  ${purchasingcontractbase.taxRate eq '0%'?'selected="selected"':'' } >0%</option>
					  </select>
					</b>
					<span style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>）、付款凭证等进行对账、结算、请款，否则甲方有权延期付款，直至乙方提交为止；因此导致甲方付款延迟的，甲方无须承担延迟付款责任。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>15.1</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>结算方式：月结</span><b
					style='mso-bidi-font-weight: normal'>
					  <select >
						   <option class="selectIn">60天</option>
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
					
					<b style='mso-bidi-font-weight: normal'>
					<span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体;'>银行承兑</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体;mso-font-kerning: 0pt'>汇票</span></b><span
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
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>。如任何一方未于期限届满前三十天以书面方式通知另一方不再续签，则本合同自动延长一年，嗣后亦同。<span
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
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>《产品包装要求》<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>31.3</span><span
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>《材料标准及验收标准》<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 20.0pt; mso-line-height-rule: exactly; layout-grid-mode: char; mso-layout-grid-align: none'>
				<span lang=EN-US
					style='font-size: 11.5pt; font-family: "微软雅黑", "sans-serif"'>31.4</span><span
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
				style='line-height: 150%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b><span
					style='font-size: 12.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'>《采购基本合同》附件：</span></b><span
					lang=EN-US
					style='font-size: 12.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
			</p>

			<p class=MsoNormal align=center
				style='text-align: center; line-height: 150%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span
					style='font-size: 16.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'>产品包装要求<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
				width=690
				style='border-collapse: collapse; mso-table-layout-alt: fixed; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>
				<tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
					<td width=47
						style='width: 35.45pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt'>
							<b><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>材料<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt'>
							<b><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>类别</span></b><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=132
						style='width: 99.25pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt'>
							<b><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>材料名称</span></b><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=378
						style='width: 10.0cm; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt'>
							<b><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>包装标准</span></b><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=132
						style='width: 99.25pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt'>
							<b><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>随货资料<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt'>
							<b><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>标准</span></b><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 1'>
					<td width=47 rowspan=4
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; layout-flow: vertical-ideographic'>
						<p class=MsoNormal align=center
							style='margin-top: 0cm; margin-right: 5.65pt; margin-bottom: 0cm; margin-left: 5.65pt; margin-bottom: .0001pt; text-align: center; mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>常规后埋件</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=132
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>后埋板<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>（<span
								lang=EN-US>200*180*8mm</span>）
							</span><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=378
						style='width: 10.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>大板：用地台板包装，地台板规格为：<span
								lang=EN-US>0.87</span>米<span lang=EN-US>*0.6</span>米；每层放<span
								lang=EN-US>15</span>块埋板<span lang=EN-US>(3*5),</span>每板放<span
								lang=EN-US>30</span>层<span lang=EN-US>,</span>共<span lang=EN-US>450</span>块<span
								lang=EN-US>,</span>约<span lang=EN-US>878</span>公斤，用不脱色笔在每板上标注序号、规格及件数。
							</span><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=132 rowspan=4
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>1</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>、材料质保书；<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>2</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>、检测报告；<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>3</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>、镀锌质保书；<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>4</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>、送货单。</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 2'>
					<td width=132
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>后埋板<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>（<span
								lang=EN-US>200*100*8mm</span>）
							</span><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=378
						style='width: 10.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>小板：用地台板包装，地台板规格为：<span
								lang=EN-US>0.87</span>米<span lang=EN-US>*0.6</span>米；每层放<span
								lang=EN-US>24</span>块<span lang=EN-US>(3*8),</span>每板放<span
								lang=EN-US>30</span>层<span lang=EN-US>,</span>共<span lang=EN-US>720</span>块<span
								lang=EN-US>,</span>约<span lang=EN-US>828</span>公斤，用不脱色笔在每板上标注序号、规格及件数
							</span><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 3'>
					<td width=132
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>垫片<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>（<span
								lang=EN-US>40*40*3mm</span>）
							</span><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=378
						style='width: 10.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>垫片：用铁丝按每<span
								lang=EN-US>200</span>个一串，再用全新塑料胶袋每<span lang=EN-US>4</span>串放一袋，用不脱色笔在每袋上标注序号、规格及个数。
							</span><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 4'>
					<td width=132
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>角码<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>（<span
								lang=EN-US>150*50*4mm</span>）
							</span><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=378
						style='width: 10.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>角码：用铁丝按每<span
								lang=EN-US>20</span>块一串，再用全新塑料胶袋每<span lang=EN-US>3</span>串放一袋，用不脱色笔在每袋上标注序号、规格及个数。
							</span><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 5'>
					<td width=47 rowspan=2
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; layout-flow: vertical-ideographic'>
						<p class=MsoNormal align=center
							style='margin-top: 0cm; margin-right: 5.65pt; margin-bottom: 0cm; margin-left: 5.65pt; margin-bottom: .0001pt; text-align: center; mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>螺丝类</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=132
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>化学锚</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=378
						style='width: 10.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>将弹垫、平垫、螺母放在同一个箱（每箱<span
								lang=EN-US>1200</span>套，其中<span lang=EN-US>300</span>个<span
								lang=EN-US>/</span>包，共<span lang=EN-US>12</span>包），螺杆放一箱（共<span
								lang=EN-US>300</span>支），胶管放一箱（每箱<span lang=EN-US>1000</span>支，其中<span
								lang=EN-US>20</span>支<span lang=EN-US>/</span>盒，共<span
								lang=EN-US>50</span>盒），分三类用纸箱包装，用不脱色笔在每箱上标注序号、规格及件数，送货资料存放在序号<span
								lang=EN-US>1</span>的箱中。
							</span><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=132
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>1</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>、检测报告；<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>2</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>、质保书；<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>3</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>、送货单。</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 6'>
					<td width=132
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>M8</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>螺栓组</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=378
						style='width: 10.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>组合成一套，用纸箱每<span
								lang=EN-US>1600</span>套装一箱（其中<span lang=EN-US>100</span>套<span
								lang=EN-US>/</span>包，共<span lang=EN-US>16</span>包），用不脱色笔在每箱上标注序号、规格及件数，送货资料存放在序号为<span
								lang=EN-US>1</span>的箱中。
							</span><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=132
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>1</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>、检验报告；<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>2</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>、送货单。</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 7'>
					<td width=47 rowspan=3
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; layout-flow: vertical-ideographic'>
						<p class=MsoNormal align=center
							style='margin-top: 0cm; margin-right: 5.65pt; margin-bottom: 0cm; margin-left: 5.65pt; margin-bottom: .0001pt; text-align: center; mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>胶类</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=132
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>AB</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>胶</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=378
						style='width: 10.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>根椐采购订单要求重量包装，<span
								lang=EN-US>A</span>、<span lang=EN-US>B</span>组份包装有明显区别（按送样桶装）。
							</span><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=132 rowspan=3
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>1</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>、检验报告；<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>2</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>、质保书；<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>3</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>、送货单；<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>4</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>、物流单。</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 8; height: 21.9pt'>
					<td width=132
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.9pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>云石胶</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=378
						style='width: 10.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.9pt'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>根椐采购订单要求重量包装（按送样桶装）。</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 9; height: 20.8pt'>
					<td width=132
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.8pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>密封胶</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=378
						style='width: 10.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.8pt'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>按厂家出厂包装，每箱<span
								lang=EN-US>20</span>支。
							</span><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr
					style='mso-yfti-irow: 10; page-break-inside: avoid; height: 2.0cm'>
					<td width=47
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; layout-flow: vertical-ideographic; height: 2.0cm'>
						<p class=MsoNormal align=center
							style='margin-top: 0cm; margin-right: 5.65pt; margin-bottom: 0cm; margin-left: 5.65pt; margin-bottom: .0001pt; text-align: center; mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>挂件</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=132
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 2.0cm'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>不锈钢挂件</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=378
						style='width: 10.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 2.0cm'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>1</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>、<span
								lang=EN-US>10</span>分及以上：用铁丝按每<span lang=EN-US>50</span>个一串，再用全新塑料胶袋每<span
								lang=EN-US>5</span>串放一袋，用有色绳子绑袋口（蝶件用红色，挑件用黄色），用不脱色笔在每袋上标注序号、规格及件数；<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>2</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>、<span
								lang=EN-US>10</span>分以下：用铁丝按每<span lang=EN-US>50</span>个一串，再用全新塑料胶袋每<span
								lang=EN-US>6</span>串放一袋，用有色绳子绑袋口（蝶件用红色，挑件用黄色），用不脱色笔在每袋上标注序号、规格及件数。
							</span><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=132
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 2.0cm'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>1</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>、检测报告（或质量证明书）；<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>2</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>、质保书<span
								lang=EN-US>(</span>或合格证<span lang=EN-US>)</span>；<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>3</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>、送货单。</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 11; height: 23.05pt'>
					<td width=47 rowspan=3
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; layout-flow: vertical-ideographic; height: 23.05pt'>
						<p class=MsoNormal align=center
							style='margin-top: 0cm; margin-right: 5.65pt; margin-bottom: 0cm; margin-left: 5.65pt; margin-bottom: .0001pt; text-align: center; mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>防锈漆</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=132
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 23.05pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>银油</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=378
						style='width: 10.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 23.05pt'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>按出厂包装（根椐采购订单要求重量包装）。</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=132 rowspan=3
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 23.05pt'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>1</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>、检测报告；<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>2</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>、送货单。</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 12; height: 21.8pt'>
					<td width=132
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.8pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>防锈漆（底漆）</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=378
						style='width: 10.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.8pt'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>按出厂包装（根椐采购订单要求重量包装）。</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 13; height: 19.25pt'>
					<td width=132
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.25pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>天那水</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=378
						style='width: 10.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.25pt'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>按出厂包装（根椐采购订单要求重量包装）。</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 14'>
					<td width=47 rowspan=4
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; layout-flow: vertical-ideographic'>
						<p class=MsoNormal align=center
							style='margin-top: 0cm; margin-right: 5.65pt; margin-bottom: 0cm; margin-left: 5.65pt; margin-bottom: .0001pt; text-align: center; mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>杂件</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=132
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>焊条</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=378
						style='width: 10.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>每袋<span
								lang=EN-US>5KG</span>，共<span lang=EN-US>4</span>袋，重量为<span
								lang=EN-US>20KG/</span>箱。
							</span><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=132
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>1</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>、检验报告；<span
								lang=EN-US>2</span>、质保书；<span lang=EN-US>3</span>、送货单。<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 15; height: 19.1pt'>
					<td width=132
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.1pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>美纹纸</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=378
						style='width: 10.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.1pt'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>每箱<span
								lang=EN-US>380</span>卷，用不脱色笔在每袋上标注序号、规格及个数量。
							</span><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=132 rowspan=3
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.1pt'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>1</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>、检验报告；<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>2</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>、送货单。</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 16; height: 20.85pt'>
					<td width=132
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.85pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>泡沫棒</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=378
						style='width: 10.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.85pt'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>每箱<span
								lang=EN-US>300</span>卷，用不脱色笔在每袋上标注序号、规格及个数量。
							</span><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 17; mso-yfti-lastrow: yes; height: 16.9pt'>
					<td width=132
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 16.9pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>胶垫</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=378
						style='width: 10.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 16.9pt'>
						<p class=MsoNormal style='mso-line-height-alt: 10.0pt'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>每小捆<span
								lang=EN-US>400</span>米，<span lang=EN-US>10</span>小捆一大扎，一大扎<span
								lang=EN-US>4000</span>米。
							</span><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
				</tr>
			</table>

			<p class=MsoNormal
				style='line-height: 150%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b><span lang=EN-US
					style='font-size: 12.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 150%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b><span lang=EN-US
					style='font-size: 12.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 150%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b><span lang=EN-US
					style='font-size: 12.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 150%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b><span
					style='font-size: 12.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'>《采购基本合同》附件：</span></b><span
					lang=EN-US
					style='font-size: 12.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
			</p>

			<p class=MsoNormal align=center
				style='text-align: center; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span
					style='font-size: 16.0pt; font-family: "微软雅黑", "sans-serif"'>材料标准及验收标准<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal>
				<b style='mso-bidi-font-weight: normal'><span
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'>干挂石材钢辅料验收标准</span></b><span
					lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
			</p>

			<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
				width=671
				style='width: 503.25pt; border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>
				<tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
					<td width=47
						style='width: 35.45pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<b><span
								style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>序号</span></b><b
								style='mso-bidi-font-weight: normal'><span lang=EN-US
								style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
						</p>
					</td>
					<td width=95
						style='width: 70.9pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<b><span
								style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>材料名称</span></b><b
								style='mso-bidi-font-weight: normal'><span lang=EN-US
								style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
						</p>
					</td>
					<td width=94
						style='width: 70.85pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<b><span
								style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>验收内容</span></b><b
								style='mso-bidi-font-weight: normal'><span lang=EN-US
								style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
						</p>
					</td>
					<td width=378
						style='width: 10.0cm; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<b><span
								style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>验收标准</span></b><b
								style='mso-bidi-font-weight: normal'><span lang=EN-US
								style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
						</p>
					</td>
					<td width=57
						style='width: 42.55pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<b><span
								style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>备注</span></b><b
								style='mso-bidi-font-weight: normal'><span lang=EN-US
								style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 1'>
					<td width=47
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>一</span><b
								style='mso-bidi-font-weight: normal'><span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
						</p>
					</td>
					<td width=95
						style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal
							style='line-height: 15.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>钢材<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
						<p class=MsoNormal
							style='text-indent: 18.0pt; mso-char-indent-count: 2.0; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>槽钢<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal
							style='text-indent: 18.0pt; mso-char-indent-count: 2.0; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>角钢<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal
							style='text-indent: 18.0pt; mso-char-indent-count: 2.0; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>锚板<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal
							style='text-indent: 18.0pt; mso-char-indent-count: 2.0; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>角码<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=94
						style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal
							style='margin-left: 21.55pt; text-indent: -18.0pt; line-height: 15.0pt; mso-line-height-rule: exactly; mso-list: l10 level1 lfo27'>
							<![if !supportLists]>
							<span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 微软雅黑; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'><span
								style='mso-list: Ignore'>①<span
									style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
								</span></span></span>
							<![endif]>
							<span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>按图纸<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal
							style='margin-left: 21.55pt; text-indent: -18.0pt; line-height: 15.0pt; mso-line-height-rule: exactly; mso-list: l10 level1 lfo27'>
							<![if !supportLists]>
							<span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 微软雅黑; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'><span
								style='mso-list: Ignore'>②<span
									style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
								</span></span></span>
							<![endif]>
							<span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>规格<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal
							style='margin-left: 21.55pt; text-indent: -18.0pt; line-height: 15.0pt; mso-line-height-rule: exactly; mso-list: l10 level1 lfo27'>
							<![if !supportLists]>
							<span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 微软雅黑; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'><span
								style='mso-list: Ignore'>③<span
									style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
								</span></span></span>
							<![endif]>
							<span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>外观<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=378
						style='width: 10.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal
							style='line-height: 15.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>1</span><span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>、</span><span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>名称、规格、尺寸与设计下单相符，具体见下表。<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal
							style='margin-left: 13.7pt; mso-para-margin-left: .15gd; text-indent: -12.15pt; mso-char-indent-count: -1.35; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>2</span><span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>、镀锌层<span
								lang=EN-US>60</span>以上，外观不能有起锈、裂纹、气泡、结疤、夹杂和折叠等现象。<b><span
									lang=EN-US><o:p></o:p></span></b></span>
						</p>
						<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
							style='margin-left: 1.45pt; border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>
							<tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
								<td width=76
									style='width: 2.0cm; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<b><span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>名称<span
												lang=EN-US><o:p></o:p></span></span></b>
									</p>
								</td>
								<td width=143
									style='width: 106.9pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<b><span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>材质要求<span
												lang=EN-US><o:p></o:p></span></span></b>
									</p>
								</td>
								<td width=143
									style='width: 107.15pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<b><span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>重量要求<span
												lang=EN-US><o:p></o:p></span></span></b>
									</p>
								</td>
							</tr>
							<tr style='mso-yfti-irow: 1'>
								<td width=76
									style='width: 2.0cm; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span lang=EN-US
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>10#</span><span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>槽<span
											lang=EN-US><o:p></o:p></span></span>
									</p>
								</td>
								<td width=143
									style='width: 106.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>热镀锌<span
											lang=EN-US>60um<o:p></o:p></span></span>
									</p>
								</td>
								<td width=143
									style='width: 107.15pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>负偏差≤<span
											lang=EN-US>8.5kg<o:p></o:p></span></span>
									</p>
								</td>
							</tr>
							<tr style='mso-yfti-irow: 2'>
								<td width=76
									style='width: 2.0cm; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span lang=EN-US
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>8#</span><span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>槽<span
											lang=EN-US><o:p></o:p></span></span>
									</p>
								</td>
								<td width=143
									style='width: 106.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>热镀锌<span
											lang=EN-US>60um<o:p></o:p></span></span>
									</p>
								</td>
								<td width=143
									style='width: 107.15pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>负偏差≤<span
											lang=EN-US>7kg<o:p></o:p></span></span>
									</p>
								</td>
							</tr>
							<tr style='mso-yfti-irow: 3'>
								<td width=76
									style='width: 2.0cm; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span lang=EN-US
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>6.3#</span><span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>槽<span
											lang=EN-US><o:p></o:p></span></span>
									</p>
								</td>
								<td width=143
									style='width: 106.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>热镀锌<span
											lang=EN-US>60um<o:p></o:p></span></span>
									</p>
								</td>
								<td width=143
									style='width: 107.15pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>负偏差≤<span
											lang=EN-US>6kg<o:p></o:p></span></span>
									</p>
								</td>
							</tr>
							<tr style='mso-yfti-irow: 4'>
								<td width=76 rowspan=2
									style='width: 2.0cm; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span lang=EN-US
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>5#</span><span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>角钢<span
											lang=EN-US><o:p></o:p></span></span>
									</p>
								</td>
								<td width=143
									style='width: 106.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>热镀锌<span
											lang=EN-US>60umL50</span>×<span lang=EN-US>5<o:p></o:p></span></span>
									</p>
								</td>
								<td width=143
									style='width: 107.15pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>负偏差≤<span
											lang=EN-US>3.4kg<o:p></o:p></span></span>
									</p>
								</td>
							</tr>
							<tr style='mso-yfti-irow: 5'>
								<td width=143
									style='width: 106.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>热镀锌<span
											lang=EN-US>60umL50</span>×<span lang=EN-US>4<o:p></o:p></span></span>
									</p>
								</td>
								<td width=143
									style='width: 107.15pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>负偏差≤<span
											lang=EN-US>2.9kg<o:p></o:p></span></span>
									</p>
								</td>
							</tr>
							<tr style='mso-yfti-irow: 6; mso-yfti-lastrow: yes'>
								<td width=76
									style='width: 2.0cm; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>连接件<span
											lang=EN-US><o:p></o:p></span></span>
									</p>
								</td>
								<td width=143
									style='width: 106.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>热镀锌<span
											lang=EN-US>60um<o:p></o:p></span></span>
									</p>
								</td>
								<td width=143
									style='width: 107.15pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>按图纸<span
											lang=EN-US><o:p></o:p></span></span>
									</p>
								</td>
							</tr>
						</table>
						<p class=MsoNormal
							style='line-height: 15.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
						</p>
					</td>
					<td width=57
						style='width: 42.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 2'>
					<td width=47
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>二</span><b
								style='mso-bidi-font-weight: normal'><span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
						</p>
					</td>
					<td width=95
						style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal
							style='margin-right: -5.35pt; mso-para-margin-right: -.51gd; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>螺栓配件<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
						<p class=MsoNormal
							style='text-indent: 18.0pt; mso-char-indent-count: 2.0; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>化学螺杆<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal
							style='text-indent: 18.0pt; mso-char-indent-count: 2.0; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>膨胀螺栓<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal
							style='text-indent: 18.0pt; mso-char-indent-count: 2.0; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>连接螺栓<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal
							style='text-indent: 18.0pt; mso-char-indent-count: 2.0; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>五金配件<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=94
						style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal
							style='margin-left: 18.0pt; text-indent: -18.0pt; line-height: 15.0pt; mso-line-height-rule: exactly; mso-list: l4 level1 lfo28'>
							<![if !supportLists]>
							<span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 微软雅黑; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'><span
								style='mso-list: Ignore'>①<span
									style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
								</span></span></span>
							<![endif]>
							<span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>按图纸<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal
							style='margin-left: 18.0pt; text-indent: -18.0pt; line-height: 15.0pt; mso-line-height-rule: exactly; mso-list: l4 level1 lfo28'>
							<![if !supportLists]>
							<span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 微软雅黑; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'><span
								style='mso-list: Ignore'>②<span
									style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
								</span></span></span>
							<![endif]>
							<span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>规格<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal
							style='margin-left: 18.0pt; text-indent: -18.0pt; line-height: 15.0pt; mso-line-height-rule: exactly; mso-list: l4 level1 lfo28'>
							<![if !supportLists]>
							<span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 微软雅黑; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'><span
								style='mso-list: Ignore'>③<span
									style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
								</span></span></span>
							<![endif]>
							<span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>外观<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal
							style='margin-left: 18.0pt; text-indent: -18.0pt; line-height: 15.0pt; mso-line-height-rule: exactly; mso-list: l4 level1 lfo28'>
							<![if !supportLists]>
							<span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 微软雅黑; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'><span
								style='mso-list: Ignore'>④<span
									style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
								</span></span></span>
							<![endif]>
							<span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>配套垫片<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=378
						style='width: 10.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal
							style='line-height: 15.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>1</span><span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>、</span><span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>名称、规格、尺寸、材质与设计下单相符，具体见下表。<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal
							style='margin-left: 13.7pt; mso-para-margin-left: .15gd; text-indent: -12.15pt; mso-char-indent-count: -1.35; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>2</span><span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>、镀锌层<span
								lang=EN-US>60</span>微米以上，外观不能有起锈、裂纹、气泡、结疤、夹杂和折叠等现象。<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal
							style='margin-left: 13.7pt; mso-para-margin-left: .15gd; text-indent: -12.15pt; mso-char-indent-count: -1.35; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>3</span><span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>、每套应配有螺杆、螺母、弹簧垫片、平垫片，螺杆螺母的螺纹吻合。<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
							style='border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>
							<tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
								<td width=121 valign=top
									style='width: 90.65pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<b style='mso-bidi-font-weight: normal'><span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"'>名称<span
												lang=EN-US><o:p></o:p></span></span></b>
									</p>
								</td>
								<td width=121 valign=top
									style='width: 90.65pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<b style='mso-bidi-font-weight: normal'><span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"'>材质要求<span
												lang=EN-US><o:p></o:p></span></span></b>
									</p>
								</td>
								<td width=121 valign=top
									style='width: 90.65pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<b style='mso-bidi-font-weight: normal'><span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"'>规格<span
												lang=EN-US><o:p></o:p></span></span></b>
									</p>
								</td>
							</tr>
							<tr style='mso-yfti-irow: 1'>
								<td width=121 valign=top
									style='width: 90.65pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"'>化锚<span
											lang=EN-US><o:p></o:p></span></span>
									</p>
								</td>
								<td width=121 valign=top
									style='width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"'>国际镀锌<span
											lang=EN-US><o:p></o:p></span></span>
									</p>
								</td>
								<td width=121 valign=top
									style='width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span lang=EN-US
											style='font-size: 14.0pt; font-family: "微软雅黑", "sans-serif"'>&cent;</span><span
											lang=EN-US
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"'>12</span><span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"'>×<span
											lang=EN-US>160<o:p></o:p></span></span>
									</p>
								</td>
							</tr>
							<tr style='mso-yfti-irow: 2; mso-yfti-lastrow: yes'>
								<td width=121 valign=top
									style='width: 90.65pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"'>胀锚<span
											lang=EN-US><o:p></o:p></span></span>
									</p>
								</td>
								<td width=121 valign=top
									style='width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"'>国际镀锌<span
											lang=EN-US><o:p></o:p></span></span>
									</p>
								</td>
								<td width=121 valign=top
									style='width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span lang=EN-US
											style='font-size: 14.0pt; font-family: "微软雅黑", "sans-serif"'>&cent;</span><span
											lang=EN-US
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"'>12</span><span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"'>×<span
											lang=EN-US>110<o:p></o:p></span></span>
									</p>
								</td>
							</tr>
						</table>
						<p class=MsoNormal
							style='line-height: 15.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
						</p>
					</td>
					<td width=57
						style='width: 42.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 3; mso-yfti-lastrow: yes'>
					<td width=47
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>三</span><b
								style='mso-bidi-font-weight: normal'><span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
						</p>
					</td>
					<td width=95
						style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal
							style='line-height: 15.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>不锈钢<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
						<p class=MsoNormal
							style='text-indent: 18.0pt; mso-char-indent-count: 2.0; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>挂件</span><b
								style='mso-bidi-font-weight: normal'><span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
						</p>
					</td>
					<td width=94
						style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal
							style='margin-left: 18.0pt; text-indent: -18.0pt; line-height: 15.0pt; mso-line-height-rule: exactly; mso-list: l26 level1 lfo29'>
							<![if !supportLists]>
							<span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 微软雅黑; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'><span
								style='mso-list: Ignore'>①<span
									style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
								</span></span></span>
							<![endif]>
							<span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>按图纸<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal
							style='margin-left: 18.0pt; text-indent: -18.0pt; line-height: 15.0pt; mso-line-height-rule: exactly; mso-list: l26 level1 lfo29'>
							<![if !supportLists]>
							<span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 微软雅黑; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'><span
								style='mso-list: Ignore'>②<span
									style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
								</span></span></span>
							<![endif]>
							<span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>规格<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal
							style='margin-left: 18.0pt; text-indent: -18.0pt; line-height: 15.0pt; mso-line-height-rule: exactly; mso-list: l26 level1 lfo29'>
							<![if !supportLists]>
							<span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 微软雅黑; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'><span
								style='mso-list: Ignore'>③<span
									style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
								</span></span></span>
							<![endif]>
							<span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>外观<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=378
						style='width: 10.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal
							style='line-height: 15.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>1</span><span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: Arial'>、</span><span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>名称、规格、尺寸、材质与设计下单相符，具体见下表。<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal
							style='margin-left: 13.7pt; mso-para-margin-left: .15gd; text-indent: -12.15pt; mso-char-indent-count: -1.35; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>2</span><span
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>、外观不得有起锈、裂纹、气泡、结疤、夹杂和折叠等现象，当查到<span
								lang=EN-US>5</span>个或<span lang=EN-US>5</span>个以上时应进行复检，合格后方可使用，当不合格数量普遍，直接退场。<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
							style='margin-left: 1.45pt; border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>
							<tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
								<td width=66
									style='width: 49.6pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<b><span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>名称<span
												lang=EN-US><o:p></o:p></span></span></b>
									</p>
								</td>
								<td width=295
									style='width: 221.15pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<b><span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>要求<span
												lang=EN-US><o:p></o:p></span></span></b>
									</p>
								</td>
							</tr>
							<tr style='mso-yfti-irow: 1; mso-yfti-lastrow: yes'>
								<td width=66
									style='width: 49.6pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>挂件<span
											lang=EN-US><o:p></o:p></span></span>
									</p>
								</td>
								<td width=295
									style='width: 221.15pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
									<p class=MsoNormal
										style='line-height: 15.0pt; mso-line-height-rule: exactly'>
										<span
											style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>不锈钢<span
											lang=EN-US>304</span>、厚度<span lang=EN-US>4mm</span>、宽度<span
											lang=EN-US>40 mm</span>、有效弯勾<span lang=EN-US>15 mm<o:p></o:p></span></span>
									</p>
								</td>
							</tr>
						</table>
						<p class=MsoNormal
							style='line-height: 15.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span></b>
						</p>
					</td>
					<td width=57
						style='width: 42.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 15.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span lang=EN-US
								style='font-size: 9.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
						</p>
					</td>
				</tr>
			</table>

			<p class=MsoNormal
				style='line-height: 22.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 22.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 22.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 22.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 22.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 22.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 22.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 22.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 22.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 150%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b><span
					style='font-size: 12.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'>《采购基本合同》附件：</span></b><span
					lang=EN-US
					style='font-size: 12.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
			</p>

			<p class=MsoNormal align=center
				style='text-align: center; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span
					style='font-size: 16.0pt; font-family: "微软雅黑", "sans-serif"'>材料标准及验收标准<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='line-height: 150%; layout-grid-mode: char; mso-layout-grid-align: none'>
				<b style='mso-bidi-font-weight: normal'><span
					style='font-size: 12.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'>石材工程化工类材料标准</span></b><span
					lang=EN-US
					style='font-size: 12.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='line-height: 18.0pt; mso-line-height-rule: exactly'>
				<span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>（一）材料基本要求<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 18.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>1</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、结构胶：品牌防伪标志、生产日期和批号、产地、产品说明书等资料齐全、标识清楚；石材专用<span
					lang=EN-US>AB</span>胶、配比<span lang=EN-US>1:1</span>；材料不得渗油、不含刺激气味；两组粘稠度相近、色差大、易调和；标准型或加强型材料，外墙禁用经济型。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 18.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、云石胶：品牌防伪标志、生产日期和批号、产地、产品说明书等资料齐全、标识清楚；颜色建议选择透明、严禁与<span
					lang=EN-US>AB</span>结构胶调和前后的颜色相同。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 18.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>3</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、密封胶：品牌防伪标志、生产日期和批号、产地、产品说明书等资料齐全、标识清楚；石材专用<span
					lang=EN-US>20</span>级以的材料、中性、耐候；设计无要求时、粗面用同色、光面用黑色。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 18.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>4</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、化学锚栓：品牌防伪标志、生产日期和批号、配套规格、产地、产品说明书等资料齐全、标识清楚；药管内的各种成份透明可见、液体有一定流动性、粉状材料无结块。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 18.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>5</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、防护剂：品牌防伪标志、生产日期和批号、产地、产品说明书等资料齐全、标识清楚；石材饰面必须使用装饰型油性材料、底面仅限油性。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 18.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>6</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、防锈油漆：品牌防伪标志、生产日期和批号、产地、产品说明书等资料齐全、标识清楚；面漆要求富锌漆、底漆要求红丹漆；材料不得有结块、使用后不得有起皮或开裂。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 18.0pt; mso-line-height-rule: exactly'>
				<span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>（二）材料检验标准<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 18.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>1</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、通用资料包括：①出厂自检资料、②型式检验报告、③报审资料。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 18.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、出厂自检内容：按各企业质量管理体系内容，必须有相关检验项目和标识，并按批次留样。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 18.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>3</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、型式检验内容：要求<span
					lang=EN-US>1</span>年内至少一次（加黑检验项的为重要项目，刚合格或在合格值在<span lang=EN-US>5%</span>以内的需要按单个工程项目专项抽料送检）<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 18.0pt; mso-line-height-rule: exactly'>
				<span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>①、结构胶：<b
					style='mso-bidi-font-weight: normal'>外观</b><span lang=EN-US>1</span>项、适用期<span
					lang=EN-US>1</span>项、弯曲弹性模量<span lang=EN-US>1</span>项、冲击强度<span
					lang=EN-US>1</span>项、<b style='mso-bidi-font-weight: normal'>拉剪强度</b>（不锈钢<span
					lang=EN-US>-</span>不饰钢）<span lang=EN-US>1</span>项、<b
					style='mso-bidi-font-weight: normal'>压剪强度</b>（石材<span lang=EN-US>-</span>石材、石材<span
					lang=EN-US>-</span>不锈钢）<span lang=EN-US>5</span>项。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 18.0pt; mso-line-height-rule: exactly'>
				<span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>②、云石胶：<b
					style='mso-bidi-font-weight: normal'>Ⅰ型技术标准</b>，外观<span lang=EN-US>1</span>项、适用期<span
					lang=EN-US>1</span>项、弯曲弹性模量<span lang=EN-US>1</span>项、冲击韧性<span
					lang=EN-US>1</span>项、压剪粘结强度（石材<span lang=EN-US>-</span>石材、石材<span
					lang=EN-US>-</span>不锈钢）<span lang=EN-US>5</span>项。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 18.0pt; mso-line-height-rule: exactly'>
				<span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>③、密封胶：<b
					style='mso-bidi-font-weight: normal'><span lang=EN-US>20</span>级以上技术标准</b>，<b
					style='mso-bidi-font-weight: normal'>外观</b><span lang=EN-US>1</span>项、下垂性<span
					lang=EN-US>2</span>项、表干时间<span lang=EN-US>1</span>项、挤出性<span
					lang=EN-US>1</span>项、<b style='mso-bidi-font-weight: normal'>弹性恢复率</b><span
					lang=EN-US>1</span>项、<b style='mso-bidi-font-weight: normal'>拉伸模量</b><span
					lang=EN-US>1</span>项、<b style='mso-bidi-font-weight: normal'>定伸粘结性</b><span
					lang=EN-US>1</span>项、<b style='mso-bidi-font-weight: normal'>冷拉热压后粘结性</b><span
					lang=EN-US>1</span>项、<b style='mso-bidi-font-weight: normal'>浸水后定伸粘结性</b><span
					lang=EN-US>1</span>项、<b style='mso-bidi-font-weight: normal'>质量损失率</b><span
					lang=EN-US>1</span>项、<b style='mso-bidi-font-weight: normal'>污染性</b><span
					lang=EN-US>2</span>项。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 18.0pt; mso-line-height-rule: exactly'>
				<span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>④、化学锚栓：<b
					style='mso-bidi-font-weight: normal'><span lang=EN-US>A</span>级材胶标准，外观</b><span
					lang=EN-US>1</span>项、下垂流度<span lang=EN-US>1</span>项、适用期<span
					lang=EN-US>1</span>项、使用温度范围<span lang=EN-US>1</span>项、固化剂中乙二胺含量<span
					lang=EN-US>1</span>项、不挥发物含量<span lang=EN-US>1</span>项、<b
					style='mso-bidi-font-weight: normal'>粘结性</b><span lang=EN-US>2</span>项、<b
					style='mso-bidi-font-weight: normal'>耐久性</b><span lang=EN-US>1</span>项（北方加耐冻性）。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 18.0pt; mso-line-height-rule: exactly'>
				<span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>⑤、防护剂：<b
					style='mso-bidi-font-weight: normal'>一等品（特定工程为优等品）</b>，<span
					lang=EN-US>PH</span>值、稳定性、防水耐污性、防酸碱性、耐紫外线老化性（有配备实验资质厂家可自我检验）。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 18.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>4</span><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、专项检验标准，主要是特定项目要求或新品牌引进检验或是一般项目抽检，每类材料检验项目应该是按上面要求全检，当检测值低于型式检验<span
					lang=EN-US>20%</span>且不高于标准的<span lang=EN-US>20%</span>时，应再抽样送检，结果仍一样时视为不合格。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 18.0pt; mso-line-height-rule: exactly'>
				<span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>（三）相关附表<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='line-height: 16.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>1</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、结构胶检验表，参考<span
						lang=EN-US>JC887-2001<o:p></o:p></span></span></b>
			</p>

			<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0
				style='margin-left: 5.4pt; border-collapse: collapse; border: none; mso-border-alt: solid windowtext .75pt; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt; mso-border-insideh: .75pt solid windowtext; mso-border-insidev: .75pt solid windowtext'>
				<tr
					style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; height: 22.75pt'>
					<td width=47
						style='width: 35.45pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.75pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>序号<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
					<td width=198 colspan=3
						style='width: 148.85pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.75pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>检验项目<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
					<td width=170
						style='width: 127.6pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.75pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>行业标准<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
					<td width=158
						style='width: 118.7pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.75pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>检验和注释<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 1; height: 20.75pt'>
					<td width=47
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.75pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>1<o:p></o:p></span>
						</p>
					</td>
					<td width=198 colspan=3
						style='width: 148.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.75pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>外观<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=170
						style='width: 127.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.75pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>细腻均匀的膏状物，无离析、颗粒及凝胶，各组色差明显<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=158
						style='width: 118.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.75pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>现场检查：</span></b><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>膏状材料，均匀无杂物和硬块，渗油少和不发臭，色差大，易调和<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 2; height: 22.85pt'>
					<td width=47
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.85pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2<o:p></o:p></span>
						</p>
					</td>
					<td width=198 colspan=3
						style='width: 148.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.85pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>适用期<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=170
						style='width: 127.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.85pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 26.95pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>30min</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>～<span
								lang=EN-US>90 min<o:p></o:p></span></span>
						</p>
					</td>
					<td width=158
						style='width: 118.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.85pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>初步凝固时间<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 3; height: 13.6pt'>
					<td width=47
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.6pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>3<o:p></o:p></span>
						</p>
					</td>
					<td width=198 colspan=3
						style='width: 148.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.6pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>弯曲弹性模量<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=170
						style='width: 127.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.6pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 26.95pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>2000MPa<o:p></o:p></span></span>
						</p>
					</td>
					<td width=158
						style='width: 118.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.6pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>材料韧性<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 4; height: 18.75pt'>
					<td width=47
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.75pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>4<o:p></o:p></span>
						</p>
					</td>
					<td width=198 colspan=3
						style='width: 148.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.75pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>冲击强度<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=170
						style='width: 127.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.75pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 26.95pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>3.0KJ/</span></span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "Batang", "serif"; mso-bidi-font-family: Batang'>㎡</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=158
						style='width: 118.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.75pt'>
						<p class=MsoNormal
							style='text-indent: 26.95pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>材料硬度<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 5; height: 17.4pt'>
					<td width=47
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.4pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>5<o:p></o:p></span>
						</p>
					</td>
					<td width=198 colspan=3
						style='width: 148.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>拉剪强度（不锈钢<span
								lang=EN-US>-</span>不锈钢）<span lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=170
						style='width: 127.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.4pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>8.0MPa<o:p></o:p></span></span>
						</p>
					</td>
					<td width=158
						style='width: 118.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.4pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>10MPa</span>，提高标准<span lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 6; height: 17.75pt'>
					<td width=47 rowspan=5
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.75pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>6<o:p></o:p></span>
						</p>
					</td>
					<td width=47 rowspan=5
						style='width: 35.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.75pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>压剪强度<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=65 rowspan=4
						style='width: 48.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.75pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>石材<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>-<o:p></o:p></span>
						</p>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>石材<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=86
						style='width: 64.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.75pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>标准条件，<span
								lang=EN-US>48h<o:p></o:p></span></span>
						</p>
					</td>
					<td width=170
						style='width: 127.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.75pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>10.0MPa<o:p></o:p></span></span>
						</p>
					</td>
					<td width=158
						style='width: 118.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.75pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>10MPa</span>，提高标准<span lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 7; height: 18.2pt'>
					<td width=86
						style='width: 64.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.2pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>浸水，<span
								lang=EN-US>168h<o:p></o:p></span></span>
						</p>
					</td>
					<td width=170
						style='width: 127.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.2pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>7.0MPa<o:p></o:p></span></span>
						</p>
					</td>
					<td width=158
						style='width: 118.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.2pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>10MPa</span>，提高标准<span lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 8; height: 25.25pt'>
					<td width=86
						style='width: 64.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 25.25pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>热处理<span
								lang=EN-US>80</span>℃，<span lang=EN-US>168h<o:p></o:p></span></span>
						</p>
					</td>
					<td width=170
						style='width: 127.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 25.25pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>7.0MPa<o:p></o:p></span></span>
						</p>
					</td>
					<td width=158
						style='width: 118.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 25.25pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>10MPa</span>，提高标准<span lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 9; height: 20.55pt'>
					<td width=86
						style='width: 64.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.55pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>冻融循环<span
								lang=EN-US>50</span>次<span lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=170
						style='width: 127.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.55pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>7.0MPa<o:p></o:p></span></span>
						</p>
					</td>
					<td width=158
						style='width: 118.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.55pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>10MPa</span>，提高标准<span lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 10; height: 28.85pt'>
					<td width=65
						style='width: 48.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 28.85pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>石材<span
								lang=EN-US>-</span>不锈钢<span lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=86
						style='width: 64.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 28.85pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>标准条件，<span
								lang=EN-US>48h<o:p></o:p></span></span>
						</p>
					</td>
					<td width=170
						style='width: 127.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 28.85pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>10.0MPa<o:p></o:p></span></span>
						</p>
					</td>
					<td width=158
						style='width: 118.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .75pt; mso-border-left-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 28.85pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>10MPa<o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr
					style='mso-yfti-irow: 11; mso-yfti-lastrow: yes; height: 27.05pt'>
					<td width=574 colspan=6
						style='width: 430.6pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .75pt; mso-border-alt: solid windowtext .75pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 27.05pt'>
						<p class=MsoNormal align=left
							style='text-align: left; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>说明：第<span
								lang=EN-US>5</span>、<span lang=EN-US>6</span>项为强制标准，考虑到目前经常有项目的结构胶出现过问题，且各个品牌材料检测报告都在<span
								lang=EN-US>10MPa</span>以上，所以将标准提高到<span lang=EN-US>10MPa</span>。<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
			</table>

			<p class=MsoNormal
				style='line-height: 16.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、云石胶检验表，参考<span
						lang=EN-US>JC 989-2006</span>（Ⅰ型）<span lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
				width=576
				style='width: 432.35pt; margin-left: 5.4pt; border-collapse: collapse; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>
				<tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; height: 38.2pt'>
					<td width=47
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-bottom: solid black 1.0pt; mso-border-alt: solid windowtext .5pt; mso-border-bottom-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>序号<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
					<td width=255 nowrap colspan=3
						style='width: 191.35pt; border-top: solid windowtext 1.0pt; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: windowtext; mso-border-left-alt: windowtext; mso-border-bottom-alt: black; mso-border-right-alt: black; mso-border-style-alt: solid; mso-border-width-alt: .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>检验项目<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
					<td width=151 nowrap
						style='width: 4.0cm; border-top: solid windowtext 1.0pt; border-left: none; border-bottom: none; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>行业标准<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>(I</span></b><b
								style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>型<span
									lang=EN-US>)</span></span></b><b style='mso-bidi-font-weight: normal'><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'><o:p></o:p></span></b>
						</p>
					</td>
					<td width=123 nowrap
						style='width: 92.15pt; border-top: solid windowtext 1.0pt; border-left: none; border-bottom: solid black 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-bottom-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>检验和注释<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 1; height: 19.25pt'>
					<td width=47 nowrap
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.25pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>1<o:p></o:p></span>
						</p>
					</td>
					<td width=255 nowrap colspan=3
						style='width: 191.35pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.25pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>外观<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=151 nowrap
						style='width: 4.0cm; border-top: solid windowtext 1.0pt; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.25pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>细腻均匀的膏状物，无离析、颗粒及凝胶<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=123 nowrap
						style='width: 92.15pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.25pt'></td>
				</tr>
				<tr style='mso-yfti-irow: 2; height: 15.9pt'>
					<td width=47 nowrap
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.9pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2<o:p></o:p></span>
						</p>
					</td>
					<td width=255 nowrap colspan=3
						style='width: 191.35pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.9pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>适用期，<span
								lang=EN-US>min<o:p></o:p></span></span>
						</p>
					</td>
					<td width=151 nowrap
						style='width: 4.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.9pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>3~10<o:p></o:p></span>
						</p>
					</td>
					<td width=123 nowrap
						style='width: 92.15pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.9pt'></td>
				</tr>
				<tr style='mso-yfti-irow: 3; height: 21.35pt'>
					<td width=47 nowrap
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.35pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>3<o:p></o:p></span>
						</p>
					</td>
					<td width=255 nowrap colspan=3
						style='width: 191.35pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.35pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>弯曲弹性模量<span
								lang=EN-US>,Mpa<o:p></o:p></span></span>
						</p>
					</td>
					<td width=151 nowrap
						style='width: 4.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.35pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>2000<o:p></o:p></span></span>
						</p>
					</td>
					<td width=123 nowrap
						style='width: 92.15pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.35pt'></td>
				</tr>
				<tr style='mso-yfti-irow: 4; height: 20.9pt'>
					<td width=47 nowrap
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.9pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>4<o:p></o:p></span>
						</p>
					</td>
					<td width=255 nowrap colspan=3
						style='width: 191.35pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.9pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>冲击韧性，<span
								lang=EN-US>kJ/</span></span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "Batang", "serif"; mso-bidi-font-family: Batang'>㎡</span><span
								lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
						</p>
					</td>
					<td width=151 nowrap
						style='width: 4.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.9pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>3.0<o:p></o:p></span></span>
						</p>
					</td>
					<td width=123 nowrap
						style='width: 92.15pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.9pt'></td>
				</tr>
				<tr style='mso-yfti-irow: 5; height: 23.85pt'>
					<td width=47 nowrap rowspan=5
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 23.85pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>5<o:p></o:p></span>
						</p>
					</td>
					<td width=47 rowspan=5
						style='width: 35.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 23.85pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>压剪<span
								lang=EN-US><br> </span>强度<span lang=EN-US><br>
									Mpa<o:p></o:p></span></span>
						</p>
					</td>
					<td width=94 nowrap rowspan=4
						style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 23.85pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>石材<span
								lang=EN-US>-</span>石材<span lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=113 nowrap
						style='width: 3.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 23.85pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>标准条件<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=151 nowrap
						style='width: 4.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 23.85pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>8.0<o:p></o:p></span></span>
						</p>
					</td>
					<td width=123 nowrap
						style='width: 92.15pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 23.85pt'></td>
				</tr>
				<tr style='mso-yfti-irow: 6; height: 20.65pt'>
					<td width=113 nowrap
						style='width: 3.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.65pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>高温处理<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=151 nowrap
						style='width: 4.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.65pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>7.0<o:p></o:p></span></span>
						</p>
					</td>
					<td width=123 nowrap
						style='width: 92.15pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.65pt'></td>
				</tr>
				<tr style='mso-yfti-irow: 7; height: 17.65pt'>
					<td width=113 nowrap
						style='width: 3.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.65pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>浸水处理<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=151 nowrap
						style='width: 4.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.65pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>6.0<o:p></o:p></span></span>
						</p>
					</td>
					<td width=123 nowrap
						style='width: 92.15pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.65pt'></td>
				</tr>
				<tr style='mso-yfti-irow: 8; height: 19.45pt'>
					<td width=113 nowrap
						style='width: 3.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.45pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>冻融循环处理<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=151 nowrap
						style='width: 4.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.45pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>5.0<o:p></o:p></span></span>
						</p>
					</td>
					<td width=123 nowrap
						style='width: 92.15pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.45pt'></td>
				</tr>
				<tr style='mso-yfti-irow: 9; height: 20.1pt'>
					<td width=94 nowrap
						style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.1pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>石材<span
								lang=EN-US>-</span>不锈钢<span lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=113 nowrap
						style='width: 3.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.1pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>标准条件<span
								lang=EN-US>48h<o:p></o:p></span></span>
						</p>
					</td>
					<td width=151 nowrap
						style='width: 4.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.1pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>8.0<o:p></o:p></span></span>
						</p>
					</td>
					<td width=123 nowrap
						style='width: 92.15pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.1pt'></td>
				</tr>
				<tr style='mso-yfti-irow: 10; mso-yfti-lastrow: yes; height: 25.3pt'>
					<td width=576 colspan=6
						style='width: 432.35pt; border-top: none; border-left: solid windowtext 1.0pt; border-bottom: solid black 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-bottom-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 25.3pt'>
						<p class=MsoNormal align=left
							style='text-align: left; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>说明：作为临时固定的材料，只需达到<span
								lang=EN-US>I</span>型行业标准就行了。<span lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
			</table>

			<p class=MsoNormal
				style='line-height: 16.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>3</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、密封胶检验表，参考<span
						lang=EN-US>GBT23261-2009</span>（<span lang=EN-US>20</span>、<span
						lang=EN-US>25</span>级）<span lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
				width=576
				style='width: 432.35pt; margin-left: 5.4pt; border-collapse: collapse; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>
				<tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; height: 24.0pt'>
					<td width=47 nowrap
						style='width: 35.45pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.0pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>序号</span></b><b
								style='mso-bidi-font-weight: normal'><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'><o:p></o:p></span></b>
						</p>
					</td>
					<td width=132 nowrap colspan=3
						style='width: 99.25pt; border: solid windowtext 1.0pt; border-left: none; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.0pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>检测项目</span></b><b
								style='mso-bidi-font-weight: normal'><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'><o:p></o:p></span></b>
						</p>
					</td>
					<td width=161 nowrap
						style='width: 120.45pt; border: solid windowtext 1.0pt; border-left: none; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.0pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>技术指标<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>（<span
									lang=EN-US>20-25HM</span>）<span lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
					<td width=236 nowrap
						style='width: 177.2pt; border: solid windowtext 1.0pt; border-left: none; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.0pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>我部检验和注释</span></b><b
								style='mso-bidi-font-weight: normal'><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'><o:p></o:p></span></b>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 1; height: 28.6pt'>
					<td width=47 nowrap
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 28.6pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>1<o:p></o:p></span>
						</p>
					</td>
					<td width=132 nowrap colspan=3
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 28.6pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>外观<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=161
						style='width: 120.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 28.6pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>细腻、均匀膏状物，不应有气泡、结皮或凝胶<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=236 nowrap
						style='width: 177.2pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 28.6pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>现场检查：</span></b><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>细腻均匀的膏状物，无离析、颗粒及凝胶<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 2; height: 19.7pt'>
					<td width=47 nowrap rowspan=2
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.7pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>2<o:p></o:p></span>
						</p>
					</td>
					<td width=57 nowrap rowspan=2
						style='width: 42.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.7pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>下垂度<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>mm<o:p></o:p></span>
						</p>
					</td>
					<td width=76 nowrap colspan=2
						style='width: 2.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.7pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>垂直<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=161 nowrap
						style='width: 120.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.7pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≤<span
								lang=EN-US>3<o:p></o:p></span></span>
						</p>
					</td>
					<td width=236 rowspan=2
						style='width: 177.2pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.7pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>稠度太稀时会影响打胶质量（跟第<span
								lang=EN-US>3</span>点相反）<span lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 3; height: 20.7pt'>
					<td width=76 nowrap colspan=2
						style='width: 2.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.7pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>水平<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=161 nowrap
						style='width: 120.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.7pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>无变形<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 4; height: 21.05pt'>
					<td width=47 nowrap
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.05pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>3<o:p></o:p></span>
						</p>
					</td>
					<td width=132 nowrap colspan=3
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.05pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>挤出性，<span
								lang=EN-US>ML/min<o:p></o:p></span></span>
						</p>
					</td>
					<td width=161 nowrap
						style='width: 120.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.05pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>80<o:p></o:p></span></span>
						</p>
					</td>
					<td width=236 nowrap
						style='width: 177.2pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.05pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>稠度太干时也会影响打胶质量<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 5; height: 17.9pt'>
					<td width=47 nowrap
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.9pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>4<o:p></o:p></span>
						</p>
					</td>
					<td width=132 nowrap colspan=3
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.9pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>表干时间，<span
								lang=EN-US>H<o:p></o:p></span></span>
						</p>
					</td>
					<td width=161 nowrap
						style='width: 120.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.9pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≤<span
								lang=EN-US>3<o:p></o:p></span></span>
						</p>
					</td>
					<td width=236 nowrap
						style='width: 177.2pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.9pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>时间太长会容易被二次污染<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 6; height: 16.6pt'>
					<td width=47 nowrap
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 16.6pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>5<o:p></o:p></span>
						</p>
					</td>
					<td width=132 nowrap colspan=3
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 16.6pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>弹性恢复率，<span
								lang=EN-US>%<o:p></o:p></span></span>
						</p>
					</td>
					<td width=161 nowrap
						style='width: 120.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 16.6pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>80<o:p></o:p></span></span>
						</p>
					</td>
					<td width=236 nowrap
						style='width: 177.2pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 16.6pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>按级拉、放后长度变化越少越好<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 7; height: 19.05pt'>
					<td width=47 nowrap rowspan=2
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.05pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>6<o:p></o:p></span>
						</p>
					</td>
					<td width=77 nowrap colspan=2 rowspan=2
						style='width: 57.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.05pt'>
						<p class=MsoNormal align=center
							style='margin-top: 0cm; margin-right: -5.35pt; margin-bottom: 0cm; margin-left: -.75pt; margin-bottom: .0001pt; mso-para-margin-top: 0cm; mso-para-margin-right: -.51gd; mso-para-margin-bottom: 0cm; mso-para-margin-left: -.59gd; mso-para-margin-bottom: .0001pt; text-align: center; text-indent: -5.45pt; mso-char-indent-count: -.52; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>拉伸模量<span
								lang=EN-US>MPa<o:p></o:p></span></span>
						</p>
					</td>
					<td width=56
						style='width: 41.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.05pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>23</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>℃<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=161 nowrap
						style='width: 120.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.05pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>＞<span
								lang=EN-US>0.4<o:p></o:p></span></span>
						</p>
					</td>
					<td width=236 nowrap rowspan=2
						style='width: 177.2pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.05pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>有常温或低温下的将材料拉到级别变形所需要的力<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 8; height: 18.05pt'>
					<td width=56
						style='width: 41.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.05pt'>
						<p class=MsoNormal align=left
							style='text-align: left; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>-20</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>℃<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=161 nowrap
						style='width: 120.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.05pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>＞<span
								lang=EN-US>0.6<o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 9; height: 21.4pt'>
					<td width=47 nowrap
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>7<o:p></o:p></span>
						</p>
					</td>
					<td width=132 nowrap colspan=3
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>定伸粘结性<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=161 nowrap
						style='width: 120.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>无破坏<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=236 nowrap rowspan=3
						style='width: 177.2pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.4pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>耐久性能：</span></b><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>在标准、浸水、热压加冷拉三种条件下按级别拉伸后，要求仍粘在基材上且不得有破坏<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 10; height: 21.0pt'>
					<td width=47 nowrap
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.0pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>8<o:p></o:p></span>
						</p>
					</td>
					<td width=132 nowrap colspan=3
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.0pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>浸水后定伸粘结性<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=161 nowrap
						style='width: 120.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.0pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>无破坏<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 11; height: 19.9pt'>
					<td width=47 nowrap
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.9pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>9<o:p></o:p></span>
						</p>
					</td>
					<td width=132 nowrap colspan=3
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.9pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>热压，冷拉后的粘结性<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=161 nowrap
						style='width: 120.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.9pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>无破坏<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 12; height: 21.65pt'>
					<td width=47 nowrap rowspan=2
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.65pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: -5.4pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>10<o:p></o:p></span>
						</p>
					</td>
					<td width=77 nowrap colspan=2 rowspan=2
						style='width: 57.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.65pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>污染性<span
								lang=EN-US>mm<o:p></o:p></span></span>
						</p>
					</td>
					<td width=56 nowrap
						style='width: 41.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.65pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>污染深度<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=161 nowrap
						style='width: 120.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.65pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≤<span
								lang=EN-US>2.0<o:p></o:p></span></span>
						</p>
					</td>
					<td width=236 nowrap rowspan=3
						style='width: 177.2pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.65pt'>
						<p class=MsoNormal
							style='text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>耐久、污染性能：</span></b><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>在一定条件下，材料会渗出某些渗合物（粉或油），可能会污染石材，同时影响耐久性。<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 13; height: 22.5pt'>
					<td width=56 nowrap
						style='width: 41.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.5pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>污染宽度<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=161 nowrap
						style='width: 120.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.5pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≤<span
								lang=EN-US>2.0<o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 14; height: 21.8pt'>
					<td width=47 nowrap
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.8pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: -5.4pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>11<o:p></o:p></span>
						</p>
					</td>
					<td width=132 nowrap colspan=3
						style='width: 99.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.8pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>质量损失率<span
								lang=EN-US>/%<o:p></o:p></span></span>
						</p>
					</td>
					<td width=161 nowrap
						style='width: 120.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.8pt'>
						<p class=MsoNormal align=center
							style='text-align: center; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≤<span
								lang=EN-US>5.0<o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 15; mso-yfti-lastrow: yes; height: 21.7pt'>
					<td width=576 nowrap colspan=6
						style='width: 432.35pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.7pt'>
						<p class=MsoNormal align=left
							style='text-align: left; text-indent: 1.65pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>说明：目前厂家的同级别材料生产成本相差不会太大，价格差主要在于配方，加油加粉越多、质量就越差、成本也就越低。<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<![if !supportMisalignedColumns]>
				<tr height=0>
					<td width=47 style='border: none'></td>
					<td width=57 style='border: none'></td>
					<td width=20 style='border: none'></td>
					<td width=56 style='border: none'></td>
					<td width=161 style='border: none'></td>
					<td width=236 style='border: none'></td>
				</tr>
				<![endif]>
			</table>

			<p class=MsoNormal
				style='line-height: 16.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>4</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、化学锚栓（锚固胶）检验表，参考<span
						lang=EN-US>JGT 340-2011</span>（<span lang=EN-US>A</span>级）<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
				width=586
				style='width: 439.45pt; margin-left: 5.4pt; border-collapse: collapse; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>
				<tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; height: 16.0pt'>
					<td width=47
						style='width: 35.45pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 16.0pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>序号</span></b><b
								style='mso-bidi-font-weight: normal'><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'><o:p></o:p></span></b>
						</p>
					</td>
					<td width=397 colspan=3
						style='width: 297.7pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 16.0pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>检测项目</span></b><b
								style='mso-bidi-font-weight: normal'><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'><o:p></o:p></span></b>
						</p>
					</td>
					<td width=142
						style='width: 106.3pt; border-top: solid windowtext 1.0pt; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: windowtext; mso-border-left-alt: windowtext; mso-border-bottom-alt: black; mso-border-right-alt: black; mso-border-style-alt: solid; mso-border-width-alt: .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 16.0pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>要<span
									lang=EN-US><span style='mso-spacerun: yes'>&nbsp;&nbsp;
									</span></span>求<span lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 1; height: 17.25pt'>
					<td width=47 nowrap
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.25pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>1<o:p></o:p></span>
						</p>
					</td>
					<td width=397 nowrap colspan=3
						style='width: 297.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.25pt'>
						<p class=MsoNormal align=left
							style='text-align: left; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>外观质量<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=142 nowrap
						style='width: 106.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.25pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>无分层、结块、沉淀<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 2; height: 18.0pt'>
					<td width=47 nowrap
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.0pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>2<o:p></o:p></span>
						</p>
					</td>
					<td width=397 nowrap colspan=3
						style='width: 297.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.0pt'>
						<p class=MsoNormal align=left
							style='text-align: left; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>下垂流度<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=142 nowrap
						style='width: 106.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.0pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>无滴落，≤<span
								lang=EN-US>10 mm<o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 3; height: 20.25pt'>
					<td width=47 nowrap rowspan=2
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.25pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>3<o:p></o:p></span>
						</p>
					</td>
					<td width=294 nowrap colspan=2 rowspan=2
						style='width: 220.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.25pt'>
						<p class=MsoNormal align=left
							style='text-align: left; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>适用期<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=103 nowrap
						style='width: 77.1pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.25pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>快固型<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=142 nowrap
						style='width: 106.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.25pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>10~25
								min<o:p></o:p>
							</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 4; height: 19.5pt'>
					<td width=103 nowrap
						style='width: 77.1pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.5pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>非快固型<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=142 nowrap
						style='width: 106.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.5pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>25~120
								min<o:p></o:p>
							</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 5; height: 20.25pt'>
					<td width=47 nowrap
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.25pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>4<o:p></o:p></span>
						</p>
					</td>
					<td width=397 nowrap colspan=3
						style='width: 297.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.25pt'>
						<p class=MsoNormal align=left
							style='text-align: left; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>使用温度范围<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=142 nowrap
						style='width: 106.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.25pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>按产品说明书范围<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 6; height: 18.75pt'>
					<td width=47 nowrap
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.75pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>5<o:p></o:p></span>
						</p>
					</td>
					<td width=397 nowrap colspan=3
						style='width: 297.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.75pt'>
						<p class=MsoNormal align=left
							style='text-align: left; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>固化剂中乙二胺含量<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=142 nowrap
						style='width: 106.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.75pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>≤<span
								lang=EN-US>0.1%<o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 7; height: 21.0pt'>
					<td width=47 nowrap
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.0pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>6<o:p></o:p></span>
						</p>
					</td>
					<td width=397 nowrap colspan=3
						style='width: 297.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.0pt'>
						<p class=MsoNormal align=left
							style='text-align: left; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>不挥发物含量<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=142 nowrap
						style='width: 106.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.0pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>≥<span
								lang=EN-US>99%<o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 8; height: 19.5pt'>
					<td width=47 nowrap rowspan=2
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.5pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>7<o:p></o:p></span>
						</p>
					</td>
					<td width=57 nowrap rowspan=2
						style='width: 42.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.5pt'>
						<p class=MsoNormal align=left
							style='text-align: left; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>粘结性<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=340 nowrap colspan=2
						style='width: 9.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.5pt'>
						<p class=MsoNormal align=left
							style='text-align: left; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>钢<span
								lang=EN-US>-</span>钢拉伸抗剪强度标准值<span lang=EN-US>/Mpa<o:p></o:p></span></span>
						</p>
					</td>
					<td width=142 nowrap
						style='width: 106.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.5pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>≥<span
								lang=EN-US>16.0 Mpa<o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 9; height: 26.1pt'>
					<td width=340 colspan=2
						style='width: 9.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 26.1pt'>
						<p class=MsoNormal align=left
							style='text-align: left; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>约束拉拔条件下带肋钢筋与<span
								lang=EN-US>C30</span>混凝土的粘结强度<span lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=142 nowrap
						style='width: 106.3pt; border: none; border-right: solid black 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-right-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 26.1pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>≥<span
								lang=EN-US>11.0 Mpa<o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 10; height: 18.9pt'>
					<td width=47 nowrap rowspan=2
						style='width: 35.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.9pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>8<o:p></o:p></span>
						</p>
					</td>
					<td width=57 nowrap rowspan=2
						style='width: 42.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.9pt'>
						<p class=MsoNormal align=left
							style='text-align: left; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>耐久性<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=340 nowrap colspan=2
						style='width: 9.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.9pt'>
						<p class=MsoNormal align=left
							style='text-align: left; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>耐湿热老化性，钢<span
								lang=EN-US>-</span>钢拉伸抗剪强度标准值降低率<span lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=142 nowrap
						style='width: 106.3pt; border-top: solid windowtext 1.0pt; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid black .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.9pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>≤<span
								lang=EN-US>10%<o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 11; height: 16.5pt'>
					<td width=340 nowrap colspan=2
						style='width: 9.0cm; border: none; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 16.5pt'>
						<p class=MsoNormal align=left
							style='text-align: left; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>北方地区耐冻融性，钢<span
								lang=EN-US>-</span>钢拉伸抗剪强度标准值降低率<span lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=142 nowrap
						style='width: 106.3pt; border: none; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 16.5pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>≤<span
								lang=EN-US>5%<o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 12; mso-yfti-lastrow: yes; height: 13.9pt'>
					<td width=586 colspan=5
						style='width: 439.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.9pt'>
						<p class=MsoNormal align=left
							style='text-align: left; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>说明：</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>非特定工程项目不做专项检验</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>，原因是检验费用高于材料采购成本，疲劳试验没必要做<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<![if !supportMisalignedColumns]>
				<tr height=0>
					<td width=47 style='border: none'></td>
					<td width=57 style='border: none'></td>
					<td width=237 style='border: none'></td>
					<td width=103 style='border: none'></td>
					<td width=142 style='border: none'></td>
				</tr>
				<![endif]>
			</table>

			<p class=MsoNormal
				style='line-height: 16.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>5</span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>、石材防护剂检验表，参考<span
						lang=EN-US>JCT973-2005<o:p></o:p></span></span></b>
			</p>

			<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0
				width=586
				style='width: 439.45pt; margin-left: 5.4pt; border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext'>
				<tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; height: 18.4pt'>
					<td width=49 rowspan=2
						style='width: 37.1pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>序号</span></b><b
								style='mso-bidi-font-weight: normal'><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'><o:p></o:p></span></b>
						</p>
					</td>
					<td width=536 colspan=6
						style='width: 402.35pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.4pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>检测项目<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 1; height: 11.95pt'>
					<td width=102
						style='width: 76.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 11.95pt'>
						<p class=MsoNormal align=center
							style='margin-left: -.1pt; mso-para-margin-left: -.01gd; text-align: center; text-indent: .1pt; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>防水耐污性<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
					<td width=66
						style='width: 49.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 11.95pt'>
						<p class=MsoNormal align=center
							style='margin-left: -1.8pt; mso-para-margin-left: -.67gd; text-align: center; text-indent: -5.25pt; mso-char-indent-count: -.5; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>PH</span></b><b
								style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>值<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
					<td width=85
						style='width: 63.75pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 11.95pt'>
						<p class=MsoNormal align=center
							style='margin-left: -1.8pt; mso-para-margin-left: -.67gd; text-align: center; text-indent: -5.25pt; mso-char-indent-count: -.5; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>稳定性<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
					<td width=76
						style='width: 2.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 11.95pt'>
						<p class=MsoNormal align=center
							style='margin-left: -1.8pt; mso-para-margin-left: -.67gd; text-align: center; text-indent: -5.25pt; mso-char-indent-count: -.5; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>防酸碱性<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
					<td width=113
						style='width: 3.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 11.95pt'>
						<p class=MsoNormal align=center
							style='margin-left: -1.8pt; mso-para-margin-left: -.67gd; text-align: center; text-indent: -5.25pt; mso-char-indent-count: -.5; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>耐紫外线老化性<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
					<td width=95
						style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 11.95pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<b style='mso-bidi-font-weight: normal'><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>对饰面影响<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 2; height: 18.9pt'>
					<td width=49
						style='width: 37.1pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.9pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>1<o:p></o:p></span>
						</p>
					</td>
					<td width=102
						style='width: 76.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.9pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>70</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>～<span
								lang=EN-US>85%<o:p></o:p></span></span>
						</p>
					</td>
					<td width=66 rowspan=2
						style='width: 49.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.9pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>1</span><span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>～<span
								lang=EN-US>13<o:p></o:p></span></span>
						</p>
					</td>
					<td width=85 rowspan=2
						style='width: 63.75pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.9pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>无分层、漂油和沉淀<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=76 rowspan=2
						style='width: 2.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.9pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>40%<o:p></o:p></span></span>
						</p>
					</td>
					<td width=113 rowspan=2
						style='width: 3.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.9pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>40%<o:p></o:p></span></span>
						</p>
					</td>
					<td width=95 rowspan=2
						style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 18.9pt'>
						<p class=MsoNormal
							style='line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>保持石材原色不变<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 3; height: 21.75pt'>
					<td width=49
						style='width: 37.1pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.75pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt'>2<o:p></o:p></span>
						</p>
					</td>
					<td width=102
						style='width: 76.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 21.75pt'>
						<p class=MsoNormal align=center
							style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>≥<span
								lang=EN-US>85%<o:p></o:p></span></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 4; mso-yfti-lastrow: yes; height: 23.9pt'>
					<td width=586 colspan=7
						style='width: 439.45pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 23.9pt'>
						<p class=MsoNormal align=left
							style='text-align: left; line-height: 12.0pt; mso-line-height-rule: exactly'>
							<span
								style='mso-bidi-font-size: 10.5pt; font-family: "微软雅黑", "sans-serif"'>说明：<span
								lang=EN-US>1#</span>为一等品，<span lang=EN-US>2#</span>为优等品<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
				</tr>
			</table>

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