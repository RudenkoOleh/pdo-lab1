<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Items from Vendor</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #d4d4d4;
        }
    </style>
</head>
<body>

<h2>Items from vendor</h2>

<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Quality</th>
            <th>Vendor</th>
        </tr>
    </thead>
    <tbody>
    <?php
        include("connect.php");

        $vendor = $_GET["vendor"];

        $SELECT = "SELECT items.name, items.price, items.quantity, items.quality, vendors.v_name as vendor FROM items
        JOIN vendors ON vendors.ID_Vendors = items.FID_Vendor
        WHERE vendors.v_name = :vendor";

        try {
            $stmt = $dbh->prepare($SELECT);
            $stmt->bindValue(":vendor", $vendor);
            $stmt->execute();

            $res = $stmt->fetchAll();
        } catch (PDOException $ex) {
            echo $ex->GetMessage();
        }
        
        foreach ($res as $row){
            echo "<tr>";
            echo "<td>" . $row['name'] . "</td>";
            echo "<td>" . $row['price'] . "</td>";
            echo "<td>" . $row['quantity'] . "</td>";
            echo "<td>" . $row['quality'] . "</td>";
            echo "<td>" . $row['vendor'] . "</td>";
            echo "</tr>";
        }
        ?>
    </tbody>
</table>

</body>
</html>
