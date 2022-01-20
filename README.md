# git-tag
Bash script for automatically creating next git tag.

## Installation

```bash
./self-install
```

## Usage

Increase **patch** by default – for example `1.2.3` to `1.2.4`.

```bash
git-tag
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
