## Hi there

This is workspace for all my flutter projects and libraries. I believe in monorepo organization and use it for make my development experience easier. 

---

### About

There is will be info about my repos in future 



### Short info how I do common things

__How to add submodule__

1. init via command below

```shell
git submodule add --force https://github.com/git-module-url packages/dir_name
```

2. add info to .gitmodules
3. run ```melos gitinit```

__How to add localization__

1. package should have next structure

```yaml
lib/shared/l10n/
  - data/
    - en_US
    - other_LANG
  - l10n.dart
```

2. after adding any new text run `melos locale_keys` This action will generate `l10n.g.dart` file in package with `L10nKey` class with all locale keys that your json files in `lib/shared/data` have.