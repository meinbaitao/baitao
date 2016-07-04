<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<title>工程承包合同书</title>
<script type="text/javascript"
	src="${ctxStatic}/jquery-validation/1.11.1/lib/jquery-1.7.2.js"></script>
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
	font-family: Tahoma;
	panose-1: 2 11 6 4 3 5 4 4 2 4;
	mso-font-charset: 0;
	mso-generic-font-family: swiss;
	mso-font-pitch: variable;
	mso-font-signature: -520081665 -1073717157 41 0 66047 0;
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
	mso-style-priority: 99;
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
	mso-style-priority: 99;
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
	mso-style-priority: 99;
	mso-ansi-font-size: 10.5pt;
	mso-bidi-font-size: 10.5pt;
}

p.MsoBodyTextIndent, li.MsoBodyTextIndent, div.MsoBodyTextIndent {
	mso-style-unhide: no;
	margin: 0cm;
	margin-bottom: .0001pt;
	text-align: justify;
	text-justify: inter-ideograph;
	text-indent: 26.9pt;
	mso-char-indent-count: 1.92;
	mso-pagination: none;
	font-size: 14.0pt;
	mso-bidi-font-size: 10.0pt;
	font-family: "Times New Roman", "serif";
	mso-fareast-font-family: 宋体;
	mso-font-kerning: 1.0pt;
}

p.MsoBodyTextIndent2, li.MsoBodyTextIndent2, div.MsoBodyTextIndent2 {
	mso-style-unhide: no;
	margin-top: 0cm;
	margin-right: 0cm;
	margin-bottom: 0cm;
	margin-left: 17.95pt;
	margin-bottom: .0001pt;
	mso-para-margin-top: 0cm;
	mso-para-margin-right: 0cm;
	mso-para-margin-bottom: 0cm;
	mso-para-margin-left: 1.64gd;
	mso-para-margin-bottom: .0001pt;
	text-align: justify;
	text-justify: inter-ideograph;
	text-indent: -.75pt;
	mso-char-indent-count: -.05;
	line-height: 22.0pt;
	mso-pagination: none;
	font-size: 15.0pt;
	mso-bidi-font-size: 12.0pt;
	font-family: 宋体;
	mso-bidi-font-family: "Times New Roman";
	mso-font-kerning: 1.0pt;
	font-weight: bold;
}

p {
	mso-style-priority: 99;
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
	mso-style-priority: 99;
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

p.MsoNoSpacing, li.MsoNoSpacing, div.MsoNoSpacing {
	mso-style-priority: 1;
	mso-style-unhide: no;
	mso-style-qformat: yes;
	mso-style-parent: "";
	mso-style-link: "无间隔 Char";
	margin: 0cm;
	margin-bottom: .0001pt;
	mso-pagination: widow-orphan;
	font-size: 11.0pt;
	font-family: "Calibri", "sans-serif";
	mso-ascii-font-family: Calibri;
	mso-ascii-theme-font: minor-latin;
	mso-fareast-font-family: 宋体;
	mso-fareast-theme-font: minor-fareast;
	mso-hansi-font-family: Calibri;
	mso-hansi-theme-font: minor-latin;
	mso-bidi-font-family: "Times New Roman";
	mso-bidi-theme-font: minor-bidi;
}

p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph {
	mso-style-priority: 34;
	mso-style-unhide: no;
	mso-style-qformat: yes;
	margin-top: 0cm;
	margin-right: 0cm;
	margin-bottom: 10.0pt;
	margin-left: 0cm;
	text-indent: 21.0pt;
	mso-char-indent-count: 2.0;
	mso-pagination: widow-orphan;
	layout-grid-mode: char;
	mso-layout-grid-align: none;
	font-size: 11.0pt;
	font-family: "Tahoma", "sans-serif";
	mso-fareast-font-family: 微软雅黑;
	mso-bidi-font-family: "Times New Roman";
}

span.Char {
	mso-style-name: "批注主题 Char";
	mso-style-unhide: no;
	mso-style-locked: yes;
	mso-style-parent: "批注文字 Char";
	mso-style-link: 批注主题;
	mso-ansi-font-size: 10.5pt;
	mso-bidi-font-size: 12.0pt;
	mso-font-kerning: 1.0pt;
}

span.Char0 {
	mso-style-name: "批注文字 Char";
	mso-style-priority: 99;
	mso-style-unhide: no;
	mso-style-locked: yes;
	mso-style-link: 批注文字;
	mso-ansi-font-size: 10.5pt;
	mso-bidi-font-size: 12.0pt;
	mso-font-kerning: 1.0pt;
}

p.1, li.1, div.1 {
	mso-style-name: 列出段落1;
	mso-style-priority: 34;
	mso-style-unhide: no;
	mso-style-qformat: yes;
	margin-top: 0cm;
	margin-right: 0cm;
	margin-bottom: 10.0pt;
	margin-left: 0cm;
	text-indent: 21.0pt;
	mso-char-indent-count: 2.0;
	mso-line-height-alt: 1.0pt;
	mso-pagination: widow-orphan;
	layout-grid-mode: char;
	mso-layout-grid-align: none;
	font-size: 11.0pt;
	font-family: "Tahoma", "sans-serif";
	mso-fareast-font-family: 微软雅黑;
	mso-bidi-font-family: "Times New Roman";
}

span.Char1 {
	mso-style-name: "无间隔 Char";
	mso-style-priority: 1;
	mso-style-unhide: no;
	mso-style-locked: yes;
	mso-style-link: 无间隔;
	mso-ansi-font-size: 11.0pt;
	mso-bidi-font-size: 11.0pt;
	font-family: "Calibri", "sans-serif";
	mso-ascii-font-family: Calibri;
	mso-ascii-theme-font: minor-latin;
	mso-fareast-font-family: 宋体;
	mso-fareast-theme-font: minor-fareast;
	mso-hansi-font-family: Calibri;
	mso-hansi-theme-font: minor-latin;
	mso-bidi-font-family: "Times New Roman";
	mso-bidi-theme-font: minor-bidi;
}

span.Char2 {
	mso-style-name: "页眉 Char";
	mso-style-priority: 99;
	mso-style-unhide: no;
	mso-style-locked: yes;
	mso-style-link: 页眉;
	mso-ansi-font-size: 9.0pt;
	mso-bidi-font-size: 9.0pt;
	mso-font-kerning: 1.0pt;
}

span.Char3 {
	mso-style-name: "页脚 Char";
	mso-style-priority: 99;
	mso-style-unhide: no;
	mso-style-locked: yes;
	mso-style-link: 页脚;
	mso-ansi-font-size: 9.0pt;
	mso-bidi-font-size: 9.0pt;
	mso-font-kerning: 1.0pt;
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
	margin: 70.9pt 51.05pt 70.9pt 51.05pt;
	mso-header-margin: 22.7pt;
	mso-footer-margin: 40.25pt;
	mso-paper-source: 0;
	layout-grid: 15.6pt;
}

div.Section1 {
	page: Section1;
}
/* List Definitions */
@
list l0 {
	mso-list-id: 10;
	mso-list-template-ids: -1790569466;
}

@
list l0:level1 {
	mso-level-number-format: japanese-counting;
	mso-level-text: %1、;
	mso-level-tab-stop: 21.0pt;
	mso-level-number-position: left;
	margin-left: 21.0pt;
	text-indent: -21.0pt;
	mso-ansi-font-size: 12.0pt;
	mso-bidi-font-size: 12.0pt;
	mso-ansi-language: EN-US;
	mso-ansi-font-weight: bold;
}

@
list l0:level2 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%2\)";
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 78.0pt;
	text-indent: -21.0pt;
}

@
list l0:level3 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: none;
	mso-level-number-position: right;
	margin-left: 99.0pt;
	text-indent: -21.0pt;
}

@
list l0:level4 {
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 120.0pt;
	text-indent: -21.0pt;
}

@
list l0:level5 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%5\)";
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 141.0pt;
	text-indent: -21.0pt;
}

@
list l0:level6 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: none;
	mso-level-number-position: right;
	margin-left: 162.0pt;
	text-indent: -21.0pt;
}

@
list l0:level7 {
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 183.0pt;
	text-indent: -21.0pt;
}

@
list l0:level8 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%8\)";
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 204.0pt;
	text-indent: -21.0pt;
}

@
list l0:level9 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: none;
	mso-level-number-position: right;
	margin-left: 225.0pt;
	text-indent: -21.0pt;
}

@
list l1 {
	mso-list-id: 11;
	mso-list-template-ids: 11;
}

@
list l1:level1 {
	mso-level-text: "%1\)";
	mso-level-tab-stop: 63.55pt;
	mso-level-number-position: left;
	margin-left: 63.55pt;
	text-indent: -21.0pt;
}

@
list l1:level2 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%2\)";
	mso-level-tab-stop: 84.55pt;
	mso-level-number-position: left;
	margin-left: 84.55pt;
	text-indent: -21.0pt;
}

@
list l1:level3 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 105.55pt;
	mso-level-number-position: right;
	margin-left: 105.55pt;
	text-indent: -21.0pt;
}

@
list l1:level4 {
	mso-level-tab-stop: 126.55pt;
	mso-level-number-position: left;
	margin-left: 126.55pt;
	text-indent: -21.0pt;
}

@
list l1:level5 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%5\)";
	mso-level-tab-stop: 147.55pt;
	mso-level-number-position: left;
	margin-left: 147.55pt;
	text-indent: -21.0pt;
}

@
list l1:level6 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 168.55pt;
	mso-level-number-position: right;
	margin-left: 168.55pt;
	text-indent: -21.0pt;
}

@
list l1:level7 {
	mso-level-tab-stop: 189.55pt;
	mso-level-number-position: left;
	margin-left: 189.55pt;
	text-indent: -21.0pt;
}

@
list l1:level8 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%8\)";
	mso-level-tab-stop: 210.55pt;
	mso-level-number-position: left;
	margin-left: 210.55pt;
	text-indent: -21.0pt;
}

@
list l1:level9 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 231.55pt;
	mso-level-number-position: right;
	margin-left: 231.55pt;
	text-indent: -21.0pt;
}

@
list l2 {
	mso-list-id: 12;
	mso-list-template-ids: 12;
}

@
list l2:level1 {
	mso-level-text: "%1\)";
	mso-level-tab-stop: 56.45pt;
	mso-level-number-position: left;
	margin-left: 56.45pt;
	text-indent: -21.0pt;
}

@
list l2:level2 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%2\)";
	mso-level-tab-stop: 77.45pt;
	mso-level-number-position: left;
	margin-left: 77.45pt;
	text-indent: -21.0pt;
}

@
list l2:level3 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 98.45pt;
	mso-level-number-position: right;
	margin-left: 98.45pt;
	text-indent: -21.0pt;
}

@
list l2:level4 {
	mso-level-tab-stop: 119.45pt;
	mso-level-number-position: left;
	margin-left: 119.45pt;
	text-indent: -21.0pt;
}

@
list l2:level5 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%5\)";
	mso-level-tab-stop: 140.45pt;
	mso-level-number-position: left;
	margin-left: 140.45pt;
	text-indent: -21.0pt;
}

@
list l2:level6 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 161.45pt;
	mso-level-number-position: right;
	margin-left: 161.45pt;
	text-indent: -21.0pt;
}

@
list l2:level7 {
	mso-level-tab-stop: 182.45pt;
	mso-level-number-position: left;
	margin-left: 182.45pt;
	text-indent: -21.0pt;
}

@
list l2:level8 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%8\)";
	mso-level-tab-stop: 203.45pt;
	mso-level-number-position: left;
	margin-left: 203.45pt;
	text-indent: -21.0pt;
}

@
list l2:level9 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 224.45pt;
	mso-level-number-position: right;
	margin-left: 224.45pt;
	text-indent: -21.0pt;
}

@
list l3 {
	mso-list-id: 13;
	mso-list-template-ids: 13;
}

@
list l3:level1 {
	mso-level-text: "%1\)";
	mso-level-tab-stop: 56.45pt;
	mso-level-number-position: left;
	margin-left: 56.45pt;
	text-indent: -21.0pt;
}

@
list l3:level2 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%2\)";
	mso-level-tab-stop: 49.4pt;
	mso-level-number-position: left;
	margin-left: 49.4pt;
	text-indent: -21.0pt;
}

@
list l3:level3 {
	mso-level-text: "%3\)";
	mso-level-tab-stop: 63.55pt;
	mso-level-number-position: left;
	margin-left: 63.55pt;
	text-indent: -21.0pt;
	mso-ansi-font-weight: normal;
}

@
list l3:level4 {
	mso-level-text: "%4\)";
	mso-level-tab-stop: 119.45pt;
	mso-level-number-position: left;
	margin-left: 119.45pt;
	text-indent: -21.0pt;
}

@
list l3:level5 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%5\)";
	mso-level-tab-stop: 140.45pt;
	mso-level-number-position: left;
	margin-left: 140.45pt;
	text-indent: -21.0pt;
}

@
list l3:level6 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 161.45pt;
	mso-level-number-position: right;
	margin-left: 161.45pt;
	text-indent: -21.0pt;
}

@
list l3:level7 {
	mso-level-tab-stop: 182.45pt;
	mso-level-number-position: left;
	margin-left: 182.45pt;
	text-indent: -21.0pt;
}

@
list l3:level8 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%8\)";
	mso-level-tab-stop: 203.45pt;
	mso-level-number-position: left;
	margin-left: 203.45pt;
	text-indent: -21.0pt;
}

@
list l3:level9 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 224.45pt;
	mso-level-number-position: right;
	margin-left: 224.45pt;
	text-indent: -21.0pt;
}

@
list l4 {
	mso-list-id: 14;
	mso-list-template-ids: 14;
}

@
list l4:level1 {
	mso-level-text: "%1\)";
	mso-level-tab-stop: 56.45pt;
	mso-level-number-position: left;
	margin-left: 56.45pt;
	text-indent: -21.0pt;
}

@
list l4:level2 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%2\)";
	mso-level-tab-stop: 80.15pt;
	mso-level-number-position: left;
	margin-left: 80.15pt;
	text-indent: -21.0pt;
}

@
list l4:level3 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 101.15pt;
	mso-level-number-position: right;
	margin-left: 101.15pt;
	text-indent: -21.0pt;
}

@
list l4:level4 {
	mso-level-tab-stop: 122.15pt;
	mso-level-number-position: left;
	margin-left: 122.15pt;
	text-indent: -21.0pt;
}

@
list l4:level5 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%5\)";
	mso-level-tab-stop: 143.15pt;
	mso-level-number-position: left;
	margin-left: 143.15pt;
	text-indent: -21.0pt;
}

@
list l4:level6 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 164.15pt;
	mso-level-number-position: right;
	margin-left: 164.15pt;
	text-indent: -21.0pt;
}

@
list l4:level7 {
	mso-level-tab-stop: 185.15pt;
	mso-level-number-position: left;
	margin-left: 185.15pt;
	text-indent: -21.0pt;
}

@
list l4:level8 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%8\)";
	mso-level-tab-stop: 206.15pt;
	mso-level-number-position: left;
	margin-left: 206.15pt;
	text-indent: -21.0pt;
}

@
list l4:level9 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 227.15pt;
	mso-level-number-position: right;
	margin-left: 227.15pt;
	text-indent: -21.0pt;
}

@
list l5 {
	mso-list-id: 15;
	mso-list-template-ids: 15;
}

@
list l5:level1 {
	mso-level-text: "%1\)";
	mso-level-tab-stop: 63.55pt;
	mso-level-number-position: left;
	margin-left: 63.55pt;
	text-indent: -21.0pt;
}

@
list l5:level2 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%2\)";
	mso-level-tab-stop: 84.55pt;
	mso-level-number-position: left;
	margin-left: 84.55pt;
	text-indent: -21.0pt;
}

@
list l5:level3 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 105.55pt;
	mso-level-number-position: right;
	margin-left: 105.55pt;
	text-indent: -21.0pt;
}

@
list l5:level4 {
	mso-level-tab-stop: 126.55pt;
	mso-level-number-position: left;
	margin-left: 126.55pt;
	text-indent: -21.0pt;
}

@
list l5:level5 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%5\)";
	mso-level-tab-stop: 147.55pt;
	mso-level-number-position: left;
	margin-left: 147.55pt;
	text-indent: -21.0pt;
}

@
list l5:level6 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 168.55pt;
	mso-level-number-position: right;
	margin-left: 168.55pt;
	text-indent: -21.0pt;
}

@
list l5:level7 {
	mso-level-tab-stop: 189.55pt;
	mso-level-number-position: left;
	margin-left: 189.55pt;
	text-indent: -21.0pt;
}

@
list l5:level8 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%8\)";
	mso-level-tab-stop: 210.55pt;
	mso-level-number-position: left;
	margin-left: 210.55pt;
	text-indent: -21.0pt;
}

@
list l5:level9 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 231.55pt;
	mso-level-number-position: right;
	margin-left: 231.55pt;
	text-indent: -21.0pt;
}

@
list l6 {
	mso-list-id: 16;
	mso-list-type: simple;
	mso-list-template-ids: 16;
}

@
list l6:level1 {
	mso-level-start-at: 9;
	mso-level-number-format: japanese-counting;
	mso-level-text: %1、;
	mso-level-tab-stop: 21.0pt;
	mso-level-number-position: left;
	margin-left: 21.0pt;
	text-indent: -21.0pt;
	mso-ansi-language: EN-US;
	mso-ansi-font-weight: bold;
}

@
list l7 {
	mso-list-id: 17;
	mso-list-template-ids: 17;
}

@
list l7:level1 {
	mso-level-text: "%1\)";
	mso-level-tab-stop: 56.5pt;
	mso-level-number-position: left;
	margin-left: 56.5pt;
	text-indent: -21.0pt;
}

@
list l7:level2 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%2\)";
	mso-level-tab-stop: 77.5pt;
	mso-level-number-position: left;
	margin-left: 77.5pt;
	text-indent: -21.0pt;
}

@
list l7:level3 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 98.5pt;
	mso-level-number-position: right;
	margin-left: 98.5pt;
	text-indent: -21.0pt;
}

@
list l7:level4 {
	mso-level-tab-stop: 119.5pt;
	mso-level-number-position: left;
	margin-left: 119.5pt;
	text-indent: -21.0pt;
}

@
list l7:level5 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%5\)";
	mso-level-tab-stop: 140.5pt;
	mso-level-number-position: left;
	margin-left: 140.5pt;
	text-indent: -21.0pt;
}

@
list l7:level6 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 161.5pt;
	mso-level-number-position: right;
	margin-left: 161.5pt;
	text-indent: -21.0pt;
}

@
list l7:level7 {
	mso-level-tab-stop: 182.5pt;
	mso-level-number-position: left;
	margin-left: 182.5pt;
	text-indent: -21.0pt;
}

@
list l7:level8 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%8\)";
	mso-level-tab-stop: 203.5pt;
	mso-level-number-position: left;
	margin-left: 203.5pt;
	text-indent: -21.0pt;
}

@
list l7:level9 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 224.5pt;
	mso-level-number-position: right;
	margin-left: 224.5pt;
	text-indent: -21.0pt;
}

@
list l8 {
	mso-list-id: 331764792;
	mso-list-template-ids: 12;
}

@
list l8:level1 {
	mso-level-text: "%1\)";
	mso-level-tab-stop: 56.45pt;
	mso-level-number-position: left;
	margin-left: 56.45pt;
	text-indent: -21.0pt;
}

@
list l8:level2 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%2\)";
	mso-level-tab-stop: 77.45pt;
	mso-level-number-position: left;
	margin-left: 77.45pt;
	text-indent: -21.0pt;
}

@
list l8:level3 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 98.45pt;
	mso-level-number-position: right;
	margin-left: 98.45pt;
	text-indent: -21.0pt;
}

@
list l8:level4 {
	mso-level-tab-stop: 119.45pt;
	mso-level-number-position: left;
	margin-left: 119.45pt;
	text-indent: -21.0pt;
}

@
list l8:level5 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%5\)";
	mso-level-tab-stop: 140.45pt;
	mso-level-number-position: left;
	margin-left: 140.45pt;
	text-indent: -21.0pt;
}

@
list l8:level6 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 161.45pt;
	mso-level-number-position: right;
	margin-left: 161.45pt;
	text-indent: -21.0pt;
}

@
list l8:level7 {
	mso-level-tab-stop: 182.45pt;
	mso-level-number-position: left;
	margin-left: 182.45pt;
	text-indent: -21.0pt;
}

@
list l8:level8 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%8\)";
	mso-level-tab-stop: 203.45pt;
	mso-level-number-position: left;
	margin-left: 203.45pt;
	text-indent: -21.0pt;
}

@
list l8:level9 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 224.45pt;
	mso-level-number-position: right;
	margin-left: 224.45pt;
	text-indent: -21.0pt;
}

@
list l9 {
	mso-list-id: 388456048;
	mso-list-type: hybrid;
	mso-list-template-ids: -1411357722 344851882 67698713 67698715 67698703
		67698713 67698715 67698703 67698713 67698715;
}

@
list l9:level1 {
	mso-level-start-at: 2;
	mso-level-number-format: alpha-lower;
	mso-level-text: %1、;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 81.25pt;
	text-indent: -18.0pt;
}

@
list l10 {
	mso-list-id: 684673908;
	mso-list-template-ids: 12;
}

@
list l10:level1 {
	mso-level-text: "%1\)";
	mso-level-tab-stop: 56.45pt;
	mso-level-number-position: left;
	margin-left: 56.45pt;
	text-indent: -21.0pt;
}

@
list l10:level2 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%2\)";
	mso-level-tab-stop: 77.45pt;
	mso-level-number-position: left;
	margin-left: 77.45pt;
	text-indent: -21.0pt;
}

@
list l10:level3 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 98.45pt;
	mso-level-number-position: right;
	margin-left: 98.45pt;
	text-indent: -21.0pt;
}

@
list l10:level4 {
	mso-level-tab-stop: 119.45pt;
	mso-level-number-position: left;
	margin-left: 119.45pt;
	text-indent: -21.0pt;
}

@
list l10:level5 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%5\)";
	mso-level-tab-stop: 140.45pt;
	mso-level-number-position: left;
	margin-left: 140.45pt;
	text-indent: -21.0pt;
}

@
list l10:level6 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 161.45pt;
	mso-level-number-position: right;
	margin-left: 161.45pt;
	text-indent: -21.0pt;
}

@
list l10:level7 {
	mso-level-tab-stop: 182.45pt;
	mso-level-number-position: left;
	margin-left: 182.45pt;
	text-indent: -21.0pt;
}

@
list l10:level8 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%8\)";
	mso-level-tab-stop: 203.45pt;
	mso-level-number-position: left;
	margin-left: 203.45pt;
	text-indent: -21.0pt;
}

@
list l10:level9 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 224.45pt;
	mso-level-number-position: right;
	margin-left: 224.45pt;
	text-indent: -21.0pt;
}

@
list l11 {
	mso-list-id: 801918855;
	mso-list-template-ids: 12;
}

@
list l11:level1 {
	mso-level-text: "%1\)";
	mso-level-tab-stop: 56.45pt;
	mso-level-number-position: left;
	margin-left: 56.45pt;
	text-indent: -21.0pt;
}

@
list l11:level2 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%2\)";
	mso-level-tab-stop: 77.45pt;
	mso-level-number-position: left;
	margin-left: 77.45pt;
	text-indent: -21.0pt;
}

@
list l11:level3 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 98.45pt;
	mso-level-number-position: right;
	margin-left: 98.45pt;
	text-indent: -21.0pt;
}

@
list l11:level4 {
	mso-level-tab-stop: 119.45pt;
	mso-level-number-position: left;
	margin-left: 119.45pt;
	text-indent: -21.0pt;
}

@
list l11:level5 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%5\)";
	mso-level-tab-stop: 140.45pt;
	mso-level-number-position: left;
	margin-left: 140.45pt;
	text-indent: -21.0pt;
}

@
list l11:level6 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 161.45pt;
	mso-level-number-position: right;
	margin-left: 161.45pt;
	text-indent: -21.0pt;
}

@
list l11:level7 {
	mso-level-tab-stop: 182.45pt;
	mso-level-number-position: left;
	margin-left: 182.45pt;
	text-indent: -21.0pt;
}

@
list l11:level8 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%8\)";
	mso-level-tab-stop: 203.45pt;
	mso-level-number-position: left;
	margin-left: 203.45pt;
	text-indent: -21.0pt;
}

@
list l11:level9 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 224.45pt;
	mso-level-number-position: right;
	margin-left: 224.45pt;
	text-indent: -21.0pt;
}

@
list l12 {
	mso-list-id: 985354522;
	mso-list-template-ids: 985354522;
}

@
list l12:level1 {
	mso-level-number-format: alpha-lower;
	mso-level-text: %1、;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 60.3pt;
	text-indent: -18.0pt;
}

@
list l12:level2 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%2\)";
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 84.3pt;
	text-indent: -21.0pt;
}

@
list l12:level3 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: none;
	mso-level-number-position: right;
	margin-left: 105.3pt;
	text-indent: -21.0pt;
}

@
list l12:level4 {
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 126.3pt;
	text-indent: -21.0pt;
}

@
list l12:level5 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%5\)";
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 147.3pt;
	text-indent: -21.0pt;
}

@
list l12:level6 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: none;
	mso-level-number-position: right;
	margin-left: 168.3pt;
	text-indent: -21.0pt;
}

@
list l12:level7 {
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 189.3pt;
	text-indent: -21.0pt;
}

@
list l12:level8 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%8\)";
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 210.3pt;
	text-indent: -21.0pt;
}

@
list l12:level9 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: none;
	mso-level-number-position: right;
	margin-left: 231.3pt;
	text-indent: -21.0pt;
}

@
list l13 {
	mso-list-id: 1032993340;
	mso-list-template-ids: 1032993340;
}

@
list l13:level1 {
	mso-level-text: "%1\)";
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 59.15pt;
	text-indent: -23.25pt;
	color: #C00000;
}

@
list l13:level2 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%2\)";
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 77.9pt;
	text-indent: -21.0pt;
}

@
list l13:level3 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: none;
	mso-level-number-position: right;
	margin-left: 98.9pt;
	text-indent: -21.0pt;
}

@
list l13:level4 {
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 119.9pt;
	text-indent: -21.0pt;
}

@
list l13:level5 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%5\)";
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 140.9pt;
	text-indent: -21.0pt;
}

@
list l13:level6 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: none;
	mso-level-number-position: right;
	margin-left: 161.9pt;
	text-indent: -21.0pt;
}

@
list l13:level7 {
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 182.9pt;
	text-indent: -21.0pt;
}

@
list l13:level8 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%8\)";
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 203.9pt;
	text-indent: -21.0pt;
}

@
list l13:level9 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: none;
	mso-level-number-position: right;
	margin-left: 224.9pt;
	text-indent: -21.0pt;
}

@
list l14 {
	mso-list-id: 1263101833;
	mso-list-template-ids: 12;
}

@
list l14:level1 {
	mso-level-text: "%1\)";
	mso-level-tab-stop: 56.45pt;
	mso-level-number-position: left;
	margin-left: 56.45pt;
	text-indent: -21.0pt;
}

@
list l14:level2 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%2\)";
	mso-level-tab-stop: 77.45pt;
	mso-level-number-position: left;
	margin-left: 77.45pt;
	text-indent: -21.0pt;
}

@
list l14:level3 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 98.45pt;
	mso-level-number-position: right;
	margin-left: 98.45pt;
	text-indent: -21.0pt;
}

@
list l14:level4 {
	mso-level-tab-stop: 119.45pt;
	mso-level-number-position: left;
	margin-left: 119.45pt;
	text-indent: -21.0pt;
}

@
list l14:level5 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%5\)";
	mso-level-tab-stop: 140.45pt;
	mso-level-number-position: left;
	margin-left: 140.45pt;
	text-indent: -21.0pt;
}

@
list l14:level6 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 161.45pt;
	mso-level-number-position: right;
	margin-left: 161.45pt;
	text-indent: -21.0pt;
}

@
list l14:level7 {
	mso-level-tab-stop: 182.45pt;
	mso-level-number-position: left;
	margin-left: 182.45pt;
	text-indent: -21.0pt;
}

@
list l14:level8 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%8\)";
	mso-level-tab-stop: 203.45pt;
	mso-level-number-position: left;
	margin-left: 203.45pt;
	text-indent: -21.0pt;
}

@
list l14:level9 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 224.45pt;
	mso-level-number-position: right;
	margin-left: 224.45pt;
	text-indent: -21.0pt;
}

@
list l15 {
	mso-list-id: 1573083195;
	mso-list-template-ids: 12;
}

@
list l15:level1 {
	mso-level-text: "%1\)";
	mso-level-tab-stop: 56.45pt;
	mso-level-number-position: left;
	margin-left: 56.45pt;
	text-indent: -21.0pt;
}

@
list l15:level2 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%2\)";
	mso-level-tab-stop: 77.45pt;
	mso-level-number-position: left;
	margin-left: 77.45pt;
	text-indent: -21.0pt;
}

@
list l15:level3 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 98.45pt;
	mso-level-number-position: right;
	margin-left: 98.45pt;
	text-indent: -21.0pt;
}

@
list l15:level4 {
	mso-level-tab-stop: 119.45pt;
	mso-level-number-position: left;
	margin-left: 119.45pt;
	text-indent: -21.0pt;
}

@
list l15:level5 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%5\)";
	mso-level-tab-stop: 140.45pt;
	mso-level-number-position: left;
	margin-left: 140.45pt;
	text-indent: -21.0pt;
}

@
list l15:level6 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 161.45pt;
	mso-level-number-position: right;
	margin-left: 161.45pt;
	text-indent: -21.0pt;
}

@
list l15:level7 {
	mso-level-tab-stop: 182.45pt;
	mso-level-number-position: left;
	margin-left: 182.45pt;
	text-indent: -21.0pt;
}

@
list l15:level8 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%8\)";
	mso-level-tab-stop: 203.45pt;
	mso-level-number-position: left;
	margin-left: 203.45pt;
	text-indent: -21.0pt;
}

@
list l15:level9 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 224.45pt;
	mso-level-number-position: right;
	margin-left: 224.45pt;
	text-indent: -21.0pt;
}

@
list l16 {
	mso-list-id: 1704133957;
	mso-list-template-ids: 12;
}

@
list l16:level1 {
	mso-level-text: "%1\)";
	mso-level-tab-stop: 56.45pt;
	mso-level-number-position: left;
	margin-left: 56.45pt;
	text-indent: -21.0pt;
}

@
list l16:level2 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%2\)";
	mso-level-tab-stop: 77.45pt;
	mso-level-number-position: left;
	margin-left: 77.45pt;
	text-indent: -21.0pt;
}

@
list l16:level3 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 98.45pt;
	mso-level-number-position: right;
	margin-left: 98.45pt;
	text-indent: -21.0pt;
}

@
list l16:level4 {
	mso-level-tab-stop: 119.45pt;
	mso-level-number-position: left;
	margin-left: 119.45pt;
	text-indent: -21.0pt;
}

@
list l16:level5 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%5\)";
	mso-level-tab-stop: 140.45pt;
	mso-level-number-position: left;
	margin-left: 140.45pt;
	text-indent: -21.0pt;
}

@
list l16:level6 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 161.45pt;
	mso-level-number-position: right;
	margin-left: 161.45pt;
	text-indent: -21.0pt;
}

@
list l16:level7 {
	mso-level-tab-stop: 182.45pt;
	mso-level-number-position: left;
	margin-left: 182.45pt;
	text-indent: -21.0pt;
}

@
list l16:level8 {
	mso-level-number-format: alpha-lower;
	mso-level-text: "%8\)";
	mso-level-tab-stop: 203.45pt;
	mso-level-number-position: left;
	margin-left: 203.45pt;
	text-indent: -21.0pt;
}

@
list l16:level9 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: 224.45pt;
	mso-level-number-position: right;
	margin-left: 224.45pt;
	text-indent: -21.0pt;
}

@
list l17 {
	mso-list-id: 2020430114;
	mso-list-type: hybrid;
	mso-list-template-ids: -1834818326 1163294022 67698713 67698715 67698703
		67698713 67698715 67698703 67698713 67698715;
}

@
list l17:level1 {
	mso-level-start-at: 3;
	mso-level-number-format: alpha-lower;
	mso-level-text: %1、;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 81.25pt;
	text-indent: -18.0pt;
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
	width: 305px;
}

.input_date {
	border-right: #eff0f4 0px solid;
	border-top: #eff0f4 0px solid;
	border-left: #eff0f4 0px solid;
	border-bottom: #000000 1px solid;
	background-color: #eff0f4;
	line-height: 115%;
	font-family: "微软雅黑", "sans-serif";
	width: 120px;
	text-align: center;
}

.input_choose {
	border-right: #000000 1px solid;
	border-top: #000000 1px solid;
	border-left: #000000 1px solid;
	border-bottom: #000000 1px solid;
	background-color: #eff0f4;
	line-height: 115%;
	font-family: "微软雅黑", "sans-serif";
	width: 25px;
	text-align: center;
}

.input_text {
	border-right: #eff0f4 0px solid;
	border-top: #eff0f4 0px solid;
	border-left: #eff0f4 0px solid;
	border-bottom: #000000 1px solid;
	background-color: #eff0f4;
	line-height: 115%;
	font-family: "微软雅黑", "sans-serif";
	width: 60px;
	text-align: center;
}

.input_text2 {
	border-right: #eff0f4 0px solid;
	border-top: #eff0f4 0px solid;
	border-left: #eff0f4 0px solid;
	border-bottom: #000000 1px solid;
	background-color: #eff0f4;
	line-height: 115%;
	font-family: "微软雅黑", "sans-serif";
	width: 150px;
	text-align: left;
}

.input_contractNo {
	border-right: #eff0f4 0px solid;
	border-top: #eff0f4 0px solid;
	border-left: #eff0f4 0px solid;
	border-bottom: #000000 1px solid;
	background-color: #eff0f4;
	line-height: 115%;
	font-family: "微软雅黑", "sans-serif";
	width: 400px;
	text-align: left;
}

.input_contractNoHome {
	border-right: #eff0f4 0px solid;
	border-top: #eff0f4 0px solid;
	border-left: #eff0f4 0px solid;
	border-bottom: #000000 1px solid;
	background-color: #eff0f4;
	line-height: 115%;
	font-family: "微软雅黑", "sans-serif";
	width: 350px;
	text-align: left;
	font-size: 12.0pt;
	font-weight: bold;
}

.input_rmb {
	border-right: #eff0f4 0px solid;
	border-top: #eff0f4 0px solid;
	border-left: #eff0f4 0px solid;
	border-bottom: #000000 1px solid;
	background-color: #eff0f4;
	line-height: 115%;
	font-family: "微软雅黑", "sans-serif";
	width: 110px;
	readonly: true;
	text-align: left;
	font-weight: bold;
}

.input_mail {
	border-right: #eff0f4 0px solid;
	border-top: #eff0f4 0px solid;
	border-left: #eff0f4 0px solid;
	border-bottom: #000000 1px solid;
	background-color: #eff0f4;
	line-height: 115%;
	font-family: "微软雅黑", "sans-serif";
	width: 180px;
	text-align: center;
}

.selectIn {
	width: 200px;
	line-height: 115%;
	font-family: "微软雅黑", "sans-serif";
	text-align: center;
	background-color: EFF0F4;
	border: 1px solid EFF0F4;
}

#print_div {
	position: fixed;
	top: 30px;
	right: 5px;
	display: inline;
}
-->
</style>


<script type="text/javascript">
	$(function() {
		for (var i = 1; i < 11; i++) {
			$("<img/>").attr('src', "${ctxStatic}/img/waterprint.png").css({
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
		var head = "<html><head><title></title></head><body>";
		var footstr = "</body></html>";
		var printData = document.getElementById("div_print").innerHTML;
		var oldstr = document.body.innerHTML;
		document.body.innerHTML = head + printData + footstr;
		window.print();

		document.body.innerHTML = oldstr;

		//var imgArea = document.getElementById("imgArea");
		//imgArea.removeChild(imgArea.lastChild);

		return false;
	}
</script>

</head>

<div id="print_div">
	<input name="b_print" type="button" id="iprint" onclick="printHtml()"
		value=" 打印 " /> <input name="iback" type="button" id="iback"
		onclick="back()" value=" 返回 " />
</div>

<div id="div_print">

	<body lang=ZH-CN
		style='tab-interval: 15.75pt; text-justify-trim: punctuation'>
		<span id="imgArea"></span>
		<div class=Section1 style='layout-grid: 15.6pt'>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 118.15pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 22.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 118.15pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 22.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 118.15pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span
					style='font-size: 22.0pt; mso-bidi-font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'>石材幕墙工程安装劳务合同<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'>
						<span lang=EN-US><span style='mso-spacerun: yes'>&nbsp;&nbsp;
						</span> <o:p></o:p></span>
				</span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'>
						<span lang=EN-US><span style='mso-spacerun: yes'>&nbsp;&nbsp;
						</span> <o:p></o:p></span>
				</span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 85.9pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 16.0pt; mso-bidi-font-size: 14.0pt; font-family: "微软雅黑", "sans-serif"'><span
						style='mso-spacerun: yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></b><b style='mso-bidi-font-weight: normal'><span
					style='font-size: 16.0pt; mso-bidi-font-size: 14.0pt; font-family: "微软雅黑", "sans-serif"'>合同编号：<span
						lang=EN-US><input readonly="readonly"
							value="${laborcontract.contractNo}" type="text"
							class="input_contractNoHome" /> <o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 85.9pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 16.0pt; mso-bidi-font-size: 14.0pt; font-family: "微软雅黑", "sans-serif"'><span
						style='mso-spacerun: yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></b><b style='mso-bidi-font-weight: normal'><span
					style='font-size: 16.0pt; mso-bidi-font-size: 14.0pt; font-family: "微软雅黑", "sans-serif"'>甲方：<span
						lang=EN-US><input readonly="readonly"
							value="${laborcontract.contractJiafang}" type="text"
							class="input_home" /> <o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 85.9pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 16.0pt; mso-bidi-font-size: 14.0pt; font-family: "微软雅黑", "sans-serif"'><span
						style='mso-spacerun: yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></b><b style='mso-bidi-font-weight: normal'><span
					style='font-size: 16.0pt; mso-bidi-font-size: 14.0pt; font-family: "微软雅黑", "sans-serif"'>乙方：
						<span lang=EN-US><input readonly="readonly"
							value="${laborcontract.executionName}" type="text"
							class="input_home" /><span style='mso-spacerun: yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</span> <o:p></o:p></span>
				</span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 85.9pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 16.0pt; mso-bidi-font-size: 14.0pt; font-family: "微软雅黑", "sans-serif"'><span
						style='mso-spacerun: yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</span><span style='mso-spacerun: yes'>&nbsp;</span></span></b><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 16.0pt; mso-bidi-font-size: 14.0pt; font-family: "微软雅黑", "sans-serif"'>乙方身份证号：
						<span lang=EN-US><input readonly="readonly"
							value="${execution.personNum}" type="text" class="input_home" />
							<o:p></o:p></span>
				</span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoNormal
				style='margin-right: 44.2pt; text-indent: 64.45pt; mso-char-indent-count: 5.37; word-break: break-all'>
				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span></b>
			</p>

			<p class=MsoBodyTextIndent
				style='margin-left: 21.0pt; text-indent: 21.1pt; line-height: 22.0pt; mso-line-height-rule: exactly'>
				<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲、乙双方根据平等、互利、诚信的原则，经双方友好协商，一致同意在确保工程质量、文明施工、安全生产、信守协议的前提下，并遵守国家相关法律法规及现行施工与验收规范，订立如下有关条款，双方共同遵守执行。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 0cm; text-indent: 26.9pt; line-height: 22.0pt; mso-list: l0 level1 lfo1; tab-stops: 0cm'>

				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif";'><span>一、<span
							style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</span></span></span></b> <b style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>工程名称：<input
						readonly="readonly" value="${laborcontract.proName}" type="text"
						class="input_home" /></span></span></b>
			</p>

			<p class=MsoNormal
				style='margin-left: 1.0cm; mso-para-margin-left: 2.7gd; text-indent: 26.85pt; mso-char-indent-count: 2.44; line-height: 22.0pt; mso-line-height-rule: exactly'>
				&nbsp;&nbsp; <b style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>工程地点：<input
						readonly="readonly" value="${laborcontract.address}" type="text"
						class="input_home" /></span></b>
			</p>

			<p class=MsoNormal
				style='margin-left: 27.95pt; mso-para-margin-left: 2.66gd; text-indent: 26.95pt; mso-char-indent-count: 2.45; line-height: 22.0pt; mso-line-height-rule: exactly'>
				&nbsp;&nbsp; <b style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>工期：</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-weight: bold'>计划</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>工程开工日期<input
					readonly="readonly" value="${laborcontract.startdate}" type="text"
					class="input_date" />，竣工日期为<input readonly="readonly"
					value="${laborcontract.completeDate}" type="text"
					class="input_date" />，总工期<input readonly="readonly"
					value="${laborcontract.duration}" type="text" class="input_text" />天。具体开工日期以<u>甲乙双方签署楼栋移交日期</u>为准
				</span><span
					style='font-size: 12.0pt; mso-bidi-font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"'>。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 0cm; text-indent: 26.9pt; line-height: 22.0pt; mso-list: l0 level1 lfo1; tab-stops: 0cm'>

				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif";'><span>二、<span
							style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</span></span></span></b> <b style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>施工内容及承包范围：<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='margin-left: 59.15pt; text-indent: -23.25pt; line-height: 22.0pt; mso-list: l13 level1 lfo2'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>1)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>施工内容（打√）：<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 59.15pt; line-height: 22.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>龙骨施工&nbsp;<input
						readonly="readonly"
						${(laborcontract.exetype eq '骨架班组')||(laborcontract.exetype eq '骨架+石材班组')?'value="√"':''}
						type="text" class="input_choose" />
				</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; position: relative; top: 2.0pt; mso-text-raise: -2.0pt'></span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'></span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>1</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-end'></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>测量放线；</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-begin'></span> </span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; position: relative; top: 2.0pt; mso-text-raise: -2.0pt'></span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'></span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>2</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-end'></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>埋件安装；</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-begin'></span> </span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; position: relative; top: 2.0pt; mso-text-raise: -2.0pt'></span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'></span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>3</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-end'></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>幕墙骨架的制作和安装；<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-top: 0cm; margin-right: -8.5pt; margin-bottom: 0cm; margin-left: 246.85pt; margin-bottom: .0001pt; mso-para-margin-top: 0cm; mso-para-margin-right: -.81gd; mso-para-margin-bottom: 0cm; mso-para-margin-left: 5.7gd; mso-para-margin-bottom: .0001pt; text-indent: -187.0pt; mso-char-indent-count: -17.0; line-height: 22.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>挂石施工&nbsp;<input
						readonly="readonly"
						${(laborcontract.exetype eq '石材班组')||(laborcontract.exetype eq '骨架+石材班组')?'value="√"':''}
						type="text" class="input_choose" /></span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; position: relative; top: 2.0pt; mso-text-raise: -2.0pt'></span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'></span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>1</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-end'></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>石材面材（面板、线条、雕花、圆柱等）的制作和安装；</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-begin'></span> </span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; position: relative; top: 2.0pt; mso-text-raise: -2.0pt'></span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'></span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>2</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-end'></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>打胶；<span
					lang=EN-US><o:p></o:p></span></span> <span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-begin'></span><span
					style='mso-spacerun: yes'>&nbsp;</span></span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; position: relative; top: 2.0pt; mso-text-raise: -2.0pt'></span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'></span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>3</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-end'></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>清洁；</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-begin'></span> </span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; position: relative; top: 2.0pt; mso-text-raise: -2.0pt'></span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'></span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>4</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-end'></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>防水；<span
					lang=EN-US><o:p></o:p></span></span>
			</p>


			<p class=MsoNormal
				style='margin-left: 57.9pt; mso-para-margin-left: 3.42gd; text-indent: -22.0pt; mso-char-indent-count: -2.0; line-height: 22.0pt; tab-stops: 35.45pt'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>2)<span
					style='mso-spacerun: yes'>&nbsp; </span></span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>承包范围：</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-begin'></span> </span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; position: relative; top: 2.0pt; mso-text-raise: -2.0pt'></span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'></span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>1</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-end'></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>包人工（现场施工人员的饮食、办证<span
					lang=EN-US>-</span>暂住证、出入证、办理平安卡费用）；
				</span> <span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-begin'></span> </span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; position: relative; top: 2.0pt; mso-text-raise: -2.0pt'></span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'></span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>2</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-end'></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>包质量、包工期、包安全、包验收；</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-begin'></span> </span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; position: relative; top: 2.0pt; mso-text-raise: -2.0pt'></span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'></span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>3</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-end'></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>包因现场制作、安装质量问题产生的保修费用；</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-begin'></span> </span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; position: relative; top: 2.0pt; mso-text-raise: -2.0pt'></span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'></span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>4</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-end'></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>对现场工伤事故引起的全部经济及法律问题负全责；</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-begin'></span> </span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; position: relative; top: 2.0pt; mso-text-raise: -2.0pt'></span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'></span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>5</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-end'></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>包一切施工用途的工具（含自带工具的消耗件，不包含大型机械、包劳保用品<span
					lang=EN-US>&shy;&shy;&shy;&shy;&shy;</span>&#8212;&#8212;安全帽、安全鞋、安全带等）；
				</span> <span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-begin'></span> </span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; position: relative; top: 2.0pt; mso-text-raise: -2.0pt'></span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'></span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>6</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-end'></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>包安装埋件后的墙面防水；</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-begin'></span> </span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; position: relative; top: 2.0pt; mso-text-raise: -2.0pt'></span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'></span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>7</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-end'></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>包部分线条及平板的加工费用；</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-begin'></span> </span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; position: relative; top: 2.0pt; mso-text-raise: -2.0pt'></span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'></span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>8</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-end'></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>包收边收口注胶（含窗边）；</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-begin'></span> </span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; position: relative; top: 2.0pt; mso-text-raise: -2.0pt'></span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'></span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>9</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-end'></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>包完工后乙方承包范围内建筑垃圾的清理；</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-begin'></span> </span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; position: relative; top: 2.0pt; mso-text-raise: -2.0pt'></span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'></span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>10</span>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-element: field-end'></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>包辅料（胶类材料、挂件、埋件、五金件等材料）的上下车，并运至仓库及辅助石材、钢材卸车。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 21.0pt; text-indent: 7.35pt; line-height: 22.0pt; mso-list: l0 level1 lfo1; tab-stops: 1.0cm'>

				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif";'><span>三、<span
							style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
						</span></span></span></b> <b style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>劳务价款</span></b><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>：<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 1.0cm; text-indent: 6.95pt; mso-char-indent-count: .63; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>1)<b
					style='mso-bidi-font-weight: normal'><span
						style='mso-spacerun: yes'>&nbsp; </span></b></span><b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>工程暂定总造价：<input
						readonly="readonly" type="text" class="input_rmb"
						value="人民币 （小写）：" /><input readonly="readonly"
						value="${laborcontract.contractPrice}" type="text"
						class="input_text2" />
				</span></b>
			</p>

			<p class=MsoNormal
				style='margin-left: 24.9pt; mso-para-margin-left: 2.75gd; text-indent: 114.95pt; mso-char-indent-count: 10.45; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<b style='mso-bidi-font-weight: normal'> <input
					readonly="readonly" type="text" class="input_rmb" value="人民币 （大写）：" /><input
					readonly="readonly" value="${contractpriceDX}" type="text"
					class="input_text2" />
				</b>
			</p>

			<p class=MsoNormal
				style='margin-left: 58.4pt; mso-para-margin-left: 3.37gd; text-indent: -23.0pt; mso-char-indent-count: -2.09; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>2)<span
					style='mso-spacerun: yes'>&nbsp; </span></span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>本合同劳务价款详见附件清单<span
					lang=EN-US>(</span>采用综合单价包干，工程量按实结算<span lang=EN-US>)</span>。乙方承包户型为<b
					style='mso-bidi-font-weight: normal'><input readonly="readonly"
						value="${laborcontract.house}" type="text" class="input_text" /></b>，数量为<input
					readonly="readonly" value="${laborcontract.buildings}" type="text"
					class="input_text2" />栋。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 58.4pt; mso-para-margin-left: 3.37gd; text-indent: -23.0pt; mso-char-indent-count: -2.09; line-height: 20.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>3)<span
					style='mso-spacerun: yes'>&nbsp;&nbsp; </span></span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>本工程包干单价已包括完成甲方提供的图纸、清单的工程内容和合同约定的工作内容的一切相关费用。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 21.0pt; text-indent: 7.35pt; line-height: 22.0pt; mso-list: l0 level1 lfo1; tab-stops: 1.0cm'>
				<a name="OLE_LINK2"></a><a name="OLE_LINK1"><span
					style='mso-bookmark: OLE_LINK2'><b
						style='mso-bidi-font-weight: normal'><span lang=EN-US
							style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif";'><span>四、<span
									style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
								</span></span></span></b> <b style='mso-bidi-font-weight: normal'><span
							style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲方权利、责任：<span
								lang=EN-US><o:p></o:p></span></span></b></span></a>
			</p>

			<span style='mso-bookmark: OLE_LINK2'></span><span
				style='mso-bookmark: OLE_LINK1'></span>

			<p class=MsoNormal
				style='margin-left: 56.5pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l7 level1 lfo3; tab-stops: list 56.5pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>1)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲方驻工地项目经理为<input
					readonly="readonly" value="${laborcontract.projectmanagerAid}"
					type="text" class="input_text" />（联系电话：<input readonly="readonly"
					value="${laborcontract.projectmanagerAidtel}" type="text"
					class="input_text2" />），负责项目质量、进度、安全等工作的监督与管理。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l7 level1 lfo3; tab-stops: list 56.5pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>2)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>积极与土建方或业主沟通，及时提供现场安装标准和要求，配合乙方安排好施工前准备工作。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l7 level1 lfo3; tab-stops: list 56.5pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>3)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>提供现场施工所需水、电、材料堆放场地，每户型的外墙脚手架搭设和整改，每户型配置足够的电缆、二级电箱及水管接驳点。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l7 level1 lfo3; tab-stops: list 56.5pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>4)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>为了确保工作顺利，甲方应按已完成并经甲乙双方检验合格的工程量按合同计算方式定期支付工程进度款。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l7 level1 lfo3; tab-stops: list 56.5pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>5)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲方有权对设计图纸进行变更、对工程量进行调增、调减，这均属于合同范围，乙方应及时按变更进行施工，不得以任何理由拒绝及索赔。乙方应在变更项目施工完工后或签证事件完成之日起<span
					lang=EN-US>2</span>天内报甲方签证确认工程量。自签证事件完成之日起超过<u><span lang=EN-US>2</span></u>天乙方仍未按约定办理签证的，则视为乙方放弃签证。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l7 level1 lfo3; tab-stops: list 56.5pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>6)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲方有权对乙方的安装质量随时抽查，发现不符合要求时有权责令乙方按时返修至合格为止，若乙方延时整改，甲方有权按照本合同的约定追究乙方的违约责任。由于质量或工期问题，导致工程业主或工程总承包单位向甲方投诉的，乙方应按合同暂定总价的<span
					lang=EN-US>20%</span>的标准向甲方支付违约金。该违约金甲方可从乙方任何应支付的款项中扣除。不足扣除的，乙方应足额支付给甲方。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l7 level1 lfo3; tab-stops: list 56.5pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>7)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方与其工人之间的争议<span
					lang=EN-US>(</span>含乙方与工人之间的工资<span lang=EN-US>,</span>保险<span
					lang=EN-US>,</span>工伤医疗及赔偿等<span lang=EN-US>)</span>与甲方无关<span
					lang=EN-US>,</span>甲方不承担任何责任。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l7 level1 lfo3; tab-stops: list 56.5pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>8)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲方有权根据乙方在施工期间内提供的劳务人员名单直接代乙方发放工人工资，并在本合同价款中扣除。劳务工人在领取工资时必须凭本人身份证原件领取，签名时应注明“本月工资已全部领齐”或“本工程工资已全部领齐”字句，并印上手印，拍照为证。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l7 level1 lfo3; tab-stops: list 56.5pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>9)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>如甲方发现乙方工人擅自将其他班组的材料转移到乙方承包的工程上使用，每次乙方应向甲方支付违约金<span
					lang=EN-US>5000</span>元，并甲方有权单方解除本协议。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l7 level1 lfo3; tab-stops: list 56.5pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>10)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp; </span></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方投入的工人必须满足甲方项目进度要求，如乙方工人无法满足甲方进度要求，甲方有权自行增加人手，产生的费用由乙方承担。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l7 level1 lfo3; tab-stops: list 56.5pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>11)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp; </span></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>如因甲方原因（工作面移交原因、材料供料原因等）造成乙方窝工的，乙方应在事件完结后<u><span
						lang=EN-US>2</span></u>天内向甲方申请进行窝工签证。逾期申请视为放弃窝工索赔。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.5pt; line-height: 22.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>a</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>、如因非乙方原因造成乙方窝工的（工作面移交原因、材料供料原因等），甲方项目部给予窝工签证。根据工期计算规则，整个单体楼栋累计窝工时间在<span
					lang=EN-US>3</span>天之内的，窝工费用由乙方承担。如窝工时间超过<span lang=EN-US>3</span>天，超过<span
					lang=EN-US>3</span>天以外部分由甲方进行补偿；<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 49.5pt; mso-char-indent-count: 4.5; line-height: 22.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>b</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>、补偿金额：<span
					lang=EN-US>80</span>元<span lang=EN-US>/</span>工日；<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 49.5pt; mso-char-indent-count: 4.5; line-height: 22.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>c</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>、补偿对象必须为乙方自有工人。外请的小工不在补助范围内；<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.5pt; line-height: 22.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>d</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>、劳务窝工补偿支付流程：乙方提出劳务窝工补偿→甲方项目部进行劳务补偿签证，提交甲方审核→甲方审核同意反馈甲方项目部→甲方项目部依照申请填写费用申请→甲方审核后按审核金额<span
					lang=EN-US>100%</span>支付。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l7 level1 lfo3; tab-stops: list 56.5pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>12)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp; </span></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲方有义务提供工人宿舍、床架及承担工人生活水电费，如无法提供<span
					lang=EN-US>,</span>则按照龙骨班组<span lang=EN-US>1</span>元<span
					lang=EN-US>/</span></span><span
					style='font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: 微软雅黑; mso-hansi-font-family: 微软雅黑'>&#13217;</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>、挂石班组<span
					lang=EN-US>1.5</span>元<span lang=EN-US>/</span></span><span
					style='font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: 微软雅黑; mso-hansi-font-family: 微软雅黑'>&#13217;</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>的标准进行补助。住宿补助在工程竣工验收后一次性支付给乙方，不扣留保修金。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l7 level1 lfo3; tab-stops: list 56.5pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>13)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp; </span></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方如出现拖欠工人工资等款项的，甲方有权直接把乙方工程款、保修金支付给工人。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 21.0pt; text-indent: 7.35pt; line-height: 22.0pt; mso-list: l0 level1 lfo1; tab-stops: 1.0cm'>

				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif";'><span>五、<span
							style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
						</span></span></span></b> <b style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方权利、责任：<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l4 level1 lfo4; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>1)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方姓名<input
					readonly="readonly" value="${execution.name}" type="text"
					class="input_text" />乙方联系电话：<input readonly="readonly"
					value="${execution.personTel}" type="text" class="input_text2" />。如乙方不能亲自驻项目管理，乙方必须委托相关人员全权负责项目质量、进度、安全、工程量确认与工程款确认等工作，被委托人的签字、盖章视为乙方签字盖章，具备同等法律效力。乙方委托<input
					readonly="readonly" value="${laborcontract.projectleadBid}"
					type="text" class="input_text" />驻工地管理人员，被委托人联系电话：<input
					readonly="readonly" value="${laborcontract.projectleadBidtel}"
					type="text" class="input_text2" />、身份证号<input readonly="readonly"
					value="" type="text" class="input_text2" />。若乙方不能亲驻项目管理又不指定委托人的，甲方有权拒绝支付任何款项，并有权单方解除合同，所有后果由乙方承担。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p style='page-break-after: always'></p>
			<br style='page-break-after: always'>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l4 level1 lfo4; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>2)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方必须对本工程施工内容、图纸、现场施工条件以及可能出现的一些特殊情况清楚明了。需要乙方配合或承担责任的，乙方同意无条件配合并承担责任。如<span
					lang=EN-US>6</span>层以下（含<span lang=EN-US>6</span>层）需要人工搬运的材料、产品，运输车不能开到井架口需要人工搬运以及现场一些相关配合等。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l4 level1 lfo4; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>3)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>自觉接受甲方的监督检查及有关现场施工的施工管理方案。同时乙方要进行工程进度和质量的检验。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l4 level1 lfo4; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>4)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>作好安全防护和文明施工，严守安全操作规程。搞好文明施工，对生产、生活场所卫生、保卫、防火、用电安全负责，对施工现场环境负责，做到工完场清。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l4 level1 lfo4; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>5)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方有义务配合甲方搭设甲方办公室、仓库等工作<span
					lang=EN-US>(</span>可申请签证<span lang=EN-US>)</span>。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l4 level1 lfo4; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>6)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>各工序的隐蔽工程，须经甲方有关人员检查合格后才能进行下一步工序工作。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l4 level1 lfo4; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>7)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲方通知增加或变更、整改的项目，被视为本工程范围，乙方不得拒绝，且必须在通知规定的期限内完成；若乙方拒绝施工，甲方有权委托第三方完成，并从乙方工程款中扣除委托第三方施工所产生工程费用金额的<span
					lang=EN-US>10%</span>作为代管理费<span lang=EN-US>;</span>增加变更，整改项目按合同相应项目单价计费，若合同没有相应项目单价则双方另议合理市场信息价计费。如乙方虚报、乱报签证，甲方有权拒付签证费用，并按虚报、乱报金额<span
					lang=EN-US>10%</span>的标准收取乙方违约金。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l4 level1 lfo4; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>8)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲方提供二级配电箱作为施工用电设施，乙方负责安装、架设、维护、保管、拆除，乙方自备三级配电箱设施、电焊机带二次保护装置，电动机具设置保护罩。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l4 level1 lfo4'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>9)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>工程开工之前乙方必须将现场所有人员的花名册、身份证复印件、工人银行卡卡号报给甲方留底。在施工过程中，乙方现场工作人员如有增加、减少及变更的，应及时将名单及身份证复印件交甲方。乙方漏报、瞒报、虚报工人的，按<span
					lang=EN-US>1000</span>元<span lang=EN-US>/</span>人的标准向甲方支付违约金。乙方必须为现场安装工人购买工程意外伤害保险，乙方不购买的甲方有权在乙方的工程款中扣除，并扣除保险金额的<span
					lang=EN-US>10%</span>作为违约金。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l4 level1 lfo4; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>10)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp; </span></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方必须做好自身生产、施工的安全防范工作，开工前对工人做好安全交底，特种作业人员必须持证上岗，在危险或不够施工安全条件下不得开工。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l4 level1 lfo4; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>11)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp; </span></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方在施工过程中要爱惜甲方的所有原材料及配件，凡发现有浪费者，按以下情况处理：<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 60.3pt; text-indent: -18.0pt; line-height: 22.0pt; mso-list: l12 level1 lfo5'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>a、<span
						style='font: 7.0pt "Times New Roman"'> </span></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>石材损耗率超过<span
					lang=EN-US>0.5%</span>的由乙方负责（不含运输和供应商造成的损耗）。所有辅材含钢材、胶类、膨胀螺丝、化学螺栓、焊条、防锈漆等按甲方核定数量计算，乙方结算时石材超出<span
					lang=EN-US>0.5%</span>损耗或辅材超出甲方核定数量的，超出部分甲方有权按采购价在结算款中扣除。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 60.3pt; text-indent: -18.0pt; line-height: 22.0pt; mso-list: l12 level1 lfo5'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>b、<span
						style='font: 7.0pt "Times New Roman"'> </span></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>施工过程中拆下的废料及用剩的原料一律要退回甲方仓库，乙方造成配件或钢材等材料遗失的按材料价<span
					lang=EN-US>100%</span>赔偿甲方。乙方人员有偷窃现象的，乙方应双倍向甲方赔偿，甲方并有权要求乙方退场。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 60.3pt; text-indent: -18.0pt; line-height: 22.0pt; mso-list: l12 level1 lfo5'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>c、<span
						style='font: 7.0pt "Times New Roman"'> </span></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方在整个施工过程中必需服从甲方人员对材料的监控，禁止浪费材料（超出约定损耗率的属浪费）。否则甲方有权解除合同并向乙方追讨因材料浪费所造成的所有损失<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l4 level1 lfo4; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>12)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp; </span></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方必须保护好甲方移交的材料，甲方到现场的材料乙方必须认真清点，凡甲方完整移交的财物（包括工具和施工材料等）因乙方未妥善保护而遭破坏、损毁、丢失，甲方有权按财物的<span
					lang=EN-US>100%</span>～<span lang=EN-US>200%</span>计算损失，统一在乙方的工程款中扣除。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p style='page-break-after: always'></p>
			<br style='page-break-after: always'>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l4 level1 lfo4; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>13)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp; </span></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方签订合同后必须派驻管理人员长驻工地，不得无故离开施工现场。凡有施工期间擅自无故离场则每次处以<span
					lang=EN-US>50-100</span>元罚款，款项在当月进度款中扣除，乙方派驻现场管理员必须保证电话随时可以联系，如有联系不上者，每次处于<span
					lang=EN-US>50</span>元以上罚款。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l4 level1 lfo4; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>14)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp; </span></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>施工过程中及完成后，必须把施工现场及安装的成品清洁干净，如发现不合格的，每平方按清洁分项单价上浮<span
					lang=EN-US>30%</span>后的价款扣除乙方清洁费（甲方验收为准）；通知后仍不整改，甲方有权委托第三人完成清洁工作，甲方所支付的一切费用直接从乙方当期工程款中扣除。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l4 level1 lfo4; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>15)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp; </span></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>若乙方在施工过程中，因施工人员不够而影响工程进度，甲方有权随时增派人员或其它施工队进场施工，其人工单价按每天不少于<span
					lang=EN-US>350</span>元<span lang=EN-US>/</span>工日，施工费用在乙方当期工程款中扣除，不足部分乙方支付。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l4 level1 lfo4; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>16)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp; </span></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>安装前若需乙方协助提供洞口尺寸时，要先按工地施工员指定的水平点、垂直顶点放水平线吊垂直线（指顶点到底部），确保每个洞口尺寸无误；乙方需提供窗侧板、收口板、圆柱柱身等尺寸给甲方，提供的数据必须符合甲方与土建方要求。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l4 level1 lfo4; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>17)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp; </span></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>保修期内乙方在接到甲方通知后<span
					lang=EN-US>3</span>日内派人到现场负责保修事宜，否则甲方可委托其他施工队维修，费用从保修金中扣除，不足部分乙方支付。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l4 level1 lfo4; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>18)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp; </span></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方施工人员施工时必须做好安全措施（如佩戴安全帽、高空作业时使用安全带、使用射钉枪佩戴防护面罩或防护眼镜等），如施工现场安全条件不足不得施工。从工程开工直至完工移交业主前，乙方必须自觉履行半成品、成品保护义务，若半成品、成品保护不力导致需要更换或修复的费用由乙方负责。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l4 level1 lfo4; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>19)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp; </span></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方派员协助本工程进行型材检测、四性检测、现场拉拔、探伤等试验时的配合；四性试验由乙方配合完成，费用由甲方负责。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l4 level1 lfo4; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>20)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp; </span></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方必须严格按照图纸施工，当现场与图纸不符时需及时向甲方反应，并按甲方相应变更图进行施工。若乙方擅自改变图纸节点做法，导致工程返工的所有损失及甲方因工程量增加的所有损失由乙方负责。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l4 level1 lfo4; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>21)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp; </span></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方应在隐蔽工程隐蔽前<span
					lang=EN-US>48</span>小时以书面形式通知甲方和监理单位验收，验收合格后，乙方可进行隐蔽和继续施工：验收不合格，乙方应在甲方和监理单位限定的时间内整改后重新申请验收；乙方单方面隐蔽施工的，甲方有权要求重新检验，无论验收是否合格，由此引发的所有费用均由乙方承担。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l4 level1 lfo4; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>22)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp; </span></span></span> <span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>如果甲方有赶工要求，乙方有责任按照甲方项目部的要求按质、按时完成项目施工任务。因乙方原因造成甲方施工任务未能完成，由乙方承担甲方所有损失。乙方有权向甲方索取赶工费用，甲乙双方依据协商结果，由甲方向乙方支付赶工费。赶工费用原则上在项目整体验收合格后进行支付。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 21.0pt; text-indent: 7.35pt; line-height: 22.0pt; mso-list: l0 level1 lfo1; tab-stops: 1.0cm'>

				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif";'><span>六、<span
							style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
						</span></span></span></b> <b style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>质量要求：<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l2 level1 lfo6; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>1)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>工程施工质量要求达到国家或专业的质量检验评定的合格标准。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l2 level1 lfo6; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>2)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>工程施工质量不符合规范、标准和设计要求，甲方可要求乙方停工和返工，返工及停工造成的费用由乙方承担，工期不予顺延。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l2 level1 lfo6; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>3)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方在现场制作安装工作时，要切实爱惜、做好成品保护工作，需按甲方要求无条件施工。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>
			<p style='page-break-after: always'></p>
			<br style='page-break-after: always'>
			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l2 level1 lfo6; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>4)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>在每次工程例会中，如建设单位或土建方投诉乙方有关文明施工或安装质量问题，如造成的原因属乙方责任，则甲方有权视情况按每次<span
					lang=EN-US>100-500</span>元的标准要求乙方支付违约金。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l2 level1 lfo6; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>5)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>若乙方质量达不到验收标准，经甲方口头要求未予整改或整改不合格，甲方将对乙方开具书面《施工整改通知单》限期整改，在规定期限内未予整改或整改不合格，甲方有权视情况要求乙方支付<span
					lang=EN-US>100</span>元<span lang=EN-US>-500</span>元违约金。处罚后，乙方仍未整改或整改仍不合格的，甲方第二次开具书面《施工整改通知单》，如限期内整改还未达到要求，甲方有权要求乙方支付<span
					lang=EN-US>1000</span>元违约金。如第三次质量整改还达不到要求，则乙方应向甲方支付<span lang=EN-US>2000</span>元违约金。对三次以上（不含三次）书面整改通知乙方仍不能达到合格的，甲方有权解除合同，并有权要求乙方按合同暂定总价<span
					lang=EN-US>20%</span>的标准支付违约金。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l2 level1 lfo6; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>6)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方施工质量应符合甲方验收要求，如乙方施工质量不合格，经甲方提出整改后仍无法满足质量要求的。甲方有权委托第三方进行整改，甲方支付的整改费用以甲方支付给第三方的费用为准。每天工资不低于人民币：叁佰伍拾元正（<span
					lang=EN-US>350.00</span>元），住宿费按实扣除，并由乙方承担<span lang=EN-US>10%</span>的代管费。此款项甲方有权在乙方进度款或结算款中扣除，不足扣除的，乙方应足额支付。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 21.0pt; text-indent: 7.35pt; line-height: 22.0pt; mso-list: l0 level1 lfo1; tab-stops: 1.0cm'>

				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif";'><span>七、<span
							style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
						</span></span></span></b> <b style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>工程验收方法、进度请款及结算方式：<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l3 level1 lfo8; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>1)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>工程完工后乙方应第一时间进行自检，确认质量合格后通知甲方所属项目部经理进行初验。甲方收通知后应及时组织相关人员联合初验。初验合格后甲方项目部通知监理、建设方进行正式验收，验收合格并签发《竣工验收证明》则视为乙方施工合格。未通过正式验收一律不予结算。因乙方原因导致验收不合格结果由乙方负责。对于建设方验收时间可能出现延迟而造成未能及时结算乙方应给予充分理解，并充分考虑此风险。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 20.2pt; mso-list: l3 level1 lfo8; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>2)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <b style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>进度请款及支付方式：</span></b><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-top: 0cm; margin-right: 2.1pt; margin-bottom: 0cm; margin-left: 23.95pt; margin-bottom: .0001pt; mso-para-margin-top: 0cm; mso-para-margin-right: .2gd; mso-para-margin-bottom: 0cm; mso-para-margin-left: 2.28gd; mso-para-margin-bottom: .0001pt; text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 150%'>
				<span
					style='font-size: 11.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'>乙方劳务费根据乙方实际完成并经甲方验收合格的工程量在每月<span
					lang=EN-US>25</span>日申请。计算规则如下：<span lang=EN-US><o:p></o:p></span></span>
			</p>
			<p style='page-break-after: always'></p>
			<br style='page-break-after: always'>
			<p class=MsoNormal
				style='margin-top: 0cm; margin-right: 2.1pt; margin-bottom: 0cm; margin-left: 23.95pt; margin-bottom: .0001pt; mso-para-margin-top: 0cm; mso-para-margin-right: .2gd; mso-para-margin-bottom: 0cm; mso-para-margin-left: 2.28gd; mso-para-margin-bottom: .0001pt; text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 150%'>
				<span lang=EN-US
					style='font-size: 11.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
				width=681
				style='margin-left: 9.65pt; border-collapse: collapse; mso-table-layout-alt: fixed; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>
				<tr
					style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; height: 38.25pt'>
					<td width=681 colspan=7
						style='width: 511.05pt; border: none; border-bottom: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.25pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<b><span
								style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>工班进度款支付单价组成比例<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 1; height: 33.75pt'>
					<td width=30 rowspan=3
						style='width: 22.85pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 33.75pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<b><span
								style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>序号<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
					<td width=84 rowspan=2
						style='width: 62.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 33.75pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<b><span
								style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>清单项目<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
					<td width=520 colspan=4
						style='width: 389.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 33.75pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<b><span
								style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>合同单价按各工序分解<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
					<td width=47 rowspan=3
						style='width: 35.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 33.75pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<b><span
								style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>备注<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 2; height: 50.1pt'>
					<td width=76
						style='width: 2.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 50.1pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<b><span
								style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>工序一：放线，埋板安装<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
					<td width=151
						style='width: 4.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 50.1pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<b><span
								style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>工序二：钢龙骨安装<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
					<td width=208
						style='width: 155.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 50.1pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<b><span
								style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>工序三：石材面材安装<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
					<td width=85
						style='width: 63.8pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 50.1pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<b><span
								style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>工序四：打胶清洁及防水<span
									lang=EN-US><o:p></o:p></span></span></b>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 3; height: 24.95pt'>
					<td width=84
						style='width: 62.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.95pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt; mso-bidi-font-weight: bold'>承接范围打（√）</span><span
								lang=EN-US
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'><o:p></o:p></span>
						</p>
					</td>

					<td width=227 colspan=2
						style='width: 6.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.95pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<input readonly="readonly"
								${(laborcontract.exetype eq '骨架班组')||(laborcontract.exetype eq '骨架+石材班组')?'value="√"':''}
								type="text" class="input_choose"> <span lang=EN-US
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'><o:p></o:p></span>
						</p>
					</td>
					<td width=208
						style='width: 6.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.95pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<input readonly="readonly"
								${(laborcontract.exetype eq '石材班组')||(laborcontract.exetype eq '骨架+石材班组')?'value="√"':''}
								type="text" class="input_choose"> <span lang=EN-US
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'><o:p></o:p></span>
						</p>
					</td>
					<td width=85
						style='width: 63.8pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.95pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<input readonly="readonly"
								${(laborcontract.exetype eq '石材班组')||(laborcontract.exetype eq '骨架+石材班组')?'value="√"':''}
								type="text" class="input_choose"> <span lang=EN-US
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 4; height: 50.1pt'>
					<td width=30
						style='width: 22.85pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 50.1pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>1<o:p></o:p></span>
						</p>
					</td>
					<td width=84
						style='width: 62.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 50.1pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>平板<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=76
						style='width: 2.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 50.1pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>3</span><span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>元<span
								lang=EN-US>/m2<o:p></o:p></span></span>
						</p>
					</td>
					<td width=151
						style='width: 4.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 50.1pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>39</span><span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>元<span
								lang=EN-US>/m2<o:p></o:p></span></span>
						</p>
					</td>
					<td width=208
						style='width: 155.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 50.1pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>平板面材安装单价<span
								lang=EN-US>=</span>分项单价<span lang=EN-US>-</span>放线，埋件安装价格<span
								lang=EN-US>-</span>钢龙骨安装价格<span lang=EN-US>-</span>打胶清洁价格<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=85
						style='width: 63.8pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 50.1pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>10</span><span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>元<span
								lang=EN-US>/m2<o:p></o:p></span></span>
						</p>
					</td>
					<td width=47 valign=bottom
						style='width: 35.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 50.1pt'>
						<p class=MsoNormal align=left
							style='text-align: left; mso-pagination: widow-orphan'>
							<span
								style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>
								<span lang=EN-US><o:p></o:p></span>
							</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 5; height: 50.1pt'>
					<td width=30
						style='width: 22.85pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 50.1pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>2<o:p></o:p></span>
						</p>
					</td>
					<td width=84
						style='width: 62.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 50.1pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>线条<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=76
						style='width: 2.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 50.1pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>3</span><span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>元<span
								lang=EN-US>/m2<o:p></o:p></span></span>
						</p>
					</td>
					<td width=151
						style='width: 4.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 50.1pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>39</span><span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>元<span
								lang=EN-US>/m2<o:p></o:p></span></span>
						</p>
					</td>
					<td width=208
						style='width: 155.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 50.1pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>线条面材安装单价<span
								lang=EN-US>=</span>分项单价<span lang=EN-US>-</span>放线，埋件安装价格<span
								lang=EN-US>-</span>钢龙骨安装价格<span lang=EN-US>-</span>打胶清洁价格<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=85
						style='width: 63.8pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 50.1pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>10</span><span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>元<span
								lang=EN-US>/m2<o:p></o:p></span></span>
						</p>
					</td>
					<td width=47 valign=bottom
						style='width: 35.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 50.1pt'>
						<p class=MsoNormal align=left
							style='text-align: left; mso-pagination: widow-orphan'>
							<span
								style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>
								<span lang=EN-US><o:p></o:p></span>
							</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 6; height: 55.5pt'>
					<td width=30
						style='width: 22.85pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 55.5pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>3<o:p></o:p></span>
						</p>
					</td>
					<td width=84
						style='width: 62.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 55.5pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>罗马柱板<span
								lang=EN-US>/</span>圆柱<span lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=76
						style='width: 2.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 55.5pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>3</span><span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>元<span
								lang=EN-US>/m2<o:p></o:p></span></span>
						</p>
					</td>
					<td width=151
						style='width: 4.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 55.5pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>39</span><span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>元<span
								lang=EN-US>/m2<o:p></o:p></span></span>
						</p>
					</td>
					<td width=208
						style='width: 155.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 55.5pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>罗马柱板<span
								lang=EN-US>/</span>圆柱面材安装单价<span lang=EN-US>=</span>分项单价<span
								lang=EN-US>-</span>放线，埋件安装价格<span lang=EN-US>-</span>钢龙骨安装价格<span
								lang=EN-US>-</span>打胶清洁价格<span lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=85
						style='width: 63.8pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 55.5pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>10</span><span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>元<span
								lang=EN-US>/m2<o:p></o:p></span></span>
						</p>
					</td>
					<td width=47 valign=bottom
						style='width: 35.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 55.5pt'>
						<p class=MsoNormal align=left
							style='text-align: left; mso-pagination: widow-orphan'>
							<span
								style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>
								<span lang=EN-US><o:p></o:p></span>
							</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 7; height: 51.75pt'>
					<td width=30
						style='width: 22.85pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 51.75pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>4<o:p></o:p></span>
						</p>
					</td>
					<td width=84
						style='width: 62.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 51.75pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>花瓶（栏杆下花瓶）<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=76
						style='width: 2.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 51.75pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>0</span><span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>元<span
								lang=EN-US>/</span>个或<span lang=EN-US>0</span>元<span lang=EN-US>/m<o:p></o:p></span></span>
						</p>
					</td>
					<td width=151
						style='width: 4.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 51.75pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>0</span><span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>元<span
								lang=EN-US>/</span>个或<span lang=EN-US>0</span>元<span lang=EN-US>/m<o:p></o:p></span></span>
						</p>
					</td>
					<td width=208
						style='width: 155.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 51.75pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>按栏杆<span
								lang=EN-US>/</span>花瓶安装单价的<span lang=EN-US>80%</span>计<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=85
						style='width: 63.8pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 51.75pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>按栏杆<span
								lang=EN-US>/</span>花瓶安装单价的<span lang=EN-US>20%</span>计<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=47
						style='width: 35.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 51.75pt'>
						<p class=MsoNormal align=left
							style='text-align: left; mso-pagination: widow-orphan'>
							<span
								style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>
								<span lang=EN-US><o:p></o:p></span>
							</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 8; height: 48.0pt'>
					<td width=30
						style='width: 22.85pt; border: solid windowtext 1.0pt; border-top: none; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 48.0pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>5<o:p></o:p></span>
						</p>
					</td>
					<td width=84
						style='width: 62.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 48.0pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>雕花件（按件计）<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=76
						style='width: 2.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 48.0pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>0</span><span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>元<span
								lang=EN-US>/</span>件<span lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=151
						style='width: 4.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 48.0pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>0</span><span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>元<span
								lang=EN-US>/</span>件<span lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=208
						style='width: 155.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 48.0pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>按雕花件安装单价的<span
								lang=EN-US>80%</span>计<span lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=85
						style='width: 63.8pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 48.0pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>按雕花件安装单价的<span
								lang=EN-US>20%</span>计<span lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=47 valign=bottom
						style='width: 35.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 48.0pt'>
						<p class=MsoNormal align=left
							style='text-align: left; mso-pagination: widow-orphan'>
							<span
								style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>
								<span lang=EN-US><o:p></o:p></span>
							</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 9; mso-yfti-lastrow: yes; height: 59.25pt'>
					<td width=30
						style='width: 22.85pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 59.25pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>6<o:p></o:p></span>
						</p>
					</td>
					<td width=84
						style='width: 62.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 59.25pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>浮雕（按<span
								lang=EN-US>m2</span>计）<span lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=76
						style='width: 2.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 59.25pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>3</span><span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>元<span
								lang=EN-US>/m2<o:p></o:p></span></span>
						</p>
					</td>
					<td width=151
						style='width: 4.0cm; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 59.25pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>39</span><span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>元<span
								lang=EN-US>/m2<o:p></o:p></span></span>
						</p>
					</td>
					<td width=208
						style='width: 155.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 59.25pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>雕花面材安装单价<span
								lang=EN-US>=</span>分项单价<span lang=EN-US>-</span>放线，埋件安装价格<span
								lang=EN-US>-</span>钢龙骨安装价格<span lang=EN-US>-</span>打胶清洁价格<span
								lang=EN-US><o:p></o:p></span></span>
						</p>
					</td>
					<td width=85
						style='width: 63.8pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 59.25pt'>
						<p class=MsoNormal align=center
							style='text-align: center; mso-pagination: widow-orphan'>
							<span lang=EN-US
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>10</span><span
								style='font-size: 10.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>元<span
								lang=EN-US>/m2<o:p></o:p></span></span>
						</p>
					</td>
					<td width=47 valign=bottom
						style='width: 35.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 59.25pt'>
						<p class=MsoNormal align=left
							style='text-align: left; mso-pagination: widow-orphan'>
							<span
								style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt'>
								<span lang=EN-US><o:p></o:p></span>
							</span>
						</p>
					</td>
				</tr>
			</table>

			<p class=MsoNormal
				style='margin-right: 2.1pt; mso-para-margin-right: .2gd; line-height: 150%'>
				<span lang=EN-US
					style='font-size: 11.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-right: 2.1pt; mso-para-margin-right: .2gd; line-height: 150%'>
				<span lang=EN-US
					style='font-size: 11.0pt; line-height: 150%; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-top: 0cm; margin-right: 2.1pt; margin-bottom: 0cm; margin-left: 53.85pt; margin-bottom: .0001pt; mso-para-margin-top: 0cm; mso-para-margin-right: .2gd; mso-para-margin-bottom: 0cm; mso-para-margin-left: 5.13gd; mso-para-margin-bottom: .0001pt; text-indent: 27.5pt; mso-char-indent-count: 2.5; line-height: 22.0pt; mso-line-height-rule: exactly'>
				<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>根据幕墙安装工程的实际情况，乙方同意甲方按以上计算方法支付乙方劳务费，每次进度款按实际完成合格工作量的<span
					lang=EN-US>90%</span>发放；施工楼栋拆架后（即收尾完成），甲方质安部检查验收合格后，甲方向乙方支付至合同额的<span
					lang=EN-US>90%</span>，竣工验收合格且经甲方相关人员签字认可并在完成结算后（对应位置打 “√”）：<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-top: 0cm; margin-right: 2.1pt; margin-bottom: 0cm; margin-left: 53.85pt; margin-bottom: .0001pt; mso-para-margin-top: 0cm; mso-para-margin-right: .2gd; mso-para-margin-bottom: 0cm; mso-para-margin-left: 5.13gd; mso-para-margin-bottom: .0001pt; text-indent: 27.5pt; mso-char-indent-count: 2.5; line-height: 22.0pt; mso-line-height-rule: exactly'>
				<input readonly="readonly" value="" type="text" class="input_choose">
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>A</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>、如乙方在考核期内：甲方支付至结算价的<span
					lang=EN-US>95%</span>，剩余<span lang=EN-US>5%</span>待工程竣工验收满两年后甲方一次性支付乙方；<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-top: 0cm; margin-right: 2.1pt; margin-bottom: 0cm; margin-left: 53.85pt; margin-bottom: .0001pt; mso-para-margin-top: 0cm; mso-para-margin-right: .2gd; mso-para-margin-bottom: 0cm; mso-para-margin-left: 5.13gd; mso-para-margin-bottom: .0001pt; text-indent: 27.5pt; mso-char-indent-count: 2.5; line-height: 22.0pt; mso-line-height-rule: exactly'>
				<input readonly="readonly" value="" type="text" class="input_choose">
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>B</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>、如乙方已通过考核期：甲方支付至结算价的<span
					lang=EN-US>97.5%</span>，剩余<span lang=EN-US>2.5%</span>待工程竣工验收满两年后甲方一次性支付乙方。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-top: 0cm; margin-right: 2.1pt; margin-bottom: 0cm; margin-left: 53.85pt; margin-bottom: .0001pt; mso-para-margin-top: 0cm; mso-para-margin-right: .2gd; mso-para-margin-bottom: 0cm; mso-para-margin-left: 5.13gd; mso-para-margin-bottom: .0001pt; text-indent: 27.5pt; mso-char-indent-count: 2.5; line-height: 22.0pt; mso-line-height-rule: exactly'>
				<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>施工过程中办理工程进度请款应由乙方合同签订人按实填写《进度款支付申请表》，须针对“分项”中的每个细节内容统计出“累计完成工程量”后交甲方现场施工员、项目经理审核，审核后的请款单送甲方进行审批。当期施工队进度款＝分项累计工程量<span
					lang=EN-US>×</span>各分项对应单价<span lang=EN-US>×90%</span>－前期累计已付的工程进度款。乙方向甲方申请进度款的时间为每月<span
					lang=EN-US>25</span>号，甲方在接到乙方进度款申请后<span lang=EN-US>10</span>个工作日内完成审批及发放。如甲方遇突发情况延迟支付工程款，乙方应充分理解甲方。每次申请进度款必须附上工人工资表，进度款由甲方财务人员通过银行转账方式支付。未经甲方同意而擅自变更施工条件、方案所造成的一切额外签证费用，甲方有权不与乙方结算。工程签证发生二天内必须报甲方现场项目经理确认，甲方在两周内审核完毕并返回乙方作签证依据（只收原件，复印件或传真件拒收）。自签证事件完成之日起超过<span
					lang=EN-US>2</span>天乙方仍未按约定办理签证的，则视为承包人放弃签证。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 21.0pt; text-indent: 7.35pt; line-height: 22.0pt; mso-list: l0 level1 lfo1; tab-stops: 1.0cm'>

				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 12.0pt; font-family: "微软雅黑", "sans-serif";'><span>八、<span
							style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
						</span></span></span></b> <b style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>工程量计算规则<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l16 level1 lfo13; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>1)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>石材线条工程量以石材线条外立面正面投影面积计算，其中栏杆线条不计算骨架面积；<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l16 level1 lfo13; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>2)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>石材平板工程量除雕刻件遮挡部位外均按石材平板可视面积计算（板厚不计算面积，胶缝位置计算面积），所有不见光搭接位均考虑在综合单价中<span
					lang=EN-US>,</span>不另外计取。湿贴等未有骨架的位置不计算骨架面积；<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l16 level1 lfo13; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>3)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>雕花板以可视面积计算，所有不见光搭接位均考虑在综合单价中<span
					lang=EN-US>,</span>不另外计取；<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l16 level1 lfo13; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>4)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>雕花件、花瓶、花盆按件计算，不计取骨架面积；<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 17.95pt; mso-para-margin-left: 1.71gd; text-indent: 9.05pt; line-height: 22.0pt; mso-list: l6 level1 lfo7; tab-stops: 9.0pt'>

				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>九、<span
							style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</span></span></span></b> <b style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>劳务签证原则及支付方式<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l10 level1 lfo14; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>1)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>劳务签证是指在劳务班组在施工合同履行过程中，承发包双方根据合同的约定，就合同价款之外的费用补偿、以及因各种原因造成的损失赔偿达成的补充协议形式。包括<span
					lang=EN-US>:</span>（<span lang=EN-US>1</span>）零星用工：施工现场发生的与主体工程施工无关的用工，如合同费用以外的搬运拆除用工等；（<span
					lang=EN-US>2</span>）临时设施增补项目；（<span lang=EN-US>3</span>）隐蔽工程签证；（<span
					lang=EN-US>4</span>）设计图纸修改导致的重复用工；（<span lang=EN-US>5</span>）其它需要签证的费用。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l10 level1 lfo14; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>2)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>劳务签证支付实行每月上报制度，每月<span
					lang=EN-US>10</span>日上报上月经项目部及区域经理审核的《零星用工凭证》表，甲方审核完后，在每月<span
					lang=EN-US>25</span>日前项目部申请签证支付流程；零星用工凭证必须在当月上报，并需提交施工前后对比照片，所有签证资料必须为原件否则不予认可。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l10 level1 lfo14; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>3)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>签证内容如有合同价的按合同价；无合同价的按《劳务签工标准价格表》中单价；班组自己存放材料、工器具所搭设的仓库以及材料的装卸、运输等已包含在合同单价或总价中，不予补工签证；合同范围内出现变更导致面积增加的，不以签证形式进行支付，超出<span
					lang=EN-US>10%</span>的以签订补充协议形式支付进度款，未超出<span lang=EN-US>10%</span>的在劳务结算后进行支付。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l10 level1 lfo14; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>4)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>签证支付：根据甲方最终审批金额单独申请，按审批金额<span
					lang=EN-US>100%</span>进行支付<span lang=EN-US>;<o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 17.95pt; mso-para-margin-left: 1.71gd; text-indent: 9.05pt; line-height: 22.0pt; mso-list: l6 level1 lfo7; tab-stops: 9.0pt'>

				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>十、<span
							style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</span></span></span></b> <b style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>劳务结算及支付<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l14 level1 lfo15; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>1)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>项目完工并验收合格后，乙方向甲方项目管理人员索取结算申请表，甲方项目管理人员、质安部签字盖章确认后提交甲方公司总部审批，审批通过后乙方上报工程量给项目部审核，结算可分<span
					lang=EN-US>3</span>种模式：（<span lang=EN-US>1</span>）、采用现场收方的须提供甲方项目管理人员、乙方签收的收方计算过程及图纸与现场不符部分的资料及图片。甲方项目人员与乙方收方量只做为参考量，非最终结算量。甲方结算审核部门认为收方量不合理时有权核减或推翻收方量，并要求乙方进行图纸核对及解释；（<span
					lang=EN-US>2</span>）、采用施工图结算的需乙方提供计算过程及公式，由甲方结算审核部门进行核对，有问题时有权要求乙方进行图纸核对及解释；（<span
					lang=EN-US>3</span>）、采用合同工程量进行结算。乙方若同意按合同工程量进行结算，需按甲方要求提供承诺函。当
				</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>实际工程量少于合同签订的工程量时，同意甲方做相应的核减。同一合同，乙方只能选择一种结算模式（选择后不得更改），乙方选择后甲方无异议的双方按该模式结算（甲方有异议的双方另行协商确定）。</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>竣工结算原则上只在工程全部完工且通过建设方竣工验收合格后才允许申请结算。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l14 level1 lfo15; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>2)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方最终的结算额＝已完成总工程量<span
					lang=EN-US>×</span>合同单价<span lang=EN-US>-</span>甲方依合同委托第三方施工的费用<span
					lang=EN-US>-</span>材料遗失扣款<span lang=EN-US>-</span>违约金及赔偿款<span
					lang=EN-US>-</span>其它应扣款。（若扣款在进度款支付时已经执行扣罚的不在结算进行扣罚）<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l14 level1 lfo15; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>3)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>结算请款＝乙方最终的结算款（不含签证、住宿补贴、交通补贴等）<span
					lang=EN-US>×</span>结算比例（参照第七条第二款）－乙方在该工程已支取的全部工程进度款，乙方在确认结算后须填写《工程结算请款单》进行请款。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l14 level1 lfo15; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>4)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>结算期间乙方应积极配合甲方结算人员开展工作，不得虚报施工面积、时工等否则将退回重报推迟结算时间。对存心欺骗或无理取闹的，甲方有权暂停支付工程相关款项。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l14 level1 lfo15; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>5)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>结算内容需由甲方施工员、项目经理、结算员等相关人员签名并盖甲方公章方可生效。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l14 level1 lfo15; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>6)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>为加快结算进度，杜绝工班虚报、乱报工程项目或工程量。凡结算审核面积对比申报面积超过<span
					lang=EN-US>5%</span>的差额的，按超出金额的<span lang=EN-US>10%</span>支付甲方违约金。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 21.0pt; text-indent: 6.0pt; line-height: 22.0pt; mso-list: l6 level1 lfo7; tab-stops: 9.0pt 21.0pt'>

				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>十一、<span
							style='font: 7.0pt "Times New Roman"'> </span></span></span></b> <b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>保修：<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l15 level1 lfo16; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>1)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>保修金参照第七条第二款执行。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l15 level1 lfo16; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>2)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>保修到期日＝本工程竣工验收合格日期<span
					lang=EN-US>+4</span>年。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l15 level1 lfo16; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>3)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>保修金在工程通过竣工验收合格届满<span
					lang=EN-US>2</span>年后，并在扣除应当扣除的款项后免息退还给乙方。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l15 level1 lfo16; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>4)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>保修期内因质量问题需要维修的，乙方在收到甲方项目部电话或者短信通知后，若乙方无任何回复或者不能在<span
					lang=EN-US>3</span>日内到场维修的，甲方有权安排其他单位进行维修，维修产生的一切费用由乙方承担，费用从进度款、结算款、保修金等费用扣除，扣除原则为最近可支付款项中扣除，不足部分由乙方足额支付。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 21.0pt; text-indent: 6.0pt; line-height: 22.0pt; mso-list: l6 level1 lfo7; tab-stops: 9.0pt 21.0pt'>

				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>十二、<span
							style='font: 7.0pt "Times New Roman"'> </span></span></span></b> <b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>违约责任：<span
						lang=EN-US><o:p></o:p></span></span></b>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l8 level1 lfo17; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>1)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>未经甲方许可，乙方不得将工程转包或分包，否则甲方有权解除合同，乙方并须向甲方支付合同暂定总价<span
					lang=EN-US>20%</span>的违约金。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l8 level1 lfo17; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>2)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>除因战乱、动乱、水灾、火灾及六级以上台风、大雨、暴雨、地震等人力不可抗拒的因素及甲方原因工期顺延外，凡因乙方原因造成现场的制作、安装不能按期完工的，每拖延一天支付<span
					lang=EN-US>1000</span>元违约金。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l8 level1 lfo17; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>3)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲方不能按协议支付进度款，引致工期不能按时完成，由甲方承担责任。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l8 level1 lfo17; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>4)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>凡因乙方违反协议内容而要中途退场的，在接到甲方通知后必须两天内无条件撤离甲方的施工现场，中途退场造成的一切损失由乙方承担。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l8 level1 lfo17; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>5)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>凡因乙方自身原因造成的中途退场，甲方有权单方解除合同，且一律不作即时结算，待工程完工后再作处理。结算款项按乙方完成的工程量的<span
					lang=EN-US>60%</span>支付。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l8 level1 lfo17; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>6)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>凡在施工期间，由于乙方原因造成工地停工，则甲方有权单方解除合同，而且有权拒绝结算。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l8 level1 lfo17; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>7)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>合同履行过程中，因乙方质量问题造成约定工程未能按时通过验收，由此引起的一切责任由乙方承担。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; mso-list: l8 level1 lfo17; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>8)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方必须按甲方有关规定做好文明施工和安全生产工作，否则由此造成甲方信誉上或经济上损失的，甲方将按相关管理规则予以处罚。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: -.1pt; mso-para-margin-left: -.01gd; text-indent: 24.65pt; mso-char-indent-count: 2.24; line-height: 22.0pt; mso-list: l6 level1 lfo7; tab-stops: 18.0pt'>

				<b style='mso-bidi-font-weight: normal'><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>十三、<span
							style='font: 7.0pt "Times New Roman"'>&nbsp; </span></span></span></b> <b
					style='mso-bidi-font-weight: normal'><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>其它：</span></b><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>1)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方临时用脚手架由其自行搭建，甲方只提供所需材料。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>2)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>严禁乙方现场施工人员参加任何形式的违法活动<span
					lang=EN-US>,</span>如：偷盗、赌博、吸毒、嫖娼、打架、破坏社会主义建设等，因以上情况造成的一切后果乙方自行负责。由此而发生的一切经济、政治后果与甲方无关。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>3)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>乙方需提供一个或以上的联系电话给甲方，保证随时可以联系。以免收货或者其它重要事项需协商时联系不上而影响施工进度，违者每次处以<span
					lang=EN-US>100</span>元罚款。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>4)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>严禁聚众闹事或参与任何对甲方人员或财物有损害的事情，甲方有权视情况通知警方及有关法律部门处理，违者处于<span
					lang=EN-US>1000</span>元以上的罚款。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>5)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>本合同如有未尽事宜，双方协商解决，必要时可签订与本协议具同等法律效力的补充协议。双方纠纷协商不成，约定交由甲方所在地人民法院诉讼处理。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>6)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>本合同在签署之日起生效，在本工程保修期满后，且结清工程款后自动失效。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 56.45pt; text-indent: -21.0pt; line-height: 22.0pt; tab-stops: list 56.45pt'>

				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif";'><span>7)<span
						style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></span> <span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>本合同一式四份，甲方执三份，乙方执一份。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>
			<p class=MsoNormal
				style='line-height: 22.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 42.45pt; text-indent: -21.0pt; line-height: 22.0pt; tab-stops: list 56.45pt'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-spacerun: yes'>&nbsp;&nbsp;&nbsp; </span></span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲方:
					<input readonly="readonly" value="${laborcontract.contractJiafang}"
					type="text" class="input_text2" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;乙方：<input
					readonly="readonly" type="text" class="input_text2" />
				</span>
			</p>

			<p class=MsoNormal
				style='margin-left: 42.45pt; text-indent: -21.0pt; line-height: 22.0pt; tab-stops: list 56.45pt'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-spacerun: yes'>&nbsp;&nbsp;&nbsp; </span></span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>甲方代表人：
					<input readonly="readonly" type="text" class="input_text2" />
					&nbsp;&nbsp;受乙方委托驻工地管理人签字：<input readonly="readonly" type="text"
					class="input_text2" />
				</span>
			</p>

			<p class=MsoNormal
				style='margin-left: 42.45pt; text-indent: -21.0pt; line-height: 22.0pt; tab-stops: list 56.45pt'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-spacerun: yes'>&nbsp;&nbsp;&nbsp; </span></span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>日期:
					<input readonly="readonly" type="text" class="input_text2" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期：<input
					readonly="readonly" type="text" class="input_text2" />
				</span>
			</p>

			<p class=MsoNormal>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal style='tab-stops: 37.35pt'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-tab-count: 1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span> <o:p></o:p></span>
			</p>

			<p class=MsoNormal style='tab-stops: 37.35pt'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal style='tab-stops: 37.35pt'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal align=center
				style='text-align: center; line-height: 25.0pt; mso-line-height-rule: exactly'>
				<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>承诺书<span
					lang=EN-US><o:p></o:p></span></span>
			</p>


			<p class=MsoNormal
				style='line-height: 25.0pt; mso-line-height-rule: exactly'>
				<u><span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>
							<span style='text-decoration: none'>&nbsp;</span>
						</o:p></span></u>
			</p>

			<p class=MsoNormal
				style='line-height: 25.0pt; mso-line-height-rule: exactly'>
				<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>广东万方建设有限公司：<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 25.0pt; mso-line-height-rule: exactly'>
				<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>本人<input
					readonly="readonly" value="${laborcontract.executionName}"
					type="text" class="input_text">（身份证号： <input
					readonly="readonly" value="${execution.personNum}" type="text"
					class="input_text2"> ）。<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日本人与贵司签订了一份《石材幕墙工程安装劳务合同》（合同编号：<input
					readonly="readonly" value="${laborcontract.contractNo}" type="text"
					class="input_contractNo">。以下简称：《劳务合同》）。约定承接贵司
				</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>项目劳务工程。关于工程的相关权责事宜，本人特向贵司承诺及说明如下：</span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 21.75pt; line-height: 25.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>1</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>、《劳务合同》所约定的全部义务、责任及后果（包括质量、工期、工程管理等）均由本人承担。如《劳务合同》履行过程中，发现有违约行为的，贵司可向本人主张权利。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 21.75pt; line-height: 25.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>2</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>、履行《劳务合同》进行工程劳务施工的工人为本人所雇请的工人，受本人直接的劳动管理，与贵司没有隶属关系且不发生劳动关系。工人相关的劳动、安全责任均由本人承担。</span><span
					lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p></o:p></span>
			</p>

			<p class=MsoNormal align=left
				style='text-align: left; text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 25.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>3</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>、本人或本人</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black'>所雇请的工人在</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体'>《劳务合同》履行过程中<span
					style='color: black'>所发生的劳动争议及其他纠纷或与第三方之间的争议纠纷（包括工资、人身伤害或造成第三方损害赔偿等纠纷），本人承诺均由本人自行承担责任并由本人负责处理。工人或其他第三人向贵司主张权利的，</span></span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; color: black'>本人按每人每次<span
					lang=EN-US>10000</span>元的标准向贵司支付违约金。
				</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black'>如造成贵司承担责任的，本人全额赔偿贵司。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal align=left
				style='text-align: left; text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 25.0pt; mso-line-height-rule: exactly'>
				<span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black'>本人并承诺在争议纠纷发生后<span
					lang=EN-US>10</span>日内（情况紧急须立即支付相关费用的，应立即支付）解决处理完毕争议事宜，否则贵司可按照本人所雇请工人或其家属或其他受害者的要求垫付相应款项，贵司所垫付的款项可在应支付给本人的任何款项中双倍扣回，不足扣回的，本人承诺足额赔偿给贵司。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 25.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>4</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>、上述争议、纠纷事件发生后，贵司可暂停支付本人相应金额（受害者要求支付的款项金额或贵司依相关规定计算出的可能赔偿的金额或直接按当月进度款<span
					lang=EN-US>50%</span>的金额。）的工程款项。本人赔偿处理完毕后，贵司将暂停支付的款项支付给本人。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 25.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black'>5</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"; mso-bidi-font-family: 宋体; color: black'>、</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>本人负责管控属下工人的秩序。如发生工人闹事、上访、罢工，围堵贵司生产、办公场地或人员等影响贵司正常生产经营秩序情形的，每发生一次，本人向贵司支付<span
					lang=EN-US>5</span>万元的违约金。<span lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 25.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>6</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>、本人应向贵司支付的赔偿金、违约金等费用，贵司可从应支付给本人的任何款项中扣除。不足扣除的，本人足额向贵司支付。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 25.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>7</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>、本人有效的通讯地址为：<u><span
						lang=EN-US><span style='mso-spacerun: yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</span></span></u>。贵司按该地址寄出的文件，如本人未收到的，责任由本人承担，贵司寄出的文件视为本人已收到。若本人的通讯地址变更的，应及时通知贵司，否则通讯地址视为未变更。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 25.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>8</span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>、如双方因上述第<span
					lang=EN-US>2</span>条至第<span lang=EN-US>6</span>条规定的事宜发生争议的，应协商解决，协商不成的，提交贵司所在地的人民法院诉讼处理。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 25.0pt; mso-line-height-rule: exactly'>
				<span style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>双方因《劳务合同》发生争议的，应协商解决，协商不成的，提交贵司所在地的人民法院诉讼处理。<span
					lang=EN-US><o:p></o:p></span></span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 25.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 42.45pt; text-indent: -21.0pt; line-height: 22.0pt; tab-stops: list 56.45pt'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-spacerun: yes'>&nbsp;&nbsp;&nbsp; </span></span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>承诺人:
					<input readonly="readonly" type="text" class="input_text2" />
				</span>
			</p>

			<p class=MsoNormal
				style='text-indent: 22.0pt; mso-char-indent-count: 2.0; line-height: 25.0pt; mso-line-height-rule: exactly'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-left: 42.45pt; text-indent: -21.0pt; line-height: 22.0pt; tab-stops: list 56.45pt'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><span
					style='mso-spacerun: yes'>&nbsp;&nbsp;&nbsp; </span></span><span
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'>日&nbsp;&nbsp;&nbsp;期:
					<input readonly="readonly" type="text" class="input_text2" />
				</span>
			</p>

			<p class=MsoNormal style='tab-stops: 37.35pt'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal style='tab-stops: 37.35pt'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal style='tab-stops: 37.35pt'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal style='tab-stops: 37.35pt'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal style='tab-stops: 37.35pt'>
				<span lang=EN-US
					style='font-size: 11.0pt; font-family: "微软雅黑", "sans-serif"'><o:p>&nbsp;</o:p></span>
			</p>


			<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
				style='border-collapse: collapse; border: none; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>
				<tr
					style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; height: 61.35pt'>
					<td width=568 nowrap colspan=6 valign=top
						style='width: 426.1pt; border: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; mso-border-bottom-alt: solid black .5pt; mso-border-bottom-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 61.35pt'>
						<p class=MsoNormal align=right style='text-align: right'>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>表</span><span
								lang=EN-US>QZ-02</span>
						</p>
						<p class=MsoNormal align=center style='text-align: center'>
							<b><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>劳务签工标准价格表</span></b>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 1; height: 31.5pt'>
					<td width=44 nowrap valign=top
						style='width: 33.2pt; border: solid black 1.0pt; mso-border-themecolor: text1; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 31.5pt'>
						<p class=MsoNormal>
							<b><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>序号</span><span
								lang=EN-US><o:p></o:p></span></b>
						</p>
					</td>
					<td width=244 nowrap valign=top
						style='width: 183.0pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 31.5pt'>
						<p class=MsoNormal>
							<b><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>签证内容</span><span
								lang=EN-US><o:p></o:p></span></b>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 31.5pt'>
						<p class=MsoNormal>
							<b><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>单位</span><span
								lang=EN-US><o:p></o:p></span></b>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 31.5pt'>
						<p class=MsoNormal>
							<b><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>工种类别</span><span
								lang=EN-US><o:p></o:p></span></b>
						</p>
					</td>
					<td width=71 nowrap valign=top
						style='width: 53.2pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 31.5pt'>
						<p class=MsoNormal>
							<b><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>单价</span><span
								lang=EN-US><o:p></o:p></span></b>
						</p>
					</td>
					<td width=95 nowrap valign=top
						style='width: 71.0pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 31.5pt'>
						<p class=MsoNormal>
							<b><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>备注</span><span
								lang=EN-US><o:p></o:p></span></b>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 2; height: 64.5pt'>
					<td width=44 nowrap valign=top
						style='width: 33.2pt; border: solid black 1.0pt; mso-border-themecolor: text1; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 64.5pt'>
						<p class=MsoNormal>
							<span lang=EN-US>1</span>
						</p>
					</td>
					<td width=244 valign=top
						style='width: 183.0pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 64.5pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>拆除石材</span><span
								lang=EN-US><br> </span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>【工作内容】</span><span
								lang=EN-US><br> 1</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、拆除石材面板、线条等</span><span
								lang=EN-US><br> 2</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、清理拆除后的垃圾至指定位置</span><span
								lang=EN-US><br> 3</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、尽可能保持石材的完整性</span>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 64.5pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>㎡</span>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 64.5pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>
							</span>
						</p>
					</td>
					<td width=71 valign=top
						style='width: 53.2pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 64.5pt'>
						<p class=MsoNormal>
							<span lang=EN-US>10</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width: 71.0pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 64.5pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>如能保证石材完整性按</span><span
								lang=EN-US>20</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>元</span><span
								lang=EN-US>/</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>㎡计算</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 3; height: 54.75pt'>
					<td width=44 nowrap valign=top
						style='width: 33.2pt; border: solid black 1.0pt; mso-border-themecolor: text1; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span lang=EN-US>2</span>
						</p>
					</td>
					<td width=244 valign=top
						style='width: 183.0pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>拆除龙骨</span><span
								lang=EN-US><br> </span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>【工作内容】</span><span
								lang=EN-US><br> 1</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、拆除龙骨、埋板、螺栓等</span><span
								lang=EN-US><br> 2</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、清理拆除后的垃圾至指定位置</span>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>㎡</span>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>
							</span>
						</p>
					</td>
					<td width=71 nowrap valign=top
						style='width: 53.2pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span lang=EN-US>20</span>
						</p>
					</td>
					<td width=95 nowrap valign=top
						style='width: 71.0pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>
							</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 4; height: 84.0pt'>
					<td width=44 nowrap valign=top
						style='width: 33.2pt; border: solid black 1.0pt; mso-border-themecolor: text1; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 84.0pt'>
						<p class=MsoNormal>
							<span lang=EN-US>3</span>
						</p>
					</td>
					<td width=244 valign=top
						style='width: 183.0pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 84.0pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>搭设双排钢管脚手架</span><span
								lang=EN-US><br> </span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>【工作内容】</span><span
								lang=EN-US><br> 1</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、按照要求搭设立杆、横杆及铺设行走网，满足现场施工要求及安全性要求</span><span
								lang=EN-US><br> 2</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、按要求挂设安全网</span><span
								lang=EN-US><br> 3</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、按实际搭设面积计算，不计算超出装饰面的面积</span><span
								lang=EN-US><br> 4</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、包人工</span>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 84.0pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>㎡</span>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 84.0pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>
							</span>
						</p>
					</td>
					<td width=71 nowrap valign=top
						style='width: 53.2pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 84.0pt'>
						<p class=MsoNormal>
							<span lang=EN-US>8</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width: 71.0pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 84.0pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>
							</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 5; height: 84.0pt'>
					<td width=44 nowrap valign=top
						style='width: 33.2pt; border: solid black 1.0pt; mso-border-themecolor: text1; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 84.0pt'>
						<p class=MsoNormal>
							<span lang=EN-US>4</span>
						</p>
					</td>
					<td width=244 valign=top
						style='width: 183.0pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 84.0pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>搭设双排钢管脚手架</span><span
								lang=EN-US><br> </span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>【工作内容】</span><span
								lang=EN-US><br> 1</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、按照要求搭设立杆、横杆及铺设行走网，满足现场施工要求及安全性要求</span><span
								lang=EN-US><br> 2</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、按要求挂设安全网</span><span
								lang=EN-US><br> 3</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、按实际搭设面积计算，不计算超出装饰面的面积</span><span
								lang=EN-US><br> 4</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、包工、包料、包材料进出场</span>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 84.0pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>㎡</span>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 84.0pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>
							</span>
						</p>
					</td>
					<td width=71 nowrap valign=top
						style='width: 53.2pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 84.0pt'>
						<p class=MsoNormal>
							<span lang=EN-US>30</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width: 71.0pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 84.0pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>
							</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 6; height: 54.75pt'>
					<td width=44 nowrap valign=top
						style='width: 33.2pt; border: solid black 1.0pt; mso-border-themecolor: text1; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span lang=EN-US>5</span>
						</p>
					</td>
					<td width=244 valign=top
						style='width: 183.0pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>搭设简易仓库</span><span
								lang=EN-US><br> </span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>【工作内容】</span><span
								lang=EN-US><br> 1</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、室内搭设仓库</span><span
								lang=EN-US><br> 2</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、器具损耗已包含在单价内</span>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>工日</span>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>二类工</span>
						</p>
					</td>
					<td width=71 nowrap valign=top
						style='width: 53.2pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span lang=EN-US>1</span>
						</p>
					</td>
					<td width=95 rowspan=2 valign=top
						style='width: 71.0pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>班组自己存放材料、机具的仓库不予补工</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 7; height: 54.75pt'>
					<td width=44 nowrap valign=top
						style='width: 33.2pt; border: solid black 1.0pt; mso-border-themecolor: text1; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span lang=EN-US>6</span>
						</p>
					</td>
					<td width=244 valign=top
						style='width: 183.0pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>搭设仓库</span><span
								lang=EN-US><br> </span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>【工作内容】</span><span
								lang=EN-US><br> 1</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、室外使用脚手架搭设仓库占地面积</span><span
								lang=EN-US>35</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>㎡以内。</span><span
								lang=EN-US><br> 2</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、器具损耗已包含在单价内</span>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>工日</span>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>二类工</span>
						</p>
					</td>
					<td width=71 nowrap valign=top
						style='width: 53.2pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span lang=EN-US>2</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 8; height: 68.25pt'>
					<td width=44 nowrap valign=top
						style='width: 33.2pt; border: solid black 1.0pt; mso-border-themecolor: text1; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 68.25pt'>
						<p class=MsoNormal>
							<span lang=EN-US>7</span>
						</p>
					</td>
					<td width=244 valign=top
						style='width: 183.0pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 68.25pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>石材拼接粘结</span><span
								lang=EN-US><br> </span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>【工作内容】</span><span
								lang=EN-US><br> 1</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、按要求将板与板拼接粘结，含开孔、上插销、黏胶、清理；</span><span
								lang=EN-US><br> 2</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、器具损耗已包含在单价内</span>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 68.25pt'>
						<p class=MsoNormal>
							<span lang=EN-US>m</span>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 68.25pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>
							</span>
						</p>
					</td>
					<td width=71 nowrap valign=top
						style='width: 53.2pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 68.25pt'>
						<p class=MsoNormal>
							<span lang=EN-US>10</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width: 71.0pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 68.25pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>
							</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 9; height: 54.75pt'>
					<td width=44 nowrap valign=top
						style='width: 33.2pt; border: solid black 1.0pt; mso-border-themecolor: text1; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span lang=EN-US>8</span>
						</p>
					</td>
					<td width=244 valign=top
						style='width: 183.0pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>石材磨边</span><span
								lang=EN-US><br> </span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>【工作内容】</span><span
								lang=EN-US><br> 1</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、按要求打磨出光面效果并与大面一致</span><span
								lang=EN-US><br> 2</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、器具损耗已包含在单价内</span>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span lang=EN-US>m</span>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>
							</span>
						</p>
					</td>
					<td width=71 nowrap valign=top
						style='width: 53.2pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span lang=EN-US>5</span>
						</p>
					</td>
					<td width=95 nowrap valign=top
						style='width: 71.0pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>
							</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 10; height: 54.75pt'>
					<td width=44 nowrap valign=top
						style='width: 33.2pt; border: solid black 1.0pt; mso-border-themecolor: text1; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span lang=EN-US>9</span>
						</p>
					</td>
					<td width=244 valign=top
						style='width: 183.0pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>石材倒角、拉槽</span><span
								lang=EN-US><br> </span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>【工作内容】</span><span
								lang=EN-US><br> 1</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、按照现场确认角度、深度开角、拉槽。</span><span
								lang=EN-US><br> 2</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、器具损耗包含在单价内</span>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span lang=EN-US>m</span>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>
							</span>
						</p>
					</td>
					<td width=71 nowrap valign=top
						style='width: 53.2pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span lang=EN-US>5</span>
						</p>
					</td>
					<td width=95 nowrap valign=top
						style='width: 71.0pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 54.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>
							</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 11; height: 63.75pt'>
					<td width=44 nowrap valign=top
						style='width: 33.2pt; border: solid black 1.0pt; mso-border-themecolor: text1; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 63.75pt'>
						<p class=MsoNormal>
							<span lang=EN-US>10</span>
						</p>
					</td>
					<td width=244 valign=top
						style='width: 183.0pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 63.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>圆弧板加工</span><span
								lang=EN-US><br> </span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>【工作内容】</span><span
								lang=EN-US><br> 1</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、按现场实际要求弧度形状切边、倒角、磨边</span><span
								lang=EN-US><br> 2</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、器具损耗已包含在单价内</span><span
								lang=EN-US><span style='mso-spacerun: yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</span>3</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、圆弧板以成品工程量计算</span>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 63.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>㎡</span>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 63.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>
							</span>
						</p>
					</td>
					<td width=71 nowrap valign=top
						style='width: 53.2pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 63.75pt'>
						<p class=MsoNormal>
							<span lang=EN-US>25</span>
						</p>
					</td>
					<td width=95 nowrap valign=top
						style='width: 71.0pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 63.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>
							</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 12; height: 66.75pt'>
					<td width=44 nowrap valign=top
						style='width: 33.2pt; border: solid black 1.0pt; mso-border-themecolor: text1; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 66.75pt'>
						<p class=MsoNormal>
							<span lang=EN-US>11</span>
						</p>
					</td>
					<td width=244 valign=top
						style='width: 183.0pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 66.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>现场板材加工</span><span
								lang=EN-US><br> </span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>【工作内容】</span><span
								lang=EN-US><br> 1</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、开具规格板，倒角开槽另外计算</span><span
								lang=EN-US><br> 2</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>、单栋板材现场加工面积在总面积</span><span
								lang=EN-US>5%</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>以内属于正常切割，</span><span
								lang=EN-US>5%</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>以上的部分属签证部分。</span>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 66.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>㎡</span>
						</p>
					</td>
					<td width=57 nowrap valign=top
						style='width: 42.85pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 66.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>
							</span>
						</p>
					</td>
					<td width=71 nowrap valign=top
						style='width: 53.2pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 66.75pt'>
						<p class=MsoNormal>
							<span lang=EN-US>25</span>
						</p>
					</td>
					<td width=95 nowrap valign=top
						style='width: 71.0pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 66.75pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>
							</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow: 13; mso-yfti-lastrow: yes; height: 27.0pt'>
					<td width=568 colspan=6 valign=top
						style='width: 426.1pt; border: solid black 1.0pt; mso-border-themecolor: text1; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 27.0pt'>
						<p class=MsoNormal>
							<span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>备注：一类工挂石单价按</span><span
								lang=EN-US>280</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>元</span><span
								lang=EN-US>/</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>工日计算，骨架工按</span><span
								lang=EN-US>200</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>元</span><span
								lang=EN-US>/</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>工日，二类工按</span><span
								lang=EN-US>150</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>元</span><span
								lang=EN-US>/</span><span
								style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin'>工日计算，如有合同单价的已合同约定为准，不属于计日工的按相应计算方式执行。</span>
						</p>
					</td>
				</tr>
			</table>

		</div>

	</body>
</div>
</html>
