// php bernoulli.php    
// php -r "require 'bernoulli.php'; main();"

<?php
// bernoulli function calculates and prints a list with the 20 first bernoulli numbers
function bernoulli() {
    $list = array();
    $list[0] = 1;
    $n = 20;
    for ($m = 1; $m <= $n; $m++) { 
        $list[$m] = 0;
        for ($k=0; $k <= $m - 1; $k++) { 
            $list[$m] = $list[$m] - binom($m + 1, $k) * $list[$k];
        }
        $list[$m] = $list[$m]/($m + 1);
    }
    return $list;
}
// binom calculates the binomial coefficient
function binom($n, $k) {
    $r = 1;
    for ($i = 1; $i <= $k; $i++) { 
        $r = $r * ($n - $i + 1) / $i;
    }
    return $r;
}

function main(){
    $result = bernoulli();
    foreach($result as $value){
        echo "$value";
        echo "\r\n";
    }
}

?>