Xmln←{
  obj arr char←1 2 4
  d k v a t ← ↓⍉0 '' ⍬ (0⍴'' '') 1⍪⎕XML ⍵
  d[1↓⍳≢k]+←1 ⋄ t←m+t×~m←t∊1 3 7 ⋄ t-←t∊5 ⋄ v←⍬∘,¨v

  I ← {(⊂⍺)⌷⍵}

  loc ← ≢¨a
  msk←0<loc
  p←⍸msk∧char=t
  idx←p,⍸loc
  i←⍋(⍳≢k),idx
  c←v[p]
  v[p]←⊂⍬
  k v (i I,)← ((≢p)⍴⊂'value') c ,¨ ↓⍉↑⍪/msk/a
  d   (i I,)← 1+d[idx]
  t[p]←obj
  t   (i I,)← (≢idx)⍴char

  p c ← ↓⍉↑⊃,/2{↑{⊂⍺ ⍵}⌸⍨/↓⍉1↓⍵,∘(⌊/)⌸⍺}/↓⌈\(⍋d)@⊢(∪d)∘.=d
  msk←{0∊≠k[⍵]}¨c
  (t[msk/p])←arr
  idx←∊msk/c
  d[{⍵∪∊(p∊⍵)/c}⍣≡∊(p∊idx∩∊c)/c]+←1
  d[idx∩∊c]+←1
  i←⍋(⍳≢k),idx-1
  v (i I,)← (≢i)⍴⊂⍬
  d (i I,)← d[idx]-1
  k (i I,)← (≢i)⍴⊂''
  t (i I,)← (≢i)⍴1
  ⎕JSON 1 ⎕JSON⍠'M'⍉↑d k v t
}
