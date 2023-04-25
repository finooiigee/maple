Xmln←{
  obj arr char←1 2 4
  (d k v a t)←↓⍉¯1 ''⍬(0⍴'' '')1⍪⎕XML ⍵

  d+←1 ⋄ ((t∊1 3 7)/t)←obj ⋄ ((t∊5)/t)←char ⋄ (((⊂'')⍷v)/v)←⊂⍬

  I←{(⍺,⍵)[⍺⍺]}

  idx←≢¨a
  i←⍋(⍳≢k),⍸idx
  (k v)←{⍵[i]}¨k v,¨↓⍉↑⊃,/↓¨(0<idx)/a
  d←d(i I)d[⍸idx]+1
  t←obj char[1+0≠∊⍴¨v]

  N←{⊃,/2{↑{⊂⍺ ⍵}⌸⍨/↓⍉1↓⍵,∘(⌊/)⌸⍺}/↓⌈\(⍋⍵)@⊢(∪⍵)∘.=⍵}
  (p c)←↓⍉↑N d

  idx←p∩⍸t=char
  i←⍋(⍳≢k),idx
  v←(((⊂⍬)@idx)v)(i I)v[idx]
  d←d(i I)d[idx+1]
  k←k(i I)(≢i)⍴⊂''
  t[idx]←arr
  t←t(i I)(≢i)⍴⊂char

  (p c)←↓⍉↑N d

  msk←{0∊≠k[⍵]}¨c
  (t[msk/p])←arr
  idx←((∊(t[p]=arr)/c)∩⍸0≠∊⍴¨k)∪∊msk/c
  d[idx]+←1
  d[∊(p∊idx)/c]+←1
  i←⍋(⍳≢k),idx-1
  v←v(i I)(≢i)⍴⊂⍬
  d←d(i I)d[idx]-1
  k←k(i I)(≢i)⍴⊂''
  t←t(i I)(≢i)⍴1
  ⎕JSON 1 ⎕JSON⍠'M'⍉↑d k v t
}
