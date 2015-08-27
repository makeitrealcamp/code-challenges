/*
   3N + 1
   
   
   if N es impar -> 3*N + 1
   else -> N/2
   
   input: N,M | N < M
   output: 
   
   1,2,3
   
   [1] -> 1
   [2, 1] -> 2
   [3, 10, 5, 16, 8, 4, 2, 1] -> 8
 */


function isEven(n) {
   return (n % 2 === 0);
}

// returna un entero
function blah (n, m) {
  var major = 0;
  for (var i = n; i <= m; i++) {
    major = Math.max(major, seqLength(i));
  }

  return major;
}



var cache = {1: 1};

// 1 2 3
function seqLength (n) {
    var j = 1;
    var m = n;

    if (cache[m]) {
        return cache[m];
    }

    while (m != 1) {

        if ( !isEven(m) ) {
            m = (3 * m) + 1;
        } else {
            m = m / 2;
        }

        if (cache[m]) {
            j += cache[m];
            break;
        }
        j++;
    }

    cache[n] = j;
    return j;
}

var tests = [
    { n: 1, m: 10, r: 20 },
    { n: 100, m: 200, r: 125 },
    { n: 201, m: 210, r: 89 },
    { n: 900, m: 1000, r: 174 },
    { n: 1, m: 1, r: 1 }
];

for ( var i = 0; i < tests.length; i++) {
    var t = tests[i];
    console.assert(blah(t.n, t.m) == t.r, t);
}


