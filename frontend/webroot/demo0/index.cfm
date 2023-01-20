<!--- This is a demo showing how to consume a REST endpoint using cfhttp               --->
<!--- Consuming your own APIs and consuming them on the httml side will be shown later --->
<!--- -------------------------------------------------------------------------------- --->

<cfhttp url="https://catfact.ninja/fact" method="GET" result="myCatFact">

</cfhttp>

<cfset catFactObject = deserializeJSON(myCatFact.filecontent)>

<h2>Did you know?</h2>
<cfoutput>#catFactObject.fact#</cfoutput>

<hr>

<cfhttp url="https://dog.ceo/api/breeds/image/random" method="GET" result="myDog">

</cfhttp>

<cfset myDogRestResult = deserializeJSON(myDog.filecontent)>

<cfoutput>
    And here is a dog photo : <br/ >
    <img src="#myDogRestResult.message#">
</cfoutput>