# git-tag
Bash script for automatically creating a next version Git tag.

Run `git-tag` to create a new tag with increased version number (major, minor or patch) and push the tag to `origin`.

## Installation

Copies shell script to `/usr/local/git-tag/git-tag.sh` and creates symlink at `/usr/local/bin/git-tag`, which should be in your `$PATH`.

```bash
./self-install
```

## Usage

### Increases patch by default

For example `1.2.3` to `1.2.4`

```bash
git-tag
```

Creates `v0.0.1` if no previous tag was found.

### Increase minor

For example `1.2.3` to `1.3.0`

```bash
git-tag --minor
```

### Increase major

For example `1.2.3` to `2.0.0`

```bash
git-tag --major
```


## Options

Option                                    | Description
:---                  | :---
`-h` or `--help`      | Display help.
`--major`             | Increase major number.
`--minor`             | Increase minor number.
`--patch`             | Increase patch number.
`--script-repo=`      | Used in combination with `--self-update`. Sets URI to repository if you want to override the default one. Primarily implemented to be able to self update even if the standard repository have been moved.
`--self-update`       | Update git-tag to latest version. Takes no other options than `--script-repo`.


## Credit

Based on [bash-functions/update.sh](https://github.com/unegma/bash-functions/blob/main/update.sh) by [Unegma](https://unegma.com).

Modified to publish tags to Git repository rather than NPM.
