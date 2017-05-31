<?php
namespace ORM;

class Pagination
{
    public $page;
    public $totalCount;
    public $perPage;

    public $hasNext;
    public $hasPrev;
    public $pageCount;
    public $pages = [];


    function __construct($page, $perPage,  $totalCount)
    {
        $this->page = $page;
        $this->totalCount = $totalCount;
        $this->perPage = $perPage;

        $this->pageCount = (int) ceil($totalCount / $perPage);
        $this->pages = $this->_pages();
        $this->hasNext = $page < $this->pageCount;
        $this->hasPrev = $page > 1;
    }

    protected function _pages($left_edge=2, $left_current=2, $right_current=2, $right_edge=2)
    {
        $pages = [];
        $previouslyWasNull = false;
        foreach (range(1, $this->pageCount) as $num) {
            $includeThisPage = ($num < $left_edge + 1) ||
                (($num > $this->page - $left_current - 1) && ($num < $this->page + $right_current + 1)) ||
                ($num > $this->pageCount - $right_edge);
            if ($includeThisPage) {
                $pages[] = $num;
                $previouslyWasNull = false;
            }
            elseif ($pages && !$previouslyWasNull) {
                $pages[] = null;
                $previouslyWasNull = true;
            }
        }
        return $pages;
    }
}