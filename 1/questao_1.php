<?php

function calcularTotalComDesconto(array $precos, float $desconto): float {

    $total = 0;

    foreach ($precos as $preco) {
        $precoDesc = $preco * (1 - $desconto);
        $total += $precoDesc;
    }
    return $total;
}

$precos = [100, 200, 50];
$desconto = 0.10;

echo calcularTotalComDesconto($precos, $desconto);

?>