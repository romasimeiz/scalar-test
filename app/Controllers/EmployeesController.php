<?php
 
namespace Controllers;

class EmployeesController extends BaseController
{
    public function index($page = 1, $departmentId = null)
    {
        $page = (int) $page;
        $departmentId = (int) $departmentId;

        $query = \Entity\Employee::query();
        if($departmentId) {
            $query->where("department_id = $departmentId");
        }
        $perPage = isset(\App::$request['request']['per-page']) ? \App::$request['request']['per-page'] : 20;
        list($employees, $pagination) = $query->paginate($page, $perPage);
        return ['body' => $this->render('employees/index', compact('employees', 'pagination', 'departmentId'))];
    }

    // workaround for routing /department/ID
    public function department($departmentId = null) {
        return $this->index(1, $departmentId);
    }

    // workaround for routing /department/ID/PAGE
    public function departmentPaginated($departmentId = null, $page = 1) {
        return $this->index($page, $departmentId);
    }
}