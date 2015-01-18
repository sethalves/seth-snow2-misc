
%{
%}

intraline_whitespace    " "|"\t"
whitespace              {intraline_whitespace}+|{line_ending}
line_ending             "\n"|"\r"

comment                 {semi_comment}|{nested_comment}|{multiline_sh_bang}|{oneline_sh_bang}
semi_comment            ";"[^\n]*
nested_comment          "#|"{comment_text}*"|#"
comment_text            [^|]*

multiline_sh_bang       "#!"([^\r\n]*[\r\n]){1,4}"!#"
oneline_sh_bang         "#!"[^\r\n]*[\r\n]

identifier0             {initial}{subsequent}*
identifier1             "|"{symbol_element}*"|"
identifier2             {peculiar_identifier}
keyword0                "#:"{subsequent}*
keyword1                ":"{subsequent}*
initial                 {letter}|{special_initial}|{inline_hex_escape}
letter                  [a-zA-Z]
special_initial         "!"|"$"|"%"|"&"|"*"|"/"|"<"|"="|">"|"?"|"^"|"_"|"~"
subsequent              {initial}|{digit}|{special_subsequent}
digit                   [0-9]
hex_digit               [0-9a-fA-F]
explicit_sign           "+"|"-"
special_subsequent      {explicit_sign}|"."|"@"|":"
inline_hex_escape       "\\x"{hex_scalar_value}";"
hex_scalar_value        {hex_digit}+
peculiar_identifier     {explicit_sign}|{explicit_sign}{sign_subsequent}{subsequent}*|{explicit_sign}"."{dot_subsequent}{subsequent}*|"."{non_digit}{subsequent}*
non_digit               {dot_subsequent}|{explicit_sign}
dot_subsequent          {sign_subsequent}|"."
sign_subsequent         {initial}|{explicit_sign}|"@"
symbol_element          [^|\\]|{inline_hex_escape}
boolean_true            "#t"|"#true"
boolean_false           "#f"|"#false"
character               "#\\".
character_long          "#\\"{character_name}
character_hex           "#\\x"{hex_scalar_value}
character_name          "alarm"|"backspace"|"delete"|"escape"|"newline"|"null"|"return"|"space"|"tab"
string                  "\""{string_element}*"\""
string_element          [\x00-\xff]{-}[\"\\]|"\\a"|"\\b"|"\\t"|"\\n"|"\\r"|"\\\""|"\\\\"|"\\"{intraline_whitespace}{line_ending}{intraline_whitespace}|{inline_hex_escape}


num_2                   {prefix_2}{complex_2}
complex_2               {real_2}|{real_2}"@"{real_2}|{real_2}"+"{ureal_2}"i"|{real_2}"-"{ureal_2}"i"|{real_2}"+i"|{real_2}"-i"|{real_2}{infinity}"i"|"+"{ureal_2}"i"|"-"{ureal_2}"i"|{infinity}"i"|"+i"|"-i"
real_2                  {sign}{ureal_2}|{infinity}
ureal_2                 {uinteger_2}|{uinteger_2}"/"{uinteger_2}|{decimal_2}
decimal_2               {uinteger_2}{suffix}|"."{digit_2}+{suffix}|{digit_2}+"."{digit_2}*{suffix}
uinteger_2              {digit_2}+
prefix_2                {radix_2}{exactness}|{exactness}{radix_2}

num_8                   {prefix_8}{complex_8}
complex_8               {real_8}|{real_8}"@"{real_8}|{real_8}"+"{ureal_8}"i"|{real_8}"-"{ureal_8}"i"|{real_8}"+i"|{real_8}"-i"|{real_8}{infinity}"i"|"+"{ureal_8}"i"|"-"{ureal_8}"i"|{infinity}"i"|"+i"|"-i"
real_8                  {sign}{ureal_8}|{infinity}
ureal_8                 {uinteger_8}|{uinteger_8}"/"{uinteger_8}|{decimal_8}
decimal_8               {uinteger_8}{suffix}|"."{digit_8}+{suffix}|{digit_8}+"."{digit_8}*{suffix}
uinteger_8              {digit_8}+
prefix_8                {radix_8}{exactness}|{exactness}{radix_8}

num_10                  {prefix_10}{complex_10}
complex_10              {real_10}|{real_10}"@"{real_10}|{real_10}"+"{ureal_10}"i"|{real_10}"-"{ureal_10}"i"|{real_10}"+i"|{real_10}"-i"|{real_10}{infinity}"i"|"+"{ureal_10}"i"|"-"{ureal_10}"i"|{infinity}"i"|"+i"|"-i"
real_10                 {sign}{ureal_10}|{infinity}
ureal_10                {uinteger_10}|{uinteger_10}"/"{uinteger_10}|{decimal_10}
decimal_10              {uinteger_10}{suffix}|"."{digit_10}+{suffix}|{digit_10}+"."{digit_10}*{suffix}
uinteger_10             {digit_10}+
prefix_10               {radix_10}{exactness}|{exactness}{radix_10}

num_16                  {prefix_16}{complex_16}
complex_16              {real_16}|{real_16}"@"{real_16}|{real_16}"+"{ureal_16}"i"|{real_16}"-"{ureal_16}"i"|{real_16}"+i"|{real_16}"-i"|{real_16}{infinity}"i"|"+"{ureal_16}"i"|"-"{ureal_16}"i"|{infinity}"i"|"+i"|"-i"
real_16                 {sign}{ureal_16}|{infinity}
ureal_16                {uinteger_16}|{uinteger_16}"/"{uinteger_16}|{decimal_16}
decimal_16              {uinteger_16}{suffix}|"."{digit_16}+{suffix}|{digit_16}+"."{digit_16}*{suffix}
uinteger_16             {digit_16}+
prefix_16               {radix_16}{exactness}|{exactness}{radix_16}

infinity                "+inf.0"|"-inf.0"|"+nan.0"
suffix                  ""|{exponent_marker}{sign}{digit_10}+
exponent_marker         "e"|"s"|"f"|"d"|"l"
sign                    ""|"+"|"-"
exactness               ""|"#i"|"#e"

radix_2                 "#b"
radix_8                 "#o"
radix_10                ""|"#d"
radix_16                "#x"
digit_2                 [0-1]
digit_8                 [0-7]
digit_10                {digit}
digit_16                [0-9a-fA-F]

%%

\(                      {} //  1 left-paren
\)                      {} //  2 right-paren
\[                      {} //  3 left-square-brace
\]                      {} //  4 right-square-brace
#\(                     {} //  5 vector-start
#u8\(                   {} //  6 bytevector-start
{whitespace}            {} //  7 whitespace
{comment}               {} //  8 comment
{identifier0}           {} //  9 symbol0
{identifier1}           {} // 10 symbol1
{identifier2}           {} // 11 symbol2
{keyword0}              {} // 12 keyword0
{keyword1}              {} // 13 keyword1
{boolean_true}          {} // 14 true
{boolean_false}         {} // 15 false
{character}             {} // 16 character
{character_long}        {} // 17 character-long
{character_hex}         {} // 18 character-hex
{string}                {} // 19 string
{num_2}                 {} // 20 number-2
{num_8}                 {} // 21 number-8
{num_10}                {} // 22 number-10
{num_16}                {} // 23 number-16
\.                      {} // 24 dot
'                       {} // 25 quote
`                       {} // 26 quasiquote
,@                      {} // 27 unquote-splicing
,                       {} // 28 unquote

%%
