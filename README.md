# SCANOSS Homebrew tap

This tap catalogs Homebrew definitions for SCANOSS tools. Its current package
definitions need maintenance before they provide a reliable new-install path:
Homebrew rejects legacy cask and formula syntax, and both formula source
archives are unavailable to unauthenticated downloads.

## Install

The intended SCANOSS Code Compare command is:

```sh
# macOS desktop app and scanoss-cc command
brew install --cask scanoss/dist/scanoss-code-compare
```

Current Homebrew validation rejects the cask's legacy install-step syntax. Use
the project's [current installation
instructions](https://github.com/scanoss/scanoss.cc#installation) until the cask
is updated.

After the tap is brought current, it can also be added once for shorter package
names:

```sh
brew tap scanoss/dist
brew install --cask scanoss-code-compare
```

## Use

Verify SCANOSS Code Compare and open it from the command line:

```sh
scanoss-cc --version
scanoss-cc
```

The cask also installs **SCANOSS Code Compare** in the macOS Applications
folder. Running `scanoss-cc` without arguments uses the current directory as
the scan root.

## Available packages

| Package | Kind | Installed command or app | Upstream status |
| --- | --- | --- | --- |
| [`scanoss-code-compare`](https://github.com/scanoss/scanoss.cc) | macOS cask | `scanoss-cc`; SCANOSS Code Compare.app | Definition present; current Homebrew rejects its legacy install-step syntax |
| [`scanner.c`](Formula/scanner.c.rb) | Legacy formula | `scanner` | Definition present; upstream archive is not publicly downloadable |
| [`quickscan-lite`](Formula/quickscan-lite.rb) | Legacy formula | `quickscan-lite-macoss` | Definition present; current Homebrew rejects its syntax and its upstream archive is not publicly downloadable |

This table reflects the files currently present in `Casks/` and `Formula/`.

## Update

For a package that was installed previously, refresh Homebrew metadata and
check its status:

```sh
brew update
brew outdated
```

An upgrade cannot complete while a definition fails validation or its upstream
archive is unavailable. Once the relevant definition is repaired, upgrade it
with `brew upgrade <package>`.

## Uninstall

```sh
brew uninstall --cask scanoss-code-compare
brew uninstall scanner.c
brew uninstall quickscan-lite
```

For SCANOSS Code Compare, add `--zap` to remove the application's managed
preferences and saved state:

```sh
brew uninstall --cask --zap scanoss-code-compare
```

After uninstalling all packages from this tap, remove the tap if it is no
longer needed:

```sh
brew untap scanoss/dist
```

## Troubleshooting

### Homebrew cannot find a package

Refresh Homebrew and confirm that the tap is installed:

```sh
brew update
brew tap | grep '^scanoss/dist$'
```

If the tap is missing, run `brew tap scanoss/dist` and retry the installation.

### Homebrew rejects a package definition

The definitions currently kept in this tap predate Homebrew's active syntax
rules. This is a tap maintenance issue, not a local cache problem. Use SCANOSS
Code Compare's linked upstream installation instructions; do not repeatedly
retry the same Homebrew command.

### A package is already installed but not current

```sh
brew outdated
brew upgrade <package>
```

Use an exact package name from the table above.

### A legacy formula cannot download its source

The `scanner.c` and `quickscan-lite` definitions remain in this tap, but their
configured upstream GitHub archives currently return `404` to unauthenticated
downloads. Do not rely on either formula for a new installation.

### Homebrew reports an environment problem

Run `brew doctor` and follow Homebrew's diagnostics. General installation and
command documentation is available at [docs.brew.sh](https://docs.brew.sh/).

## Maintainer guide

Package definitions live in:

- `Casks/` for macOS applications;
- `Formula/` for command-line formulae.

Pull requests run Homebrew's syntax and package checks on macOS and Linux. To
run the same static tap check locally with Homebrew installed:

```sh
brew test-bot --only-tap-syntax
```

Formula and cask updates must pin an upstream release URL and its exact SHA-256
digest. Keep the package inventory in this README synchronized with the files
in `Casks/` and `Formula/`.

Maintainers may apply the `pr-pull` label after review to run the repository's
bottle publication workflow. That workflow publishes to `main`; contributors
should not invoke it directly.
