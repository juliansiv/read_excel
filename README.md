# write_excel
Benchmark Simple xlsx reader vs Creek vs Fastsheet

_Fastsheet need install Rust before_

# how does it works?
* clone repo
* ruby ./read_excel/lib/main.rb

# Bench
ruby: 2.5.5

```
            user     system      total        real
Simple:   4.311004   0.055678   4.366682 (  4.366800)
Creek :   3.110640   0.008020   3.118660 (  3.118712)
Fastsh:   0.190022   0.000000   0.190022 (  0.190027)
```
