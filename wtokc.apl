wtokc ← { ⍝ web token colouring
  t v d i ← ↓⍉201⌶⍬ ⍝ type value description index
  cc      ← 200⌶⍵   ⍝ colour codes
  split   ← (1,2≠/⊣)⊂⊢

  cc {
    grade ← ⍺⍳⍨,v
    idx   ← ⍺∊v
    0=+/idx : ⍵
    mask  ← ∧/¨grade split ⍺∊v
    toks  ← grade split ⍵
    (mask/toks) ← ((idx∧1,2≠/⍺)/grade) {
      '<span style="color: var(--',(⍺⊃d),')">',⍵,'</span>'
    }¨mask/toks
    toks
  }¨ ⍵

}
