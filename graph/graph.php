<?php 
include_once 'Edge.php';
include_once 'Subset.php';

class Graph
{
	public $VerticesCount;
	public $_edge = array();


	function __construct($verticesCount)
	{
		$this->VerticesCount = $verticesCount;
		$this->_edge = array();
	}


	function AddConection($source, $dest, $price, $colaborator, $client){
		$auxEdge = new Edge();
		$auxEdge->Source = $source;
		$auxEdge->Destination = $dest;
		$auxEdge->Weight = $price;
		$auxEdge->Colaborador = $colaborator;
		$auxEdge->Cliente = $client;
		array_push($this->_edge, $auxEdge);
	}

	function Find($subsets, $i)
{
	if ($subsets[$i]->Parent != $i)
		$subsets[$i]->Parent = $this->Find($subsets, $subsets[$i]->Parent);

	return $subsets[$i]->Parent;
}

function Union($subsets, $x, $y)
{
	$xroot = $this->Find($subsets, $x);
	$yroot = $this->Find($subsets, $y);

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

function Kruskal()
{
	$verticesCount = $this->VerticesCount;
	$result = array();
	$i = 0;
	$e = 0;

	usort($this->_edge, array( "Graph" ,"CompareEdges")); //Organizar a lista por ordem do peso

	$subsets = array();

	for ($v = 0; $v < $verticesCount; ++$v)
	{
		$subsets[$v] = new Subset(); //Cria um subset para cara vértice
		$subsets[$v]->Parent = $v;
		$subsets[$v]->Rank = 0;
	}

	while ($e < $verticesCount - 1)
	{
		$nextEdge = $this->_edge[$i++];
		$x = $this->Find($subsets, $nextEdge->Source);
		$y = $this->Find($subsets, $nextEdge->Destination);

		if ($x != $y)
		{
			$result[$e++] = $nextEdge;
			$this->Union($subsets, $x, $y);
		}
	}

	$this->PrintResult($result);
}

}

?>