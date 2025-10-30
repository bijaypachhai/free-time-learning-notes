 # Package Management on Debian ( And Its Derivatives )

> Debian packages are stored in repositories (usually websites, but can also be local files), which contain information about which versions of which packages are available. Websites can't automatically push updates to your computer so, you need to tell your package manager to pull them.

> [!important]
> **dpkg** manages individual packages, e.g. unzipping them and running their installation instructions. Tools like **apt** get packages from repositories and tell **dpkg** to do the low-level work.

### Update your package list whenever you start installing or updating packages.

> **update** is used to download package information from all configured sources. Other commands operate on this data to e.g. perform package upgrades or search in and display details about all packages available for installation.

```bash
$ sudo apt update
$ sudo aptitude update
$ sudo apt-get update
```

### Upgrade all packages

> **upgrade** is used to install available upgrades of all packages currently installed on the system from the sources configured via `sources.list`. New packages will be installed if required to satisfy dependencies, but existing packages will never be removed. If an upgrade for a package requires the removal of an installed package, the upgrade for this package isn't performed.

> [!caution]
> **full-upgrade** is performs the function of upgrade but will remove currently installed packages if this is needed to upgrade the system as a whole.

```bash
$sudo apt update && sudo apt upgrade  # safe upgrade

$sudo apt update && sudo apt full-upgrade  # full upgrade
```

### Remove unwanted packages after a safe upgrade

```bash
$sudo apt autoremove
$sudo apt-get autoremove
```

### search for packages

> **search** can be used to search for the given regex term(s) in the list of available packages and display matches. This can e.g. be useful if you are looking for packages having specific feature. If you are looking fo ra package including a specific file try **apt-file**.

```bash
$sudo apt search postgres
```

### show package information

> **show** information about the given package(s) including its dependencies, installation and download size, sources the package is available from, the description of the packages content and much more. It can e.g. be helpful to look at this information before allowing **apt** to remove a package or while searching for new packages to install.

```bash
$sudo apt show postgres-contrib
```

### list

> **list** is somewhat similar to **dpkg-query --list** in that it can display a list of packages satisfying certain criteria. It supports patterns for matching package names as well as options to list installed ( `--installed` ), upgradeable ( `--upgradeable` ) or all available ( `--all-versions` ) versions.
