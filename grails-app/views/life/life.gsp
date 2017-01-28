<%@ page import="org.gnk.roletoperso.Role"%>
<%@ page import="org.gnk.roletoperso.Character"%>
<%@ page import="org.gnk.selectintrigue.Plot"%>
<%@ page import="org.gnk.gn.Gn"%>
<!DOCTYPE html>
<html>
<head>
    <style type="text/css">
    th,td {
        padding: 0.3em;
        padding-left: 0.5em;
        margin: 0.3em;
    }

    .tab-pane.active {
        height: 350pt;
    }
    </style>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'gn.label', default: 'GN')}" />
    %{--<title><g:message code="gn.edition" /></title>--}%
    <title>Vie des personnages</title>
</head>
<body>
<div id="edit-plot" class="content scaffold-list" role="main">
    <g:render template="../stepBarProgress/stepProgressBar" model="[currentStep='life']"/>

    <h1>Vie du personnage</h1>
    <g:render template="result" model="[gnInstance : gnInstance, characterListLife : characterListLife, PHJList : PHJList]"/>
</div>
</body>
</html>