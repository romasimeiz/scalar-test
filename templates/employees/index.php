<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <style>
        .pagination {
            margin-top: 20px;
        }

        .pagination > a, .link-grey {
            color: grey;
            text-decoration: none;
        }

        .pagination > a.active {
            color: blue;
            font-weight: bold;
        }
    </style>
</head>
<body>

<?php $currentParams = \App::$request['request'] ?>
<h1><a href="/">Employees</a></h1>


<div style="margin-bottom: 10px">
    <span>Per page: </span>

    <a class="link-grey" href="?<?= http_build_query(array_merge($currentParams, ['per-page' => 1])) ?>">1</a> <!-- to test-->
    <a class="link-grey" href="?<?= http_build_query(array_merge($currentParams, ['per-page' => 20])) ?>">20</a>
    <a class="link-grey" href="?<?= http_build_query(array_merge($currentParams, ['per-page' => 40])) ?>">40</a>
    <a class="link-grey" href="?<?= http_build_query(array_merge($currentParams, ['per-page' => 50])) ?>">50</a>
    <a class="link-grey" href="?<?= http_build_query(array_merge($currentParams, ['per-page' => 100])) ?>">100</a>
</div>

<table border="1" cellpadding="5" style="border-collapse: collapse">
    <tbody>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Birthday</th>
        <th>Type</th>
        <th>Department</th>
        <th>Position</th>
        <th>Salary</th>
    </tr>
    <?php foreach ($employees as $item) : ?>
        <tr>
            <td><?= $item->id ?></td>
            <td><?= $item->name ?></td>
            <td><?= $item->birthday ?></td>
            <td><?= $item->type ?></td>
            <td>
                <a href="/employees/department/<?= $item->department_id ?>">
                    <?= $item->department() ? $item->department()->name : "" ?>
                </a>
            </td>
            <td><?= $item->position() ? $item->position()->name : "" ?></td>
            <td><?= $item->getRate() ?></td>
        </tr>
    <?php endforeach; ?>
    </tbody>
</table>

<?php $urlPrefix = $departmentId ? "/employees/department/$departmentId/" : "/employees/" ?>
<div class="pagination">
    <?php if ($pagination->hasPrev): ?>
        <a href="<?= $urlPrefix . ($pagination->page - 1) . "?" . http_build_query($currentParams) ?>">
            <b>Previous</b>
        </a>
    <?php endif; ?>

    <?php foreach ($pagination->pages as $page): ?>
        <?php if ($page): ?>
            <a href="<?= $urlPrefix . $page . "?" . http_build_query($currentParams) ?>"
               class="<?php if ($page == $pagination->page) echo "active" ?>">
                <?= $page ?>
            </a>
        <?php else: ?>
            <b> ... </b>
        <?php endif; ?>
    <?php endforeach; ?>

    <?php if ($pagination->hasNext): ?>
        <a href="<?= $urlPrefix . ($pagination->page + 1) . "?" . http_build_query($currentParams) ?>">
            <b>Next</b>
        </a>
    <?php endif; ?>
</div>
</body>
</html>