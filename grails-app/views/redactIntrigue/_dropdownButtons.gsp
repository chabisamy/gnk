<!-- navbar des différentes catégories d'objets insérables -->
<div class="btn-group">
    <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
        Personnage <span class="caret"></span>
    </button>
    <ul class="dropdown-menu placeSelector">
        <g:each in="${plotInstance.roles}" status="i5" var="role">
            <g:if test="${!(role.type == "STF")}">
                <li data-id="${role.id}">
                    <a class="buttonRichTextEditor" href="#">
                        ${role.code}
                    </a>
                </li>
            </g:if>
        </g:each>
        <li>
            <input data-entity="role" data-label="success" type="text" class="inputOther" id="roleOther"
                   placeholder="<g:message code="redactintrigue.generalDescription.other" default="Other"/>"/>
        </li>
    </ul>
</div>

<div class="btn-group">
    <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">
        Lieu <span class="caret"></span>
    </button>
    <ul class="dropdown-menu placeSelector">
        <g:each in="${gnConstantPlaceList}" status="i5" var="gnConstantPlace">
            <li data-id="${gnConstantPlace.id}">
                <a class="buttonRichTextEditor btn-info gnPlaceSelector">
                    ${gnConstantPlace.name}
                </a>
            </li>
        </g:each>
        <g:each in="${plotInstance.genericPlaces}" status="i5" var="genericPlace">
            <li data-id="${genericPlace.id}">
                <a class="buttonRichTextEditor">
                    ${genericPlace.code}
                </a>
            </li>
        </g:each>
        <li>
            <input data-entity="place" data-label="warning" type="text" class="inputOther" id="placeOther"
                   placeholder="<g:message code="redactintrigue.generalDescription.other" default="Other"/>"/>
        </li>
    </ul>
</div>



<div class="btn-group">
    <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
        Ressource <span class="caret"></span>
    </button>
    <ul class="dropdown-menu resourceSelector">
        <g:each in="${gnConstantResourceList}" status="i5" var="gnConstantResource">
            <li data-id="${gnConstantResource.id}">
                <a class="buttonRichTextEditor btn-info gnPlaceSelector">
                    ${gnConstantResource.name}
                </a>
            </li>
        </g:each>
        <g:each in="${plotInstance.genericResources}" status="i5" var="genericResource">
            <li data-id="${genericResource.id}">
                <a class="buttonRichTextEditor">
                    ${genericResource.code}
                </a>
            </li>
        </g:each>
        <li>
            <input data-entity="resource" data-label="important" type="text" class="inputOther" id="resourceOther"
                   placeholder="<g:message code="redactintrigue.generalDescription.other" default="Other"/>"/>
        </li>
    </ul>
</div>

<div class="btn-group">
    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
        Date et heure <span class="caret"></span>
    </button>
    <ul class="dropdown-menu buttonRichTextEditor">
        <li data-id="0">
            <a class="buttonRichTextEditor gnDateButton">
                GN-Date
            </a>
        </li>
        <li data-id="1">
            <a class="buttonRichTextEditor gnDateButton">
                GN-Heure
            </a>
        </li>

    </ul>
</div>


<div class="btn-group">
    <div class="btnFullScreen"></div>
</div>