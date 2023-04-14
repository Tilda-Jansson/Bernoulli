;; clojure
;; pasta in

;; binom calculates the binomial coefficient
(defn- binom [n k]
  (if (or (= k 0) (= n k)) ; if k == 0 or k == n return 1, base case
    (int 1)
    (int (+ (binom (- n 1) (- k 1)) ; recursive step
            (binom (- n 1) k)))))

; Computes the next element in the sequence and adds it to the list B
(defn computeEachElemInB [B]
  (let [m (count B) ;2
        m+1 (inc m) ;3 ;; k=1, Bk = -1/2, => -1.5 => 1.5
        terms (map-indexed (fn [k Bk] (- (* Bk (binom m+1 k)))) B) ;apply anonymous func to B 
        ] ; 1 + -1/2= 0.5, 0.5/3 = 0.16666... 
    (conj B (/ (apply + terms) m+1)))) ; Add on to list B


(defn bernoulli [n] ;Lazy sequence cause of "iterate"
  (first (drop n (iterate computeEachElemInB [1])))) ; add last if we don't want the entire list and just spec. elem

(bernoulli 20) ; Get a list with the 20 first bernoulli numbers