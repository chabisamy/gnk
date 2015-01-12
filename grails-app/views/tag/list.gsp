<%@ page import="org.gnk.tag.Tag; org.gnk.admin.right" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>${message(code: 'adminRef.tag.title')}</title>
	</head>
	<body>
        <g:render template="subNav" />
		<div id="list-tag" class="content scaffold-list" role="main">
            <fieldset>
                <h2><g:message code="adminRef.tag.title"/></h2>
            </fieldset>

			<g:render template="../infosAndErrors" />

			<g:render template="tableChildrenTags" model="[listTagParent : listTagParent]" />

		</div>

    <script type="application/javascript">
        $(function(){
            $("#listTable").DataTable({
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/French.json"
                }
            });
        });
    </script>
    </body>
</html>







