<%--
  Created by IntelliJ IDEA.
  User: Xavier
  Date: 28/06/2016
  Time: 18:16
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <link href="${resource(dir: 'css', file: 'substitution.css')}" type="text/css" rel="stylesheet"/>
    <title><g:message code="ressource.title" /></title>
</head>

<body>
<g:render template="../stepBarProgress/stepProgressBar" model="[currentStep='ressource']"/>
<h1><g:message code="resource.index.label" default="Ressource Module"/></h1>
<div id="subAlertContainer">
</div>

<g:hiddenField name="gnId" value="${gnId}"/>
%{--<div class="form-actions">
    <g:link action="getBack" id="${gnId}" class="btn btn-primary pull-right"><g:message code="default.back.label" default="Back"/></g:link>
    <button id="publication" onclick="return publicationAccess()" class="btn btn-primary" action="index">
        ${message(code: 'navbar.place', default: 'Place')}</button>
</div>--}%

<g:render template="../naming/gnInformation" />
<g:render template="resources" />

<g:javascript src="naming/sub.js" />

<script type="text/javascript">
    function publicationAccess()
    {
        //var isCharsReady = prepareCharsJSONForValidation(charsJSON);
        var isResourcesReady = prepareResourcesJSONForValidation(resourcesJSON);
        //var isPlacesReady = preparePlacesJSONForValidation(placesJSON);
        //var isDatesReady = prepareDatesJSONForValidation(datesJSON);
        if (/*isCharsReady && */isResourcesReady /*&& isPlacesReady && isDatesReady*/) {
            // SubJSON construction
            var subJSON = new Object();
            subJSON.gnDbId = ${gnInfo.id};
            //subJSON.subCharacter = charsJSON.characters;
            subJSON.subResource = resourcesJSON.resources;
            //subJSON.subPlace = placesJSON.places;
            //subJSON.subDate = datesJSON;

            // Form creation and submit
            var form = $("<form>");
            form.attr({method: "POST", action: "${g.createLink(controller:'ressource', action:'validateRessource')}"});
            var inputJSON = $("<input>");
            inputJSON.attr({type: "hidden", name: "subJSON", value: JSON.stringify(subJSON)});
            form.append(inputJSON);
            $("body").append(form);
            form.submit();
            return true
        }
        else
        {
            addAlert("subAlertContainer", "alert alert-error", "Erreur",
                    "La substitution des ressources doit être complète pour être validée.")
            return false
        }
    }
</script>
</body>
</html>