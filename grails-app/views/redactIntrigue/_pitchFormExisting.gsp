<style type="text/css">
.span6 {
    position: relative;
    bottom: 30px;
    right: 100px;
}
.span11
{
    width: auto;
    position: relative;
    left: 280px;
    margin-right: 100px;
}
.span13
{
    position: relative;
    left: 280px;
    margin-right: 70px;
}
select {
    font-size: 16px !important;
    width: 100px;
    outline: none;
}

.button_template
{
    position: relative;
    right: 250px;
}
.buttonDelete
{
    position : relative;
    left: 900px;
    width : 150px;
    padding-top:20px;
    padding-bottom: 60px;
}

</style>
<div class="fullScreenEditable" id="new_render">
    <g:hiddenField name="pitchDescription_${description.idDescription}" class="pitchDescription" value="idDescription_${description.idDescription}"/>
    <div class="test">
        <a href="#" id="idDescription_${description.idDescription}" data-type="text" data-pk="1" data-url="" data-title="Entrer le titre de la description" class="editable editable-click">Description</a>
        <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
    </div>
    <div class="row formRow">
        <div class="span11">
            <label for="pitchOrga">
                <g:message code="redactintrigue.generalDescription.pitchOrga" default="pitchOrga"/>
            </label>
        </div>

        <div class="span13">
            <g:checkBox class="pitchOrga" name="pitchOrga_${description.idDescription}" id="idPitchOrga_${description.idDescription}" value="${description.isOrga}"/>
        </div>

        <div class="span11">
            <label for="pitchPj">
                <g:message code="redactintrigue.generalDescription.pitchPj" default="pitchPj"/>
            </label>
        </div>

        <div class="span13">
            <g:checkBox class="pitchPj" id="idPitchPj_${description.idDescription}" name="pitchPj_${description.idDescription}" checked="${description.isPj}"/>
        </div>

        <div class="span11">
            <label for="pitchPnj">
                <g:message code="redactintrigue.generalDescription.pitchPnj" default="pitchPnj"/>
            </label>
        </div>

        <div class="span13">
            <g:checkBox class="pitchPnj" id="idPitchPnj_${description.idDescription}" name="pitchPnj_${description.idDescription}" checked="${description.isPnj}"/>
        </div>
        <div class="span6" id="type">
            <g:select class="type" name='type' id="idType_${description.idDescription}" value="${description.type}"
                      from="${['contexte du GN', 'univers du GN', 'informations lues dans la presse récemment', 'points de règles', 'personnalités connues', 'divers']}"/>
        </div>
    </div>
    <div class="button_template">
        <g:render template="dropdownButtons" />
    </div>
    <!-- Editor -->
   <!--<div name="plotRichTextEditor" id="idPlotRichTextEditor_0" contenteditable="true" onblur="saveCarretPos($(this).attr('id'))">-->
        <g:textArea name="description_text" id="idDescriptionText_${description.idDescription}" class="text-left richTextEditor editable" value="${description.pitch}"/>
    <!--</div>-->
    <div class="buttonDelete">
        <div type="button" class="btn btn-danger" onclick="deleteDescription(this)">Supprimer la description</div>
    </div>
</div>

<script type="application/javascript">
    var template = desc_number - 1;
    $(document).ready(function() {
        console.log("template value : idDescription_" + template);
        $('#idDescription_' + template).editable({
            success: function(response, newValue) {
                updateName(newValue);
            }
        });
    });

    function updateName(elt){
        console.log("template value : " + template);
        $("#titleRender_" + template).remove();
        var new_elt = '<li class="list-group-item" id="titleRender_' + template + '">' + elt + '</li>';
        //$("#titleRender_").id = "titleRender" + template;
        $('#overview').append(new_elt);
        //console.log($('#description_0').editable('getValue', true));
    }

    function updatePlotPitchOrga(elt)
    {
        console.log("test");
    }
</script>
