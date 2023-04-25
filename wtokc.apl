wtokc ← { ⍝ www token colouring
  t v d i ← ↓⍉201⌶⍬ ⍝ type value description index
  cc      ← 200⌶⍵   ⍝  colour codes
  split   ← (1,2≠/⊣)⊂⊢
  keys    ← v[d⍳,¨'SCOL_DFN_NAME' 'MINI_NC' 'MINI_CC' 'MINI_PRIMITIVE' 'MINI_COMMENT' 'SCOL_LAMP' 'MINI_META' 'MINI_IDIOM' '{' '}']
  colours ← 'rgb(130,165,150)' 'rgb(210,135,155)' 'rgb(80,140,140 )' 'rgb(220,110,70 )'
  colours,← 'rgb(125,110,100)' 'rgb(125,110,100)' 'rgb(190,170,150)' 'rgb(150,185,115)'  
  colours,← 'rgb(210,135,155)' 'rgb(210,135,155)'

  cc {
    grade ← ⍺⍳⍨,keys
    idx   ← ⍺∊keys
    0=+/idx : ⍵
    mask  ← ∧/¨grade split ⍺∊keys
    toks  ← grade split ⍵
    (mask/toks) ← ((idx∧1,2≠/⍺)/grade) {
      '<span style="color:',(⍺⊃colours),'">',⍵,'</span>'
    }¨mask/toks
    toks
  }¨ ⍵
}