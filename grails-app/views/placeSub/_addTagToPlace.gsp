<%@ page import="org.gnk.tag.Tag" %>
<%@ page import="org.gnk.admin.right" %>
<%@ page import="org.gnk.resplacetime.Place" %>
<div id="create-tag" class="content scaffold-create" role="main">
    <legend>Ajout d'un tag sur un lieu</legend>
    <g:form action="save">
        <form class="form-inline">
            <div class="row">
                <div class="span3">
                    <g:select
                            name="place_select"
                            optionKey="id"
                            optionValue="name"
                            from="${Place.list()}"
                            noSelection="['': '-Choix du lieu-']"/>
                </div>

                <div class="span3">
                    <g:select
                            name="tag_select"
                            optionKey="id"
                            optionValue="name"
                            from="${Tag.list()}"
                            noSelection="['': '-Choix du tag-']"/>
                </div>

                <div class="span4">
                    poids (%) :
                    <input title="poids" class="span1" id="weight_select" name="weight" value="100" type="number">
                </div>
            </div>
            <g:hasRights lvlright="${right.REFMODIFY.value()}">
                <g:actionSubmit class="btn btn-primary" action="addTagToPlace" value="${message(code: 'default.add')}"/>
            </g:hasRights>
        </form>
    </g:form>
</div>
