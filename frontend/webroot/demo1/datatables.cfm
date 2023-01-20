<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hawaii CFUG REST Demo 1</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>

</head>
<body>

<h3>Demo 1</h3>
<hr>

<table id="votes" class="table table-striped table-primary table-hover" style="width:100%">
    <thead class="table-dark">
    <tr>
        <th>County</th>
        <th>Office</th>
        <th>Party</th>
        <th>Candidate First Name</th>
        <th>Candidate Last Name</th>
        <th>Votes</th>
    </tr>
    </thead>
</table>

<script>
    $(document).ready(function () {
        $('#votes').DataTable({
            ajax:
                    {
                        url:'/rest/electiondata/michigan/ingham',
                        dataSrc:""
                    },
            "columns":
                [
                    {"data": "county"},
                    {"data": "office"},
                    {"data": "party"},
                    {"data": "canidate_firstname"},
                    {"data": "canidate_lastname"},
                    {"data": "votes"}
                ]
        });
    });
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>
