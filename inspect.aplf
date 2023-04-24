inspect ← {
    ⍺←⊢ ⋄ operand←⍺⍺ ⋄ names←⊆⍵⍵
    _← names(⍎,)¨⊂'←⎕NULL'
    _← ⎕FX(,names,¨'←')⎕R(,names,¨⊂'∘←')¨⎕NR 'operand'
    _← ⍺ operand ⍵
    ⍎∊names,¨' '
}