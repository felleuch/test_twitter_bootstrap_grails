<%@ page import="com.test.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'firstName', 'error')} required">
    <label for="firstName">
        <g:message code="person.firstName.label" default="First Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="firstName" required="" value="${personInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'lastName', 'error')} required">
    <label for="lastName">
        <g:message code="person.lastName.label" default="Last Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="lastName" required="" value="${personInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'email', 'error')} ">
    <label for="email">
        <g:message code="person.email.label" default="Email"/>

    </label>
    <g:field type="email" name="email" value="${personInstance?.email}"/>
</div>

