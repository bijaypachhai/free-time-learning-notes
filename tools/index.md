# Research and learn about these tools

1. top and htop
2. perf
3. pidstat: part of `sysstat` package. Excellent for getting detailed CPU, memory and I/O statistics per process over time. ( e.g, `pidstat -u -p ALL 1` shows per-process CPU usage every second )
4. strace
5. lsof: list open files, including network connections. Can help identify what resource a process is interacting with.
