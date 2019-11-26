<?php 

include_once 'Graph.php';

$verticesCount = 10;
//$edgesCount = 12;
$graph = new graph($verticesCount);
//PARAMETROS = ID_COLABORADOR, ID_CLIENTE, PREÇO_VENDA, NOME_COLABORADOR, NOME_CLIENTE)
//PRECISA PUXAR ESSES DADOS DINAMICAMENTE DO BANCO E PREENCHER DESSA MANEIRA, DE RESTO ESTÁ TUDO PRONTO PRATICAMENTE
$graph->AddConection(0, 1, 5, 'Alfonso', 'Liz');
$graph->AddConection(0, 2, 5, 'Alfonso', 'Sledz');
$graph->AddConection(3, 2, 17, 'Tavares', 'Sledz');
$graph->AddConection(3, 5, 17, 'Tavares', 'Alex');
$graph->AddConection(3, 6, 17, 'Tavares', 'Leo');
$graph->AddConection(7, 5, 35, 'Pedro', 'Alex');
$graph->AddConection(7, 6, 35, 'Pedro', 'Leo');
$graph->AddConection(4, 1, 25, 'Jolisan', 'Liz');
$graph->AddConection(4, 5, 25, 'Jolisan', 'Alex');
$graph->AddConection(4, 2, 25, 'Jolisan', 'Sledz');
$graph->AddConection(8, 9, 1, 'Lapa', 'Hernane');
$graph->AddConection(8, 0, 1, 'Lapa', 'Alfonso');
var_dump($graph);
$graph->Kruskal();

?>