<%@ page import="com.test.Person" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <g:javascript library="jquery"/>
    <g:javascript library="jquery-ui"/>
    <g:javascript>
        $(document).ready(function() {

            $( "#birthDate" ).datepicker({
                dateFormat: 'dd/mm/yy',
                onClose: function(dateText, inst) {
                    $("#birthDate_month").attr("value",new Date(dateText).getMonth() +1);
                    $("#birthDate_day").attr("value",new Date(dateText).getDate());
                    $("#birthDate_year").attr("value",new Date(dateText).getFullYear());
                }
            });
        });
    </g:javascript>


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


    <h1>Creation person</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${personInstance}">
        <ul class="alert alert-error" role="alert">
            <g:eachError bean="${personInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                    <g:message  error="${error}"/>
                </li>
            </g:eachError>
        </ul>
    </g:hasErrors>
<div parsley-validate parsley-bind>
    <g:form action="save" class="form-horizontal" name="myform"  >
        <input type="hidden" id="birthDate_month" name="birthDate_month" />
        <input type="hidden" id="birthDate_day" name="birthDate_day" />
        <input type="hidden" id="birthDate_year" name="birthDate_year" />
            <div class="control-group fieldcontain">
                <label class="control-label"  for="firstName">First Name</label>
                <div class="controls">
                    <g:field type="text" value="${personInstance?.firstName}"  name="firstName"
                             required="true"  id="firstName"    placeholder="First Name" />
                </div>
            </div>

            <div class="control-group fieldcontain">
                <label class="control-label" for="lastName">Last Name</label>
                <div class="controls">
                    <g:textField name="lastName" required="true"  id="lastName" placeholder="Last Name" />
                </div>
            </div>

            <div class="control-group fieldcontain">
                <label class="control-label" for="email">Email</label>
                <div class="controls">
                    <g:field type="email" name="email"
                             value="${personInstance?.email}"
                             required="true"
                             placeholder="Email"
                    />
                </div>
            </div>


        <div class="control-group fieldcontain">
            <label class="control-label"  for="birthDate">Birth Date</label>
            <div class="controls">
                <g:field type="text" value="${personInstance?.birthDate}"    	parsley-type="dateIso"
                         name="birthDate"
                         required="true"  id="birthDate"    placeholder="Birth date" />
                <g:formatDate format="dd/MM/yyyy" date="${personInstance?.birthDate}"/>
            </div>
        </div>

        <!--

        oninvalid="if(this.validity.patternMismatch){this.setCustomValidity('type invalide');}else{ if(this.validity.valueMissing){this.setCustomValidity('valeur manquante');}  }"                            id="email"

        -->

            <div class="form-actions">
                <g:submitButton name="create" class="btn btn-inverse"       value="${message(code: 'default.button.create.label', default: 'Create')}"/>
            </div>
    </g:form>
  </div>
</body>
</html>
