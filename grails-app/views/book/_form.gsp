<%@ page import="com.test.Book" %>



<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'author', 'error')} ">
    <label for="author">
        <g:message code="book.author.label" default="Author"/>

    </label>
    <g:textField name="author" value="${bookInstance?.author}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'publicationDate', 'error')} required">
    <label for="publicationDate">
        <g:message code="book.publicationDate.label" default="Publication Date"/>
        <span class="required-indicator">*</span>
    </label>
    <joda:datePicker name="publicationDate" value="${bookInstance?.publicationDate}"></joda:datePicker>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'title', 'error')} ">
    <label for="title">
        <g:message code="book.title.label" default="Title"/>

    </label>
    <g:textField name="title" value="${bookInstance?.title}"/>
</div>

