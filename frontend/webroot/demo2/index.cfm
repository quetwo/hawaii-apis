<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hawaii CFUG REST Demo 2</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>

</head>
<body>

<h3>Demo 2</h3>
<hr>

<table id="customers" class="table table-striped table-primary table-hover" style="width:100%">
    <thead class="table-dark">
    <tr>
        <th>Customer ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Last Years Sales</th>
    </tr>
    </thead>
</table>

<div class="container">
    <button class="btn btn-primary" onclick="showAddRecordForm()">Add Record</button>
    <button class="btn btn-danger" onclick="deleteRecord()">Delete Record</button>
</div>

<div id="addRecord" class="d-none">
    <form id="addUserForm" method="PUT">
        <table>
            <tr>
                <td>Customer Name:</td>
                <td><input name="custName" id="custName"></td>
            </tr>
            <tr>
                <td>Customer Email:</td>
                <td><input name="custEmail" id="custEmail"></td>
            </tr>
            <tr>
                <td>Last Year Sales:</td>
                <td><input name="sales" id="sales"></td>
            </tr>
            <tr>
                <td></td>
                <td><button class="btn btn-primary" onclick="saveNewRecord()">Save</button> </td>
            </tr>
        </table>
    </form>
</div>

<script>

    $(document).ready(function () {
        table = $('#customers').DataTable({
            ajax:
                    {
                        url:'/rest/crm/customer',
                        dataSrc:""
                    },
            "columns":
                    [
                        {"data": "customerID"},
                        {"data": "customerName"},
                        {"data": "customerEmail"},
                        {"data": "sales"}
                    ]
        });

        $('#customers tbody').on('click', 'tr', function () {
            if ($(this).hasClass('selected')) {
                $(this).removeClass('selected');
            } else {
                table.$('tr.selected').removeClass('selected');
                $(this).addClass('selected');
            }
        });

    });



    function showAddRecordForm()
    {
        $('#addRecord').removeClass("d-none");
    }

    function saveNewRecord()
    {
        $.ajax({
            url: '/rest/crm/customer',
            type: "PUT",
            data: {"username": custName.value, "email": custEmail.value, "sales": sales.value},
            dataType:'json',
            success: function (response) {
                console.log(response);
            },
            error: function(error){
                console.log("Something went wrong", error);
            }
        });
    }

    function deleteRecord()
    {
        var ids = $.map(table.rows('.selected').data(), function (item)
        {
            return item.customerID
        });

        for (const idsKey in ids)
        {
            $.ajax({
                method: "DELETE",
                url: "/rest/crm/customer/" + ids[idsKey]
            }).done(function( msg ) { alert( "Data Deleted: " + msg ); });
        }
    }

</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>
