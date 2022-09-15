<html>
    <head>
        <title>MJZ Instructors</title>
    </head>

    <body>
        <h1>Welcome to MJZ DevOps course</h1>
        <ul>
            <?php
                $json = file_get_contents('http://study-group');
                $obj = json_decode($json);

                $study = $obj->study;
                foreach ($study as $study) {
                    echo "<li>$study</li>";
                }
            ?>
        </ul>
    </body>
</html>

