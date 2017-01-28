<%@ page import="groovy.json.JsonBuilder; org.codehaus.groovy.grails.web.json.JSONObject; org.gnk.roletoperso.RoleHasRelationWithRole; org.gnk.roletoperso.Role" %>
<%@ page import="org.gnk.roletoperso.Character" %>
<%@ page import="org.gnk.selectintrigue.Plot" %>
<%@ page import="org.gnk.gn.Gn" %>
<style>
.panel-default > .panel-heading {
    color: #333333;
    background-color: #f5f5f5;
    font-weight: bold;
    border: 1px solid #dddddd;
}

.panel-heading {
    padding: 10px 15px;
    border-bottom: 1px solid transparent;
    border-top-right-radius: 3px;
    border-top-left-radius: 3px;
}

.table-bordered-no-top {
    border: 1px solid #dddddd;
    border-collapse: separate;
    *border-collapse: collapse;
    border-left: 0;
    border-top: 0px;
    border-top-left-radius: 0px;
    border-top-right-radius: 0px;
    margin-bottom: 0;

}

.table-bordered-no-top th,
.table-bordered-no-top td {
    border-left: 1px solid #dddddd;
}
</style>

<h3>
    <g:message code="roletoperso.result"
               default="RoleToPerso result"/>
</h3>
<g:form method="post">
    <g:hiddenField name="gnId" value="${gnInstance?.id}"/>
    <g:hiddenField name="gnDTD" value="${gnInstance?.dtd}"/>
    <g:hiddenField name="version" value="${gnInstance?.version}"/>
    <div class="container-fluid">
        <g:if test="${(tagcompatibility != null) || (tagrelationcompatibility != null)}">
            <br/>
            <div class="accordion" id="accordionStat">
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse"
                           data-parent="#accordionStat"
                           href="#collapseStat">
                            <g:message code="roletoperso.Stat"
                                       default="Tag Relation Problems"/>
                        </a>
                    </div>
                    <div id="collapseStat" class="accordion-body collapse">
                        <div class="accordion-inner">
                            <g:if test="${tagcompatibility != null}">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>Character</th>
                                        <th>Tag1 - Name</th>
                                        <th>Tag1 - Valeur</th>
                                        <th>Tag2 - Name</th>
                                        <th>Tag2 - Valeur</th>
                                        <th>Compatibilité</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <g:each in="${tagcompatibility}" var="string">
                                        <tr>
                                            <td>CHAR-${((String)string).split("#")[0]}</td>
                                            <td>${((String)string).split("#")[1]}</td>
                                            <td>${((String)string).split("#")[2]}</td>
                                            <td>${((String)string).split("#")[3]}</td>
                                            <td>${((String)string).split("#")[4]}</td>
                                            <g:if test="${Integer.parseInt(((String)string).split("#")[5]) < -50}">
                                                <td style="background-color: #F2DEDE">${((String)string).split("#")[5]} %</td>
                                            </g:if>
                                            <g:else>
                                                <td style="background-color: #FCF8E3">${((String)string).split("#")[5]} %</td>
                                            </g:else>
                                        </tr>
                                    </g:each>
                                    </tbody>
                                </table>
                            </g:if>

                            <g:if test="${tagrelationcompatibility != null}">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>Character</th>
                                        <th>Relation 1</th>
                                        <th>Relation 2</th>
                                        <th>Compatibilité</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <g:each in="${tagrelationcompatibility}" var="string">
                                        <tr>
                                            <td>CHAR-${((String)string).split("#")[0]}</td>
                                            <td>${((String)string).split("#")[1]}</td>
                                            <td>${((String)string).split("#")[2]}</td>
                                            <g:if test="${Integer.parseInt(((String)string).split("#")[3]) < -50}">
                                                <td style="background-color: #F2DEDE">${((String)string).split("#")[3]} %</td>
                                            </g:if>
                                            <g:else>
                                                <td style="background-color: #FCF8E3">${((String)string).split("#")[3]} %</td>
                                            </g:else>
                                        </tr>
                                    </g:each>
                                    </tbody>
                                </table>
                            </g:if>
                        </div>
                    </div>
                </div>
            </div>
        </g:if>
        <g:each in="${characterList}" status="characterIter" var="character">

            <g:if test="${characterIter % 2 == 0}">
                <div class="row-fluid">
            </g:if>
            <div class="span6" id="Char${character.DTDId}">
                <div class="panel panel-default">
                    <div class="panel-heading" style="margin-top: 20px">
                        <g:message code="roletoperso.character"
                                   default="Character"/> ${character.DTDId}
                        <div class="pull-right" style="margin-top: -5px">
                            <g:if test="${((Character) character).getGender() == 'M'}">
                                <div class="btn-group text-center radio_sexe" data-toggle="buttons-radio" data-id="${character.DTDId}">
                                    <button type="button" class="btn active">Homme</button>
                                    <button type="button" class="btn">Neutre</button>
                                    <button type="button" class="btn">Femme</button>
                                </div>
                            </g:if>
                            <g:elseif test="${((Character) character).getGender() == 'F'}">
                                <div class="btn-group text-center radio_sexe" data-toggle="buttons-radio" data-id="${character.DTDId}">
                                    <button type="button" class="btn">Homme</button>
                                    <button type="button" class="btn">Neutre</button>
                                    <button type="button" class="btn active">Femme</button>
                                </div>
                            </g:elseif>
                            <g:else>
                                <div class="btn-group text-center radio_sexe" data-toggle="buttons-radio" data-id="${character.DTDId}">
                                    <button type="button" class="btn">Homme</button>
                                    <button type="button" class="btn active">Neutre</button>
                                    <button type="button" class="btn">Femme</button>
                                </div>
                            </g:else>
                        </div>
                    </div>

                    <div style="overflow: auto; max-height:150px;">
                        <table class="table table-bordered-no-top">
                            <thead>
                            <tr>
                                <th><g:message code="roletoperso.roleCode"
                                               default="Role code"/></th>
                                <th><g:message code="selectintrigue.plotName"
                                               default="Plot name"/></th>
                                <th width="25"><g:img dir="images/selectIntrigue"
                                                      file="locked.png"/></th>
                                <th width="25"><g:img dir="images/selectIntrigue"
                                                      file="forbidden.png"/></th>
                                <th width="25"><g:img dir="images/selectIntrigue"
                                                      file="validate.png"/></th>
                                <th width="50" align="center"><g:img dir="images/selectIntrigue"
                                                                     file="locked.png"/> <g:message code="roletoperso.character"
                                                                                                    default="Character"/></th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${((Character) character).specificRoles}" status="roleIter" var="role">
                                <g:if test="${((Role) role).code} != Life">
                                    <tr class="${(roleIter % 2) == 0 ? 'even' : 'odd'}">

                                        <td>
                                            <a href="#roleModal-${((Role) role).getDTDId()}"  data-toggle="modal"
                                               title="${((Role) role).description}">${((Role) role).code}</a>
                                            <g:render template="roleModal" model="['role': role]" />
                                        </td>
                                        <td><g:link controller="redactIntrigue" action="edit"
                                                    id="${((Role) role).plot?.id}" target="_blank">
                                            ${((Role) role).plot?.name}
                                        </g:link></td>
                                        <g:if test="${((Character) character).roleIsLocked(((Role) role))}">
                                            <g:set var="selectedRadioButtonLock" value="${1}"/>
                                        </g:if>
                                        <g:else>
                                            <g:set var="selectedRadioButtonLock" value="${3}"/>
                                        </g:else>
                                        <g:radioGroup
                                                name="role_status_${((Character) character).DTDId}_${((Plot) ((Role) role).plot).DTDId}_${((Role) role).DTDId}"
                                                values="[1, 2, 3]"
                                                value="${selectedRadioButtonLock}">
                                            <td align="center">
                                                ${it.radio}
                                            </td>
                                        </g:radioGroup>
                                        <td align="center">
                                            <g:select style="width: 140px"
                                                      name="lock_on_${((Character) character).DTDId}_${((Plot) ((Role) role).plot).DTDId}_${((Role) role).DTDId}"
                                                      id="lock_on_${((Character) character).DTDId}_${((Plot) ((Role) role).plot).DTDId}_${((Role) role).DTDId}"
                                                      from="${characterListToDropDownLock}"
                                                      keys="${characterListToDropDownLock}"/>
                                        </td>
                                    </tr>
                                </g:if>
                            </g:each>
                            <!-- Start NJA Work Step0 -->
                            <g:each in="${((Character) character).getSelectedPJG()}" status="roleIter" var="role">
                                <tr class="${(roleIter % 2) == 0 ? 'even' : 'odd'} warning">

                                    <td>
                                        <a href="#"
                                           title="${((Role) role).description}">${((Role) role).code}</a>
                                    </td>
                                    <td><g:link controller="redactIntrigue" action="edit"
                                                id="${((Role) role).plot?.id}" target="_blank">
                                        ${((Role) role).plot?.name}
                                    </g:link></td>
                                    <g:if test="${((Character) character).roleIsLocked(((Role) role))}">
                                        <g:set var="selectedRadioButtonLock" value="${1}"/>
                                    </g:if>
                                    <g:else>
                                        <g:set var="selectedRadioButtonLock" value="${3}"/>
                                    </g:else>
                                    <g:radioGroup
                                            name="role_status_${((Character) character).DTDId}_${((Plot) ((Role) role).plot).DTDId}_${((Role) role).DTDId}"
                                            values="[1, 2, 3]"
                                            value="${selectedRadioButtonLock}">
                                        <td align="center">
                                            ${it.radio}
                                        </td>
                                    </g:radioGroup>
                                    <td align="center">
                                        <g:select style="width: 140px"
                                                  name="lock_on_${((Character) character).DTDId}_${((Plot) ((Role) role).plot).DTDId}_${((Role) role).DTDId}"
                                                  id="lock_on_${((Character) character).DTDId}_${((Plot) ((Role) role).plot).DTDId}_${((Role) role).DTDId}"
                                                  from="${characterListToDropDownLock}"
                                                  keys="${characterListToDropDownLock}"/>
                                    </td>
                                </tr>
                            </g:each>
                            <!-- End NJA Work Step0 -->
                            </tbody>
                        </table>
                    </div>

                    <div class="accordion" style="margin-bottom: 0" id="accordionStat${characterIter}">
                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a class="accordion-toggle" data-toggle="collapse"
                                   data-parent="#accordionStat${characterIter}"
                                   href="#collapseStat${characterIter}"><g:message
                                        code="selectintrigue.step1.statistics" default="Statistics"/>
                                </a>
                            </div>

                            <div id="collapseStat${characterIter}" class="accordion-body collapse">
                                <div class="accordion-inner">
                                    <table>
                                        <thead>
                                        <tr>
                                            <th></th>
                                            <th><g:message code="selectintrigue.step1.stat.result"
                                                           default="Result"/></th>
                                        </tr>
                                        </thead>

                                        <tr>
                                            <td>
                                                <g:message code="roletoperso.nbpip"
                                                           default="PIP Number"/>
                                            </td>
                                            <td>
                                                ${character.getNbPIP()}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <g:message code="roletoperso.persoGender"
                                                           default="Gender"/>
                                            </td>
                                            <td>
                                                ${character.getGender()}
                                            </td>
                                        </tr>
                                        <g:each in="${character.getTags()}" status="i" var="entryMap">
                                            <tr>
                                                <td>
                                                    ${entryMap.getKey()}
                                                </td>
                                                <td>
                                                    ${entryMap.getValue()}%
                                                </td>
                                            </tr>
                                        </g:each>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="accordion" id="accordionRelations${characterIter}">
                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a class="accordion-toggle" data-toggle="collapse"
                                   data-parent="#accordionRelations${characterIter}"
                                   href="#collapseRelations${characterIter}"><g:message
                                        code="roletoperso.relations" default="Relations"/>
                                </a>
                            </div>

                            <div id="collapseRelations${characterIter}" class="accordion-body collapse">
                                <div class="accordion-inner">
                                    <div style="overflow: auto; max-height:150px;">
                                        <table class="table table-bordered">
                                            <thead>
                                            <tr>
                                                <th><g:message code="roletoperso.from"
                                                               default="From"/></th>
                                                <th><g:message code="roletoperso.to"
                                                               default="To"/></th>
                                                <th><g:message code="selectintrigue.plotName"
                                                               default="Plot name"/></th>
                                                <th><g:message code="roletoperso.relation"
                                                               default="Relation"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <g:each in="${((Character) character).getRelations(false)?.keySet()}" status="roleIter"
                                                    var="roleHasRelationWithRole">
                                                <tr class="${(roleIter % 2) == 0 ? 'even' : 'odd'}">

                                                    <td>
                                                        <g:set var="characterRel"
                                                               value="${gnInstance?.getCharacterContainingRole(roleHasRelationWithRole.getterRole1())?.DTDId}"/>

                                                        <a href="#Char${characterRel}">P${characterRel}:&#160;${((RoleHasRelationWithRole) roleHasRelationWithRole).getterRole1().code}</a>
                                                    </td>
                                                    <td>
                                                        <g:set var="characterRel"
                                                               value="${gnInstance?.getCharacterContainingRole(roleHasRelationWithRole.getterRole2())?.DTDId}"/>
                                                        <a href="#Char${characterRel}">P${characterRel}:&#160;${((RoleHasRelationWithRole) roleHasRelationWithRole).getterRole2().code}</a>
                                                    </td>
                                                    <td><g:link controller="redactIntrigue" action="edit"
                                                                id="${((Role) ((RoleHasRelationWithRole) roleHasRelationWithRole).getterRole1()).plot?.id}"
                                                                target="_blank">
                                                        ${((Role) ((RoleHasRelationWithRole) roleHasRelationWithRole).getterRole1()).plot?.name}
                                                    </g:link></td>
                                                    <td>
                                                        ${((RoleHasRelationWithRole) roleHasRelationWithRole).getterRoleRelationType().name}
                                                    </td>
                                                </tr>
                                            </g:each>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="accordion" id="accordionBannedRoles${characterIter}">
                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a class="accordion-toggle" data-toggle="collapse"
                                   data-parent="#accordionBannedRoles${characterIter}"
                                   href="#collapseBannedRoles${characterIter}"><g:message
                                        code="roletoperso.bannedRoles" default="Banned roles"/>
                                </a>
                            </div>

                            <div id="collapseBannedRoles${characterIter}" class="accordion-body collapse">
                                <div class="accordion-inner">
                                    <div style="overflow: auto; max-height:150px;">
                                        <table class="table table-bordered">
                                            <thead>
                                            <tr>
                                                <th><g:message code="roletoperso.roleCode"
                                                               default="Role code"/></th>
                                                <th><g:message code="selectintrigue.plotName"
                                                               default="Plot name"/></th>
                                                <th width="25"><g:img dir="images/selectIntrigue"
                                                                      file="forbidden.png"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <g:each in="${((Character) character).bannedRoles}" status="roleIter"
                                                    var="role">
                                                <tr class="${(roleIter % 2) == 0 ? 'even' : 'odd'}">

                                                    <td>
                                                        <a href="#"
                                                           title="${((Role) role).description}">${((Role) role).code}</a>
                                                    </td>
                                                    <td><g:link controller="redactIntrigue" action="edit"
                                                                id="${((Role) role).plot?.id}" target="_blank">
                                                        ${((Role) role).plot?.name}
                                                    </g:link></td>
                                                    <td>
                                                        <g:checkBox
                                                                name="keepRoleBanned_${((Character) character).DTDId}_${((Plot) ((Role) role).plot).DTDId}_${((Role) role).DTDId}"
                                                                checked="true"/>
                                                    </td>
                                                </tr>
                                            </g:each>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
            <g:if test="${characterIter % 2 == 1}">
                </div>
            </g:if>
        </g:each>

        <g:if test="${characterList.size() % 2 == 0}">
            <div class="row-fluid">
        </g:if>
        <div class="span6">
            <br/>

            <div class="panel panel-default">
                <div class="accordion" id="accordionAll">
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse"
                               data-parent="#accordionAll"
                               href="#collapseAll">
                                <g:message code="roletoperso.gestionTPJ"
                                           default="Common roles for all characters"/>
                            </a>
                        </div>

                        <div id="collapseAll" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <div style="overflow: auto; max-height:150px;">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th><g:message code="roletoperso.roleCode"
                                                           default="Role code"/></th>
                                            <th><g:message code="selectintrigue.plotName"
                                                           default="Plot name"/></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <g:each in="${allList}" var="allrole">
                                            <tr>
                                                <td>
                                                    <a href="#"
                                                       title="${((Role) allrole).description}">${((Role) allrole).code}</a>
                                                </td>
                                                <td>
                                                    <g:link controller="redactIntrigue" action="edit"
                                                            id="${((Role) allrole).plot?.id}" target="_blank">
                                                        ${((Role) allrole).plot?.name}
                                                    </g:link>
                                                </td>
                                            </tr>
                                        </g:each>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <g:if test="${characterList.size() % 2 == 0}">
            </div>
        </g:if>
        <br/>

        <g:if test="${true}">
            <div class="row-fluid">
                <div class="span12" id="Relations">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="margin-top: 20px">
                            <g:message code="roletoperso.allRelationsSummary"
                                       default="All relations between characters summary"/>
                        </div>

                        <div style="overflow: auto; height:500px;" id="container">
                            <g:hiddenField id="relationjson" name="relationjson" value="${relationjson}"/>
                            <div id="infovis">
                            </div>
                            <div id="right-container">
                                <div id="inner-details"></div>
                            </div>
                            <g:render template="relationSummary2"></g:render>
                        </div>
                        <div class="legend">
                        </div>
                    </br>
                    </div>
                </div>
            </div>
        </g:if>

    </div>
    <div class="accordion" id="accordionPNJ">
        <div class="accordion-group">
            <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse"
                   data-parent="#accordionPNJ"
                   href="#collapsePNJ">
                    <g:message code="roletoperso.gestionPHJ"
                               default="Management of offside characters"/>
                </a>
            </div>

            <div id="collapsePNJ" class="accordion-body collapse">
                <div class="accordion-inner">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th><g:message code="roletoperso.character"
                                           default="Character"/></th>
                            <th><g:message code="roletoperso.roleCode"
                                           default="Role code"/></th>
                            <th><g:message code="roletoperso.roleType"
                                           default="Character Type"/></th>
                            <th><g:message code="roletoperso.sexe"
                                           default="Sex"/></th>
                            <th><g:message code="roletoperso.action"
                                           default="Actions"/></th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${PHJList}" var="PHJ">
                            <g:if test="${(((Character) PHJ).isPHJ() == true) || (((Character) PHJ).isPNJ() == true)}">
                                <tr id="${"line" + ((Character) PHJ).getDTDId()}">
                                    <td>CHAR-${((Character) PHJ).getDTDId()}</td>
                                    <td id="td_CHAR-${((Character) PHJ).getDTDId()}">
                                        <g:each in="${((Character) PHJ).getSelectedRoles()}" var="role">
                                            <a href="#roleModal-${((Role) role).getDTDId()}"  data-toggle="modal"
                                               title="${((Role) role).description}">${((Role) role).code}</a>
                                            <g:render template="roleModal" model="['role': role]" />
                                        </g:each>
                                    </td>
                                    <td id="td_CHAR-${((Character) PHJ).getDTDId()}-TYPE">${((Character) PHJ).type}</td>
                                    <td style="text-align: center">
                                        <g:if test="${((Character) PHJ).getGender() == 'M'}">
                                            <div class="btn-group text-center radio_sexe" data-toggle="buttons-radio" data-id="${((Character) PHJ).getDTDId()}">
                                                <button type="button" class="btn btn-primary active">Homme</button>
                                                <button type="button" class="btn btn-primary">Neutre</button>
                                                <button type="button" class="btn btn-primary">Femme</button>
                                            </div>
                                        </g:if>
                                        <g:elseif test="${((Character) PHJ).getGender() == 'F'}">
                                            <div class="btn-group text-center radio_sexe" data-toggle="buttons-radio" data-id="${((Character) PHJ).getDTDId()}">
                                                <button type="button" class="btn btn-primary">Homme</button>
                                                <button type="button" class="btn btn-primary">Neutre</button>
                                                <button type="button" class="btn btn-primary active">Femme</button>
                                            </div>
                                        </g:elseif>
                                        <g:else>
                                            <div class="btn-group text-center radio_sexe" data-toggle="buttons-radio" data-id="${((Character) PHJ).getDTDId()}">
                                                <button type="button" class="btn btn-primary">Homme</button>
                                                <button type="button" class="btn btn-primary active">Neutre</button>
                                                <button type="button" class="btn btn-primary">Femme</button>
                                            </div>
                                        </g:else>
                                    </td>
                                    <td style="text-align: center">
                                        <a href="#fusionModal"  data-toggle="modal" data-id="${((Character) PHJ).getDTDId()}" role="button" class="btn btn-primary fusion_modale">
                                            <g:message code="roletoperso.fusion" default="Merge"></g:message>
                                        </a>
                                    </td>
                                </tr>
                            </g:if>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="accordion" id="accordionSTF">
        <div class="accordion-group">
            <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse"
                   data-parent="#accordionSTF"
                   href="#collapseSTF">
                    <g:message code="roletoperso.gestionSTF"
                               default="Management of STF characters"/>
                </a>
            </div>

            <div id="collapseSTF" class="accordion-body collapse">
                <div class="accordion-inner">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th><g:message code="roletoperso.character"
                                           default="Character"/></th>
                            <th><g:message code="roletoperso.roleCode"
                                           default="Role code"/></th>
                            <th><g:message code="roletoperso.roleType"
                                           default="Character Type"/></th>
                            <th><g:message code="roletoperso.description"
                                           default="Description"/></th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${STFList}" var="STF">
                            <g:if test="${(((Character) STF).isSTF() == true)}">
                                <tr id="${"line" + ((Character) STF).getDTDId()}">
                                    <td>CHAR-${((Character) STF).getDTDId()}</td>
                                    <td>
                                        <a href="#roleModal-${((Character) STF).getSelectedRoles().first().getDTDId()}"  data-toggle="modal"
                                           title="${((Character) STF).getSelectedRoles().first().description}">${((Character) STF).getSelectedRoles().first().code}</a>
                                        <g:render template="roleModal" model="['role': ((Character) STF).getSelectedRoles().first()]" />
                                    </td>
                                    <td>${((Character) STF).type}</td>
                                    <td>${((Character) STF).getSelectedRoles().first().description}</td>
                                </tr>
                            </g:if>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div id="fusionModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="fusionModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="fusionModalLabel">Fusion de Personnages Non Joués et Hors Jeu</h3>
        </div>
        <div class="modal-body">
            <div class="row-fluid">
                <div class="span4">
                    <h4 id="modalPHJ1">Personnage 1</h4>
                </div>
                <div class="span3">
                    <i class="icon-chevron-right"></i>
                    <i class="icon-chevron-right"></i>
                    <i class="icon-chevron-right"></i>
                </div>
                <div class="span5">
                    <select id="modaloption" class="form-control">
                        <option value="" disabled selected style='display:none;'>Fusionner avec ...</option>
                        <g:each in="${PHJList}" var="player">
                            <g:if test="${(((Character) player).isPHJ() == true) || (((Character) player).isPNJ() == true)}">
                                <option value="${'CHAR-' + ((Character) player).getDTDId()}" id="${'CHAR-' + ((Character) player).getDTDId()}" class="optionschar hidden">CHAR-${((Character) player).getDTDId()}</option>
                            </g:if>
                        </g:each>
                    </select>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">Annuler</button>
            <a id="merge" type="button" href="#" class="btn btn-primary" data-gn="${gnInstance?.id}" data-url="${createLink(controller: "RoleToPerso", action: "Merge")}">
                <g:message code="roletoperso.fusion" default="Merge"></g:message>
            </a>
        </div>
    </div>
    %{--<div class="form-actions">--}%
    <div class="form-inline">

    <g:hiddenField name="selectedEvenemential" class="selectedEvenemential" value="${evenementialId}"/>
    <g:hiddenField name="selectedMainstream" class="selectedMainstream" value="${mainstreamId}"/>
    <div class="span1">
        <g:actionSubmit class="btn btn-primary" action="roleToPerso"
                        value="${message(code: 'selectintrigue.step1.reload', default: 'Reload')}"/>
    </div>
</g:form>


<g:form method="post" controller="life" name="form-life">
    <g:each in="${characterList}" var="PHJ">
        <g:hiddenField id="${"sexe_" + ((Character) PHJ).getDTDId()}" name="sexe" value="NO"/>
    </g:each>
    <g:each in="${PHJList}" var="PHJ">
        <g:hiddenField id="${"sexe_" + ((Character) PHJ).getDTDId()}" name="sexe" value="NO"/>
    </g:each>
    <g:hiddenField name="gnId" value="${gnInstance?.id}"/>
    <g:hiddenField name="_action_life" value="Life"/>
    </div>
</g:form>

<g:form method="post" controller="naming" name="form-naming">
    <g:each in="${characterList}" var="PHJ">
        <g:hiddenField id="${"sexe_" + ((Character) PHJ).getDTDId()}" name="sexe" value="NO"/>
    </g:each>
    <g:each in="${PHJList}" var="PHJ">
        <g:hiddenField id="${"sexe_" + ((Character) PHJ).getDTDId()}" name="sexe" value="NO"/>
    </g:each>
    <g:hiddenField name="gnId" value="${gnInstance?.id}"/>
    <g:hiddenField name="_action_index" value="${message(code: 'navbar.naming', default: 'Naming')}"/>
</g:form>
</div>
%{--</div>--}%

<script>
    $(".fusion_modale").click(function() {
        var id_p1 = $(this).attr("data-id");
        $("#modalPHJ1").html("CHAR-" + id_p1);
        var selected = false;
        var option_name = "#CHAR-" + id_p1;
        $(".optionschar").each(function() {
            if (($(this).attr("id") == option_name) && (selected == false))
            {
                selected = true;
                $("#modaloption").val($(this).attr("value"));
            }
            $(this).removeClass("hidden");
        });
        $(option_name).addClass("hidden");
        $("#merge").attr("data-id", $(this).attr("data-id"));
    });

    $(".radio_sexe .btn").click(function() {
        var name = "#sexe_" + $(this).parent(".radio_sexe").data("id");
        $(name).val("" + $(this).parent(".radio_sexe").data("id") + "-" + $(this).text());
    });

    $("#merge").click(function() {
        var from_char = $(this).attr("data-id");
        var opt = document.getElementById("modaloption");
        var selected_char = opt[opt.selectedIndex].value;
        var gn_id = $(this).attr("data-gn");
        $.ajax({
            type: 'POST',
            url: $("#merge").attr("data-url"),
            dataType: "json",
            data: {char_to: selected_char, char_from: from_char, gn_id: gn_id},
            timeout: 3000,
            success: function(data) {
                console.log('ok');
                var remove_id = "line" + data.object.test;
                $("tr#"+remove_id).remove();
                $("#fusionModal").modal('hide');
                var upd_name = '#td_' + selected_char;
                var upd_type = '#td_' + selected_char + "-TYPE";
                $(upd_name).html(data.object.roles);
                $(upd_type).html(data.object.type)
                $("#modaloption option").each(function()
                {
                    var sup_name = 'CHAR-' + from_char;
                    if ($(this).val() == sup_name)
                    {
                        $(this).remove();
                    }
                });
            },
            error: function() {
                alert('La requête n\'est pas valide'); }
        });
    });
</script>
