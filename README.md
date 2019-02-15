# Kubectl context manager
## The problem
Kubectl, the kubernetes client, needs context to work correctly. By default, it
uses the file on `~/.kube/config`, which has some problems. One is that you must
have all your configuration in one file (which means manually merging it). If
you've tried, it's awful. Another problem is that it's always pointing to a
cluster, which means that you always *must* know where you're pointing or you'll
have problems.

## The solution
With this plugin, you won't have none of that problems. It searches in the
`~/.kube` directory por files ended in `-config`, like for example
`~/.kube/something-config`. So, instead of having `~/.kube/config` you'll have
`~/.kube/small-config` and `~/.kube/small2-config`. And since you don't need the
general config file, by default any kubectl command will point to localhost,
which is the default.

## Usage
The usage is very simple, it has two commands, `ksp` and `kgp`. The first one
changes the context (with autocomplete support) and the second just shows which
one you're using.

## How it works
What `ksp` does under the hood is just change the
`$KUBECONFIG`, which is the variable in which `kubectl` searches for the
configuration file. This can be used with other cool stuff, for example to
visualize in your prompt the cluster and context in which you're working.

## Integrations
There's several ways projects that work with the prompt, the ones I know are
this:
- [Oh My Zsh's Kube-ps1](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/kube-ps1)

- [Kube-ps1 for bash or plain zsh](https://github.com/jonmosco/kube-ps1)

- [Spaceship theme for Oh My Zsh](https://denysdovhan.com/spaceship-prompt/docs/Options.html#exit-code-exit_code)

## Based on
This plugin is based on the
[aws](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#aws) one.

# License
MIT
