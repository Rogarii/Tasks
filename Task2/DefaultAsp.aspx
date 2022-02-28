<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DefaultAsp.aspx.vb" Inherits="ApiTableApp.DefaultAsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Star Wars Planets</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/ag-grid-community/dist/ag-grid-community.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/ag-grid-community/dist/styles/ag-grid.css"/>
    <link rel="stylesheet" href="https://unpkg.com/ag-grid-community/dist/styles/ag-theme-alpine.css"/>
</head>
<body>
        <div id="planetGrid" class="ag-theme-alpine m-auto mt-5" style="height: 750px; width:75%"></div>
</body>
    <script>
        const planetColDefs = [
            { field: "name", sortable: true },
            {
                field: "diameter", sortable: true, comparator:
                    (valueA, valueB, nodeA, nodeB, isInverted) => {
                        if (valueA == "unknown") return -1;
                        else if (valueB == "unknown") return 1;
                        const a = parseInt(valueA);
                        const b = parseInt(valueB);
                        if (a == b) return 0;
                        else if (a > b) return 1;
                        return -1;
                    } },
            { field: "climate", sortable: true },
            { field: "gravity", sortable: true },
            { field: "terrain", sortable: true },
            {
                field: "surface_water", sortable: true, comparator:
                    (valueA, valueB, nodeA, nodeB, isInverted) => {
                        if (valueA == "unknown") return -1;
                        else if (valueB == "unknown") return 1;
                        const a = parseInt(valueA);
                        const b = parseInt(valueB);
                        if (a == b) return 0;
                        else if (a > b) return 1;
                        return -1;
                    } },
            {
                field: "population", sortable: true, comparator:
                    (valueA, valueB, nodeA, nodeB, isInverted) => {
                        if (valueA == "unknown") return -1;
                        else if (valueB == "unknown") return 1;
                        const a = parseInt(valueA);
                        const b = parseInt(valueB);
                        if (a == b) return 0;
                        else if (a > b) return 1;
                        return -1;
                    } }
        ];

        const planetData = JSON.parse('<%= Session("planetData")%>');

        const planetGridOptions = {
            columnDefs: planetColDefs,
            rowData: planetData
        };

        $(document).ready(function () {
            const planetGrid = document.querySelector("#planetGrid");
            new agGrid.Grid(planetGrid, planetGridOptions);
        });
    </script>
</html>
