component restpath="/michigan" rest="true"
{

    // Method = GET
    // URL = /rest/electiondata/michigan/
    remote function getAllResults() httpmethod="GET"
    {
        myElectionResults = queryExecute("SELECT * FROM electionresults",{},{returnType="array"});
        return myElectionResults;
    }

    // Method = GET
    // URL = /rest/electiondata/michigan/{county}   e.g.  /rest/electiondata/michigan/ingham
    remote function getCountyResults(required string key restArgSource="path") httpmethod="GET" restpath="/{key}"
    {
        myCounty = ucase(arguments.key);
        myElectionResults = queryExecute("SELECT * FROM electionresults WHERE county = :filterCounty",
            {filterCounty=myCounty}, {returnType="array"});
        return myElectionResults;
    }

    // Method = GET
    // URL = /rest/electiondata/michigan/party/{party}   e.g.  /rest/electiondata/michigan/party/libertarian
    remote function getPartyResults(required string key restArgSource="path") httpmethod="GET" restpath="/party/{key}"
    {
        myParty = ucase(arguments.key);
        myElectionResults = queryExecute("SELECT * FROM electionresults WHERE UPPER(party) = :filterParty",
        {filterParty=myParty}, {returnType="array"});
        return myElectionResults;
    }

    // -------------------------------------------------
    // Method = GET
    // URL = /rest/electiondata/michigan    client is expecting html
    remote function getHTMLResults() httpmethod="GET" produces="text/html"
    {
        myElectionResults = queryExecute("SELECT * FROM electionresults");

        returnHTML = "<h1>Michigan Election Reulsts (2022)</h1>";
        returnHTML = returnHTML & "<table>";
        returnHTML = returnHTML & "<th><tr><td>County</td><td>Office</td><td>Candidate</td><td>Party</td><td>Votes</td></tr></th>";

        for(row in myElectionResults)
        {
            returnHTML = returnHTML & "<tr><td>"& row.county &"</td><td>"& row.office &"</td><td>" & row.canidate_firstname & " " & row.canidate_lastname & "</td><td>"& row.party &"</td><td>"& row.votes &"</td></tr>";
        }

        returnHTML = returnHTML & "</table>";

        return returnHTML;
    }

}
