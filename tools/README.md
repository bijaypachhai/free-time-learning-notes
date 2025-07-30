# Tools to debug, analyse performance issues and more
This directory contains references and notes regarding many tools available to debug and analyse different issues on system.

## Getting Memory usage 

```bash
#!/bin/bash
echo "Total memory used by GitLab components:"
ps -eo pid,comm,rss | grep -E 'puma|sidekiq|gitaly|postgres|redis|nginx|workhorse|unicorn|gitlab-shell' \
    | awk '{sum+=$3} END {print "Total RSS (MB):", sum/1024}'


sudo smem -r -c "name pss" | grep -E 'puma|sidekiq|gitaly|postgres|redis|nginx|workhorse|unicorn|gitlab-shell' | \
 awk '{sum+=$2} END {print "Total PSS (MB):", sum/1024}
```

It is mentioned that RSS may overestimate memory usage if processes share memory.
PSS ( `smem` ) is more accurate, especially on shared-memory systems.
