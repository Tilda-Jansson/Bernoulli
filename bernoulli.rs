// rustc bernoulli.rs
// ./bernoulli 


fn main() {
    let y = bernoulli();
    println!("{:?}", y);
}

// Calculates the 20 first bernoulli numbers 
fn bernoulli() -> [f32; 20]{
    let mut bNumbers: [f32; 20] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];

    bNumbers[0] = 1 as f32;
    for m in 1..20 {
        bNumbers[m] = 0.0;

        for k in 0..(m) {
            bNumbers[m] = bNumbers[m] - (binom(m as i32 + 1i32, k as i32) * bNumbers[k]);
        }
        bNumbers[m] = bNumbers[m]/(m+1) as f32;
    }
    bNumbers
}

// binom calculates the binomial coefficient
fn binom(n: i32, k: i32) -> f32{
    let mut r: f32 = 1.0;
    for i in 1i32..(k+1) {
        r = (r * (n - i + 1) as f32)/ i as f32;
    }
    r
}