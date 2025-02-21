## Installs

Will install tools on Ubuntu systems.

> [!NOTE]
> Make sure `install.sh` and files in `installs/` are executable.

```bash
./install.sh
```

For dry runs:

```bash
./install.sh --dry
```

## Upgrades

Will upgrade installed apps that have simple upgrades.

> [!NOTE]
> Make sure `upgrade.sh` and files in `upgrades/` are executable.

```bash
./upgrade.sh
```

For dry runs:

```bash
./upgrade.sh --dry
```

## Env

> [!CAUTION]
> Will delete exisiting versions of `.bashrc` and `.gitconfig` before copying
> from this repo.

Will copy dirs in `dotfiles` to `~/.config` and files in `env/` to `~/`.

> [!NOTE]
> Make sure `env.sh` is executable.

```bash
./env.sh
```

For dry runs:

```bash
./env.sh --dry
```
