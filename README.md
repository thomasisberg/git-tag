# git-tag
Bash script for automatically creating next git tag.

## Installation

Copies shell script to `/usr/local/git-tag.sh` and creates symlink at `/usr/local/bin/git-tag`, which should be in your `$PATH`.

```bash
./self-install
```

## Usage

Increases *patch* by default – for example `1.2.3` to `1.2.4`.

```bash
git-tag
```

You may also specify patch:

```bash
git-tag --patch
```

### Increase minor

For example `1.2.3` to `1.3.0`.

```bash
git-tag --minor
```

### Increase major

For example `1.2.3` to `2.0.0`.

```bash
git-tag --major
```
