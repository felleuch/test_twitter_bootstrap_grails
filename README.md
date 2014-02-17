# test_twitter_bootstrap_grails

created by Faiez ELLEUCH

build by Grails 2.2.4

this application are created using those plugins :

        runtime :hibernate:2.2.4.
        runtime :jquery:1.10.2.
        compile :jquery-ui:1.10.3.
        compile :spring-security-core:2.0-RC2.
        compile :spring-security-ui:1.0-RC1.
        compile :mail:1.0
        runtime :resources:1.2
        compile :webflow:2.0.8.1
        compile :famfamfam:1.0
        compile :filterpane:2.2.5
        runtime :twitter-bootstrap:2.3.2
        compile :filterpane:2.2.5
        compile :joda-time:1.4
        build :tomcat:$grailsVersion
        runtime :database-migration:1.3.2
        compile :cache:1.0.1



## Pre-requis
You must install :

* JDK 1.7
* Grails 2.2.4
* Maven 2.2.1

## Getting Started
* Check out the [sources](https://github.com/felleuch/test_twitter_bootstrap_grails/tree/master)
* Install the sample code source
* run the sample code source
* Test application by adding user ,adding person, adding books




## Examples
*All examples assume you have already running the application on Tomcat server !*

Add Person :

```groovy

    def save() {
        def personInstance = new Person(params)
        if (!personInstance.save(flush: true)) {
            render(view: "create", model: [personInstance: personInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'person.label', default: 'Person'), personInstance.id])
        redirect(action: "list")
    }

```

Show List of person :

```groovy

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [personInstanceList: Person.list(params), personInstanceTotal: Person.count()]
    }

```


-![alt text](http://www.makingdifferent.com/wp-content/uploads/2013/03/123.gif "Frustrated cat can't believe this is the 12th time he's clicked on an auto-linked README.md URL")

        
        
        
        
