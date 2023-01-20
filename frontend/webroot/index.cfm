<h1>This works!</h1>

<cfquery name="test">
    select now() as col1
</cfquery>

<cfdump var="#test#">

If you didn't get an error message above, that means that your CFML and DB Engines are alive and well.

<br /> <br />

<table width="25%">

    <ul>
        <li><a href="demo0/">Demo 0 - Basics of consuming an API with CFHTTP</a></li>
        <li><a href="demo1/">Demo 1 - Basics of exposing your data with an API</a></li>
        <li><a href="demo2/">Demo 2 - Building a basic app with REST endpoints</a></li>
    </ul>

</table>

