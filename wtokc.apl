wtokc ← { ⍝ www token colouring
  t v d i ← ↓⍉201⌶⍬ ⍝ type value description index
  cc      ← 200⌶⍵   ⍝  colour codes
  split   ← (1,2≠/⊣)⊂⊢
  keys    ← v[d⍳,¨'SCOL_DFN_NAME' 'MINI_NC' 'MINI_CC' 'MINI_PRIMITIVE' 'MINI_COMMENT' 'SCOL_LAMP' 'MINI_META' 'MINI_IDIOM' '{' '}']
  classes ← 'identifier' 'array' 'character' 'primitive' 'comment' 'comment' 'symbol' 'idiom' 'brace' 'brace'

  cc {
    grade ← ⍺⍳⍨,keys
    idx   ← ⍺∊keys
    0=+/idx : ⍵
    mask  ← ∧/¨grade split ⍺∊keys
    toks  ← grade split ⍵
    (mask/toks) ← ((idx∧1,2≠/⍺)/grade) {
      '<span class="',(⍺⊃classes),'">',⍵,'</span>'
    }¨mask/toks
    toks
  }¨ ⍵

}
