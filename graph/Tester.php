<?php 

include_once 'Graph.php';





$verticesCount = 10;
$edgesCount = 12;
$graph = CreateGraph($verticesCount, $edgesCount);


// Edge 0-1
$graph->_edge[0]->Source = 0;
$graph->_edge[0]->Destination = 1;
$graph->_edge[0]->Weight = 5;
$graph->_edge[0]->Colaborador = 'Alfonso';
$graph->_edge[0]->Cliente = 'Liz';

// Edge 0-2
$graph->_edge[1]->Source = 0;
$graph->_edge[1]->Destination = 2;
$graph->_edge[1]->Weight = 5;
$graph->_edge[1]->Colaborador = 'Alfonso';
$graph->_edge[1]->Cliente = 'Sledz';

// Edge 3-2
$graph->_edge[2]->Source = 3;
$graph->_edge[2]->Destination = 2;
$graph->_edge[2]->Weight = 17;
$graph->_edge[2]->Colaborador = 'Tavares';
$graph->_edge[2]->Cliente = 'Sledz';

// Edge 3-5
$graph->_edge[3]->Source = 3;
$graph->_edge[3]->Destination = 5;
$graph->_edge[3]->Weight = 17;
$graph->_edge[3]->Colaborador = 'Tavares';
$graph->_edge[3]->Cliente = 'Alex';

// Edge 3-6
$graph->_edge[4]->Source = 3;
$graph->_edge[4]->Destination = 6;
$graph->_edge[4]->Weight = 17;
$graph->_edge[4]->Colaborador = 'Tavares';
$graph->_edge[4]->Cliente = 'Leo';
// Edge 7-5
$graph->_edge[5]->Source = 7;
$graph->_edge[5]->Destination = 5;
$graph->_edge[5]->Weight = 35;
$graph->_edge[5]->Colaborador = 'Pedro';
$graph->_edge[5]->Cliente = 'Alex';

// Edge 7-6
$graph->_edge[6]->Source = 7;
$graph->_edge[6]->Destination = 6;
$graph->_edge[6]->Weight = 35;
$graph->_edge[6]->Colaborador = 'Pedro';
$graph->_edge[6]->Cliente = 'Leo';

// Edge 4-1
$graph->_edge[7]->Source = 4;
$graph->_edge[7]->Destination = 1;
$graph->_edge[7]->Weight = 25;
$graph->_edge[7]->Colaborador = 'Jolisan';
$graph->_edge[7]->Cliente = 'Liz';

// Edge 4-5
$graph->_edge[8]->Source = 4;
$graph->_edge[8]->Destination = 5;
$graph->_edge[8]->Weight = 25;
$graph->_edge[8]->Colaborador = 'Jolisan';
$graph->_edge[8]->Cliente = 'Alex';

// Edge 4-2
$graph->_edge[9]->Source = 4;
$graph->_edge[9]->Destination = 2;
$graph->_edge[9]->Weight = 25;
$graph->_edge[9]->Colaborador = 'Jolisan';
$graph->_edge[9]->Cliente = 'Sledz';

// Edge 8-9
$graph->_edge[10]->Source = 8;
$graph->_edge[10]->Destination = 9;
$graph->_edge[10]->Weight = 1;
$graph->_edge[10]->Colaborador = 'Lapa';
$graph->_edge[10]->Cliente = 'Hernane';

// Edge 8-0

$graph->_edge[11]->Source = 8;
$graph->_edge[11]->Destination = 0;
$graph->_edge[11]->Weight = 1;
$graph->_edge[11]->Colaborador = 'Lapa';
$graph->_edge[11]->Cliente = 'Alfonso';


Kruskal($graph);

?>