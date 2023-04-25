<section class="function">
Returns a JSON object from XML.

```
      html ⍝ XHTML-compatible HTML
<html>
  <body>
    <div style="display:inline-block;" class="container">
      <span style="color:red;">
        Lorem Ipsum!
      </span>
    </div>
    <h1 style="text-align:right;">Hello,</h1>
    <h1                          >World!</h1>
  </body>
</html>

      ⎕JSON xmln html
{
  "html": {
    "body": [
      {
        "div": {
          "class": "container",
          "span": {
            "style": "color:red;",
            "value": "Lorem Ipsum!"
          },
          "style": "display:inline-block;"
        }
      },
      {
        "h1": {
          "style": "text-align:right;",
          "value": "Hello,"
        }
      },
      {
        "h1": "World!"
      }
    ]
  }
}
```
</section>

<section class="function">
```apl
#include(home/e/maple/xmln.apl)
```
</section>