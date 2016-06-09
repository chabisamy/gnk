<div class="row-fluid">
    <div class="span4"><legend>Dates</legend></div>
    <div class="span1"><span class="badge badge-important" id="datesPercentage">0 %</span></div>
    <div class="span2"><a id="runSubDateButton" class="btn btn-info"><i class="icon-play icon-white"></i> LANCER</a></div>
    <div class="span1" id="datesLoader" style="display: none; float : right;"><g:img dir="images/substitution" file="loader.gif" width="30" height="30"/></div>
</div>

<div id="subDatesAlertContainer">
</div>

<g:form method="post" controller="substitution">
    <g:hiddenField name="gnId" value="${gnId}"/>
    <g:each in="${sexe}" var="a">
        <g:hiddenField id="a" name="sexe" value="NO"/>
    </g:each>
    <td><label for="t0DateHour"><g:message
            code="selectintrigue.step0.t0Date" default="Actual GN Date"/></label></td>
    <td>
        <div class="input-append">
            <input type="text" id="t0DateHour" name="t0DateHour" placeholder="jj/mm/aaaa hh:mm"
                   required="required" pattern="\d{1,2}/\d{1,2}/\d{4} \d{2}:\d{2}"
                   value="${formatDate(format: 'dd/MM/yyyy HH:mm', date: gnInstance?.t0Date)}"/>
            <g:if test="${formatDate(format: 'G', date: gnInstance?.t0Date) == 'BC'}">
                <input type="hidden" name="t0DateHourUnity" value="-"/>
                <span class="add-on btn">
                    <i>- JC</i>
                </span>
            </g:if>
            <g:else>
                <input type="hidden" name="t0DateHourUnity" value="+"/>
                <span class="add-on btn">
                    <i>+ JC</i>
                </span>
            </g:else>
        </div>
    </td>

    <td><label for="gnDuration"><g:message
            code="selectintrigue.step0.gnDuration" default="GN duration"/></label></td>
    <td><div class="input-append">
        <input class="span2" name="gnDuration" id="gnDuration"
               type="number" value="${gnInstance?.duration}" required="required" pattern="\d*"
               style="margin-right: 0px;" min="1"/><span class="add-on">h</span>
    </div></td>

    <g:actionSubmit class="btn btn-primary" action="saveOrUpdateDates"
                    value="${message(code: 'default.button.update.label', default: 'Update')}"/>
</g:form>

<table id="dateTable" class="table table-striped">
    <thead>
    <tr class="upper">
        <th style="text-align: center;">#</th>
        <th>type</th>
        <th style="display: none">code</th>
        <th>titre</th>
        <th>Intrigue</th>
        <th>Planifié</th>
        <th style="text-align: center;">date</th>
    </tr>
    </thead>



    <tbody>
    <g:each status="i" in="${pastsceneList}" var="pastscene">
        <tr id="pastscene${pastscene.id}_plot${pastscene.plotId}">
            <!-- # -->
            <td style="text-align: center;">${i + 1}</td>
            <!-- Type -->
            <th>Scène passée</th>
            <!-- Code - modal button -->
            <td style="display: none"><a href="#modalPas${i + 1}" role="button" class="btn" data-toggle="modal">PAS-${pastscene.id.encodeAsHTML()}_${pastscene.plotId.encodeAsHTML()}</a></td>
            <!-- Title -->
            <td>${pastscene.title.encodeAsHTML()}</td>
            <!-- Plot -->
            <td>${pastscene.plotName.encodeAsHTML()}</td>
            <!-- Is planned -->
            <td><span class="label label-info">OUI</span></td>
            <!-- Date -->
            <td style="text-align: center; font-weight: bold; font-size: 120%;" class="date" isEmpty="true"></td>
        </tr>
    </g:each>
    <g:each status="i" in="${eventList}" var="event">
        <tr id="event${event.id}_plot${event.plotId}">
            <!-- # -->
            <td style="text-align: center;">${pastsceneList.size() + i + 1}</td>
            <!-- Type -->
            <th>Événement</th>
            <!-- Code - modal button -->
            <td style="display: none"><a SDWhref="#modalEve${i + 1}" role="button" class="btn"  data-toggle="modal">EVE-${event.id.encodeAsHTML()}_${event.plotId.encodeAsHTML()}</a></td>
            <!-- Title -->
            <td>${event.title.encodeAsHTML()}</td>
            <!-- Plot -->
            <td>${event.plotName.encodeAsHTML()}</td>
            <!-- Is planned -->
            <td>
                <g:if test="${event.isPlanned}">
                    <span class="label label-info">OUI</span>
                </g:if>
                <g:else>
                    <span class="label label-warning">NON</span>
                </g:else></td>
            <!-- Date -->
            <td style="text-align: center; font-weight: bold; font-size: 120%;" class="date" isEmpty="false" ></td>
        </tr>
    </g:each>
    <tbody>
</table>

<!-- Modal Views -->
<!--g:render template="modalViewDates" /-->

<g:javascript src="substitution/subDates.js" />

<script type="text/javascript">
    $(document).ready(function() {
        // DatesJSON
        datesJSON = initDatesJSON();

        isSubDatesRunning = false;

        // Run dates substitution
        //runDatesSubstitution("${g.createLink(controller:'substitution', action:'getSubDates')}");
        initDateList("${g.createLink(controller:'substitution', action:'getSubDates', params: [subDates : params.subDates] )}");
    });

    function initDatesJSON() {
        var jsonObject = new Object();

        // Begin gn date
        jsonObject.beginDate = "${gnInfo.t0Date.format('yyyy.MM.dd HH:mm')}";
        // Duration
        jsonObject.duration = "${gnInfo.duration}";

        // BEGIN Pastscenes LOOP
        var pastsceneArray = new Array();
        <g:each status="i" in="${pastsceneList}" var="pastscene">
            var pastscene = new Object();
            // Gn id
            pastscene.gnId = "${pastscene.id}";
            // Gn plot id
            pastscene.gnPlotId = "${pastscene.plotId}";
            // HTML id
            pastscene.htmlId = "pastscene${pastscene.id}_plot${pastscene.plotId}";
            // Time

            // DOIT ËTRE SUPP
            //pastscene.relativeTime = "${pastscene.relativeTime}";
            //pastscene.relativeTimeUnit = "${pastscene.relativeTimeUnit}";
            // FIN DOIT ETRE SUPP
            pastscene.absoluteYear = "${pastscene.absoluteYear}";
            pastscene.absoluteMonth = "${pastscene.absoluteMonth}";
            pastscene.absoluteDay = "${pastscene.absoluteDay}";
            pastscene.absoluteHour = "${pastscene.absoluteHour}";
            pastscene.absoluteMinute = "${pastscene.absoluteMin}";



            pastscene.isYearAbsolute = "${pastscene.isYearAbsolute}";
            pastscene.isMonthAbsolute = "${pastscene.isMonthAbsolute}";
            pastscene.isDayAbsolute = "${pastscene.isDayAbsolute}";
            pastscene.isHourAbsolute = "${pastscene.isHourAbsolute}";
            pastscene.isMinuteAbsolute = "${pastscene.isMinuteAbsolute}";

            pastscene.isUpdate = "";
            pastsceneArray.push(pastscene);
        </g:each>
        // END Pastscenes LOOP
        jsonObject.pastscenes = pastsceneArray;

        // BEGIN Events LOOP
        var eventArray = new Array();
        <g:each status="i" in="${eventList}" var="event">
        var event = new Object();
        // Gn id
        event.gnId = "${event.id}";
        // Gn plot id
        event.gnPlotId = "${event.plotId}";
        // HTML id
        event.htmlId = "event${event.id}_plot${event.plotId}";
        eventArray.push(event);
        // Time
        event.timing = "${event.timing}";
        </g:each>
        // END Events LOOP
        jsonObject.events = eventArray;
        return jsonObject;
    }

</script>

