# rsync

rsync ( **remote sync** ), is a command line tool for synchronizing files and directories locally and remotely. It uses a delta-transfer algorithm to minimize the amount of data copied by moving only portions of files that have changed, making it highly efficient for tasks like backups and mirroring.

> [!Important]
> The trailing slash `/` on the source path is critical, as it dictates whether **rsync** copies the contents of the directory or the directory itself.
> Always test **rsync** commands with the `--dry-run` or `-n` flag to preview the outcome without making any actual changes to the files.
> The `-a` ( **archive** ) flag is recommended for most use cases because it syncs recursively while preserving permissions, ownership and modification times.
> For remote transfers, the `-z` flag compresses file data to reduce network usage, and the `-P` flag shows progress while allowing interrupted transfers to be resumed.
> **rsync** uses **SSH** for secure remote operations.
> You can automate synchronization tasks with **cron**, which requires using absolute paths in your command and configuring passwordless **SSH** key authentication.
