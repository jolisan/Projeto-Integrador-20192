<?php 
include_once 'Edge.php';
include_once 'Subset.php';

class Graph
{
	public $VerticesCount;
	public $EdgesCount;
	public $_edge = array();
}

function CreateGraph($verticesCount, $edgesCoun)
{
	$graph = new Graph();
	$graph->VerticesCount = $verticesCount;
	$graph->EdgesCount = $edgesCoun;
	$graph->_edge = array();
	
	for ($i = 0; $i < $graph->EdgesCount; ++$i)
		$graph->_edge[$i] = new Edge();

	return $graph;
}

function Find($subsets, $i)
{
	if ($subsets[$i]->Parent != $i)
		$subsets[$i]->Parent = Find($subsets, $subsets[$i]->Parent);

	return $subsets[$i]->Parent;
}

function Union($subsets, $x, $y)
{
	$xroot = Find($subsets, $x);
	$yroot = Find($subsets, $y);

	if ($subsets[$xroot]->Rank < $subsets[$yroot]->Rank)
		$subsets[$xroot]->Parent = $yroot;
	else if ($subsets[$xroot]->Rank > $subsets[$yroot]->Rank)
		$subsets[$yroot]->Parent = $xroot;
	else
	{
		$subsets[$yroot]->Parent = $xroot;
		++$subsets[$xroot]->Rank;
	}
}

function CompareEdges($a, $b)
{
	return $a->Weight > $b->Weight;
}

function PrintResult($result)
{
	$bestSellers = array();

	for ($i = 0; $i < count($result); ++$i){
		if(!in_array($result[$i]->Colaborador, $bestSellers)){
			array_push($bestSellers, $result[$i]->Colaborador);
		}

	}
	echo 'Vendedores recomendados: </br></br>';
	for ($j = 0; $j < count($bestSellers); $j++)
		echo $bestSellers[$j] .'<br/>';

		//echo $result[$i]->Colaborador . " -- " . $result[$i]->Cliente . " == " . $result[$i]->Weight . "<br/>";
}

function Kruskal($graph)
{
	$verticesCount = $graph->VerticesCount;
	$result = array();
	$i = 0;
	$e = 0;

	usort($graph->_edge, "CompareEdges"); //Organizar a lista por ordem do peso


	$subsets = array();

	for ($v = 0; $v < $verticesCount; ++$v)
	{
		$subsets[$v] = new Subset(); //Cria um subset para cara vértice
		$subsets[$v]->Parent = $v;
		$subsets[$v]->Rank = 0;
	}

	while ($e < $verticesCount - 1)
	{
		$nextEdge = $graph->_edge[$i++];
		$x = Find($subsets, $nextEdge->Source);
		$y = Find($subsets, $nextEdge->Destination);

		if ($x != $y)
		{
			$result[$e++] = $nextEdge;
			Union($subsets, $x, $y);
		}
	}

	PrintResult($result);
}



?>