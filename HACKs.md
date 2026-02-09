# Some hacks

## Fix git HTTPS token

```bash
git config --global url."https://{TOKEN}:@github.com/".insteadOf "https://github.com/"
```

## Disable editing .gitconfig

```bash
touch ~/.gitconfig.lock
```

## Using multi profile for ssh keys

```bash
# ~/.ssh/config
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/non_existent_key
    IdentitiesOnly yes

Host github-user
  HostName github.com
  User git
  IdentityFile ~/.ssh/github-user
  IdentitiesOnly yes
```
