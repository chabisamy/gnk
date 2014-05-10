<%@ page import="org.gnk.selectintrigue.Plot" %>

<div class="tabbable tabs-left plotScreen">
    <ul class="nav nav-tabs leftUl">
        <li class="active leftMenuList">
            <a href="#" data-toggle="tab">
                <g:message code="redactintrigue.generalDescription.newElements" default="New elements"/>
            </a>
        </li>
        <li class="leftMenuList">
            <input data-entity="resource" data-label="important" type="text"
                   placeholder="<g:message code="redactintrigue.generalDescription.newObject" default="Create object"/>"/>
        </li>
        <li class="leftMenuList">
            <input data-entity="place" data-label="warning" type="text"
                   placeholder="<g:message code="redactintrigue.generalDescription.newPlace" default="Create place"/>"/>
        </li>
        <li class="leftMenuList">
            <input data-entity="role" data-label="success" type="text"
                   placeholder="<g:message code="redactintrigue.generalDescription.newRole" default="Create role"/>"/>
        </li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane active" id="newEvent">
            <g:form method="post" class="savePlotForm">
                <g:hiddenField name="id" value="${plotInstance?.id}"/>
                <g:hiddenField name="version" value="${plotInstance?.version}"/>
                <g:hiddenField name="screenStep" value="0"/>
                <g:hiddenField name="plotDescription" value=""/>
                <div class="row formRow">
                    <div class="span1">
                        <label for="name">
                            <g:message code="redactintrigue.generalDescription.plotName" default="Name"/>
                        </label>
                    </div>

                    <div class="span8">
                        <g:textField name="name" value="${plotInstance?.name}" required="" class="inputLargeWidth"/>
                    </div>
                </div>

                <div class="row formRow">
                    <div class="span1">
                        <label>
                            <g:message code="redactintrigue.generalDescription.plotUnivers" default="Universes"/>
                        </label>
                    </div>

                    <div class="span4">
                        <a href="#universesModal" class="btn" data-toggle="modal">
                            <g:message code="redactintrigue.generalDescription.chooseUniverses" default="Chooses universes"/>
                        </a>
                    </div>

                    <div class="span1">
                        <label>
                            <g:message code="redactintrigue.generalDescription.tags" default="Tags"/>
                        </label>
                    </div>

                    <div class="span4">
                        <a href="#tagsModal" class="btn" data-toggle="modal">
                            <g:message code="redactintrigue.generalDescription.chooseTags" default="Chooses tags"/>
                        </a>
                    </div>
                </div>

                <div class="row formRow">
                    <div class="span2">
                        <label for="isPublic">
                            <g:message code="redactintrigue.generalDescription.isPublic" default="Public"/>
                        </label>
                    </div>

                    <div class="span1">
                        <g:checkBox id="isPublic" name="isPublic" checked="${plotInstance.isPublic}"/>
                    </div>

                    <div class="span2">
                        <label for="isMainstream">
                            <g:message code="redactintrigue.generalDescription.isMainstream" default="Mainstream"/>
                        </label>
                    </div>

                    <div class="span1">
                        <g:checkBox name="isMainstream" id="isMainstream" checked="${plotInstance.isMainstream}"/>
                    </div>

                    <div class="span2">
                        <label for="isEvenemential">
                            <g:message code="redactintrigue.generalDescription.isEvenemential" default="Evenemential"/>
                        </label>
                    </div>

                    <div class="span1">
                        <g:checkBox name="isEvenemential" id="isEvenemential" checked="${plotInstance.isEvenemential}"/>
                    </div>
                </div>

                <div class="row formRow text-center">
                    <label>
                        <g:message code="redactintrigue.generalDescription.plotDescription" default="Plot Description"/>
                    </label>
                </div>
                %{--<g:textArea name="plotDescription" id="plotDescription" value="${plotInstance.description}" rows="5"--}%
                            %{--cols="100"/>--}%
                %{--<g:render template="richTextEditor" model="['description':${plotInstance.description}]"/>--}%


                <!-- navbar des différentes catégories d'objets insérables -->
                <div class="btn-group">
                    <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
                        Personnage <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu roleSelector">
                        <g:each in="${plotInstance.roles}" status="i5" var="role">
                            <li data-id="${role.id}">
                                <a onclick="setCarretPos(); pasteHtmlAtCaret('<span class=&quot;label label-success&quot; contenteditable=&quot;false&quot;>${role.code}</span>'); return false;">
                                    ${role.code}
                                </a>
                            </li>
                        </g:each>
                    </ul>
                </div>

                <div class="btn-group">
                    <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">
                        Lieu <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu placeSelector">
                        <g:each in="${plotInstance.genericPlaces}" status="i5" var="genericPlace">
                            <li>
                                <a onclick="setCarretPos(); pasteHtmlAtCaret('<span class=&quot;label label-warning&quot; contenteditable=&quot;false&quot;>${genericPlace.code}</span>'); return false;">
                                    ${genericPlace.code}
                                </a>
                            </li>
                        </g:each>
                    </ul>
                </div>

                <div class="btn-group">
                    <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
                        Objet <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu resourceSelector">
                        <g:each in="${plotInstance.genericResources}" status="i5" var="genericResource">
                            <li>
                                <a onclick="setCarretPos(); pasteHtmlAtCaret('<span class=&quot;label label-important&quot; contenteditable=&quot;false&quot;>${genericResource.code}</span>'); return false;">
                                    ${genericResource.code}
                                </a>
                            </li>
                        </g:each>
                    </ul>
                </div>

                <!-- Editor -->
                <div id="plotRichTextEditor" contenteditable="true" class="text-left richTextEditor" onblur="saveCarretPos($(this).attr('id'))"
                     style="margin-top:15px; padding:5px; height:200px; overflow:auto; border:solid 1px #808080; -moz-border-radius:20px 0;
                     -webkit-border-radius:20px 0; border-radius:20px 0; margin-bottom: 10px;">
                    ${plotInstance.description.encodeAsHTML()}
                </div>


                <div id="universesModal" class="modal hide fade" tabindex="-1">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h3><g:message code="redactintrigue.generalDescription.plotUnivers" default="Universes"/></h3>
                    </div>

                    <div class="modal-body">
                        <ul>
                            <g:each in="${universList}" status="i" var="universInstance">
                                <li class="modalLi">
                                    <label for="universes_${universInstance.id}">
                                        <g:checkBox name="universes_${universInstance.id}"
                                                    id="universes_${universInstance.id}"
                                                    checked="${plotInstance.hasUnivers(universInstance)}"/>
                                        ${fieldValue(bean: universInstance, field: "name")}
                                    </label>
                                </li>
                            </g:each>
                        </ul>
                    </div>

                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal">Ok</button>
                    </div>
                </div>

                <div id="tagsModal" class="modal hide fade" tabindex="-1">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h3>Tags</h3>
                        <input class="input-medium search-query" data-content="plotTags"
                               placeholder="<g:message code="redactintrigue.generalDescription.search" default="Search..."/>"/>
                    </div>

                    <div class="modal-body">
                        <ul class="plotTags">
                            <g:each in="${plotTagList}" status="i" var="plotTagInstance">
                                <li class="modalLi" data-name="${plotTagInstance.name.toLowerCase()}">
                                    <label for="tags_${plotTagInstance.id}" style="float: left"><g:checkBox
                                        name="tags_${plotTagInstance.id}"
                                        id="tags_${plotTagInstance.id}"
                                        onClick="toggle('tags_${plotTagInstance?.id}', 'weight_tags_${plotTagInstance?.id}')"
                                        checked="${plotInstance.hasPlotTag(plotTagInstance)}"/> ${fieldValue(bean: plotTagInstance, field: "name")}</label>

                                    <div style="overflow: hidden; padding-left: .5em;" class="text-right">
                                        <g:if test="${plotInstance.hasPlotTag(plotTagInstance)}">
                                            <g:set var="tagValue" value="${plotInstance.getTagWeight(plotTagInstance)}"
                                                   scope="page"/>
                                        </g:if>
                                        <g:if test="${!plotInstance.hasPlotTag(plotTagInstance)}">
                                            <g:set var="tagValue" value="50" scope="page"/>
                                        </g:if>
                                        <input id="weight_tags_${plotTagInstance?.id}"
                                               name="weight_tags_${plotTagInstance?.id}" value="${tagValue}"
                                               type="number" style="width:40px;"/>
                                    </div>
                                    <script>
                                        toggle('tags_${plotTagInstance?.id}', 'weight_tags_${plotTagInstance?.id}')
                                    </script>
                                </li>
                            </g:each>
                        </ul>
                    </div>

                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal">Ok</button>
                    </div>
                </div>
                <fieldset class="buttons text-center">
                    <g:actionSubmit class="save btn btn-primary" action="update"
                                    value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                    <g:actionSubmit class="delete btn btn-danger" action="delete"
                                    value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                    formnovalidate=""
                                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                </fieldset>
            </g:form>
        </div>
    </div>
</div>