mdx ← {
  nl      ← ⎕JSON '"\n"'
  Tag     ← {'<',⍺,'>',⍵,'</',⍺,'>'}
  Trim    ← {(∨\' '≠⍵)/⍵}
  _R_     ← {⍺⍺⎕R(⍵⍵{⍵.Match})⍠'Mode' 'M'⊢⍵}
  _Ignore ← {
    ∊(⍺⍺{⍺⍺¨@(⍸∧/¨⍺)⊢⍵})/mask ⍵⊂⍨¨⊂1,2≠/mask←(≠\⍱0 ¯1 ¯2(⊃∨.⌽)⊂)¯1⌽(nl,'```')⍷⍵
  }
  Literal ← (,¨'<' '>')⎕R'&lt;' '&gt;'⍠('Regex' 0)

  html ← '^(#{1,6}\s*).*' _R_ {
    (prfx title)←⍵⊂⍨≠∧\'#'=⍵
    ('h',⍕≢prfx) Tag Trim title
  } _Ignore ⍵

  html ← '\[(.*?)\]\(.*?\)' _R_ {
    (alias href)←']('(((0=⊢∨¯1⌽⊢)⍷)⊆⊢)¯1↓1↓⍵
    '<a href="',href,'">',alias,'</a>'
  } _Ignore html

  html ← '^\*.*(\n[ ]*?\*.*)*' _R_ {
    k ←   '\*.*'⎕S{Trim 1↓⍵.Match} ⍵
    d ← +/∧\'*'≠↑nl(≠⊆⊢)⍵
    (p c) ← ↓⍉↑⊃,/2{↑{⊂⍺ ⍵}⌸⍨/↓⍉1↓⍵,∘(⌊/)⌸⍺}/↓⌈\(⍋d)@⊢(∪d)∘.=d
    'ul' Tag∊ {
        ⍵∊p: 'li' Tag (k[⍵],'ul' Tag∊ ∇¨(p⍳⍵)⊃c)
             'li' Tag (k[⍵])
    }¨(⍸⌊/=⊢)d
  } _Ignore html

  html ← '^([^\<\s]|<code|<a|[ ]+\S).*(\n([^\<\s]|<code|<a|[ ]+\S).*)*' _R_ {
    'p' Tag ⍵
  } _Ignore html

  html ← '`[\s\S]+?`' _R_ ({'code' Tag ¯1↓1↓⍵ } Literal) _Ignore html

  html ← '^```([\s\S]+?)^```' _R_ ({
    'pre' Tag {
      ∨/'apl'⍷∊1↑⍵: '''(.*?('''')?.*?)''' _R_ {Literal ⍵} ∊wtokc 1↓⍵
      Literal ∊1↓⍵
    }¯1↓⍵⊂⍨1,2≠/nl≠⍵
  }) html

  html
}
