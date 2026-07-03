to compile use this:

```bash
gcc -Og -fno-pie -no-pie -fcf-protection=none -fno-asynchronous-unwind-tables -save-temps -o <executable> <source>
```
