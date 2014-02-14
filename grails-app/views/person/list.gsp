<%@ page import="com.test.Person" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <r:require module='filterpane'/>


    <g:javascript library="jquery"/>
    <g:javascript library="jquery-ui"/>



</head>

<body>




<div class="navbar">
    <div class="navbar-inner">
        <div class="container">
            <a data-target=".navbar-responsive-collapse" data-toggle="collapse" class="btn btn-navbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a href="#" class="brand">MyCompany</a>
            <div class="nav-collapse collapse navbar-responsive-collapse">
                <ul class="nav">
                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><a href="#">Profile</a></li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">Person <b class="caret"></b></a>
                        <ul class="dropdown-menu">

                            <li><g:link class="create" action="create">Create person</g:link></li>

                            <li><g:link class="edit" action="list">List of persons</g:link></li>

                        </ul>
                    </li>
                </ul>

                <ul class="nav pull-right">
                    <li class="divider-vertical"></li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">Admin <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Settings</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>


<div id="list-person"  role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <filterpane:filterPane
          showTitle="false"
          domain="com.test.Person"
          filterPaneId="filterPane"
          dateFormat="${[title: 'MM/dd/yyyy', releaseDate: 'MMM dd, yyyy']}"
          showSortPanel="false"
          filterBean="${com.test.Person}"
          filterProperties="${['lastName', 'firstName','birthDate']}"    />



    <filterpane:filterButton text="Filter résultat" appliedText="Modifier le filtre" />
    <g:if test="${flash.message}">
        <div class="alert alert-success" role="status">${flash.message}</div>
    </g:if>
    <table class="table table-striped">
        <thead>
        <tr>

            <g:sortableColumn property="firstName"
                              title="${message(code: 'person.firstName.label', default: 'First Name')}"/>

            <g:sortableColumn property="lastName"
                              title="${message(code: 'person.lastName.label', default: 'Last Name')}"/>

            <g:sortableColumn property="email" title="${message(code: 'person.email.label', default: 'Email')}"/>

            <g:sortableColumn property="birthDate"
                              title="${message(code: 'person.email.label', default: 'Birth Date')}"/>

        </tr>
        </thead>
        <tbody>
        <g:set var="dateFormat" value="dd/MM/yyyy"/>
        <g:each in="${personInstanceList}" status="i" var="personInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"  id="${personInstance.id}">${fieldValue(bean: personInstance, field: "firstName")}</g:link></td>

                <td>${fieldValue(bean: personInstance, field: "lastName")}</td>

                <td>${fieldValue(bean: personInstance, field: "email")}</td>

                <td>${personInstance?.birthDate.format(dateFormat)}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pager">
        <g:paginate total="${personInstanceTotal}"  params="${filterParams}" />
    </div>
</div>














</body>
</html>
