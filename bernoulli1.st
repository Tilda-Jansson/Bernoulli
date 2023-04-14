"gst bernoulli1.st"

Object subclass: "Bernoulli1 is a subclass of the class Object"
Bernoulli1 [
    
    "The method calculates and returns a list with the 20 first bernoulli numbers "
    bernoulli [
        | B n | "Initialize variables used in the program"
        n := 20.
        B := Array new: n. "creating an instance of Array"

        B at: 1 put: 1.   "B[1] <-- 1"
        2 to: n do: [:m |   "for m <-- 2 to n do"
            B at: m put: 0.   "B[m] <-- 0"

            1 to: (m - 1) do: [:k |   "for k <-- 1 to (m-1) do"
                B at: m put: (B at: m) - (((Bernoulli1 new) binom: m kl: (k-1)) * (B at: k)).       
                "B[m] <-- B[m] − BINOM(m, k-1) * B[k]"
            ].    
            B at: m put: (B at: m) / m.   "B[m] <-- B[m] / m"
        ].
        ^B  "return B"
    ]
    
    "binom calculates the binomial coefficient"
    binom: n kl:k [
        | r i |                    
        r := 1.    "r <-- 1"           
        1 to: k do: [:i |              "for i <-- 1 to k do"
            r := r * (n - i + 1) / i.  "r <-- r * (n - i + 1)/i"
        ].
        ^r  "return r"
    ]
]

c := Bernoulli1 new.
"((Bernoulli1 new) binom: 6 kl:2) printNl."
z := c bernoulli.

1 to: 20 do: [:k |
    (z at: k)  printNl.
].