# Member ordering

![Configurable](https://img.shields.io/badge/-configurable-informational)

## Rule id

member-ordering-extended

## Description

**Note:** Don't use it with the default member-ordering rule!

Enforces extended member ordering.

The value for the `order` entry should match the following pattern:

`
< (overridden | protected)- >< (private | public)- >< static- >< late- >< (var | final | const)- >< nullable- >< named- >< factory- > (fields | getters | getters-setters | setters | constructors | methods)
`

where values in the `<>` are optional, values in the `()` are interchangeable and the last part of the pattern which represents a class member type is **REQUIRED**.

**Note:** not all of the pattern parts are applicable for every case, for example, `late-constructors` are not expected, since they are not supported by the language itself.

For example, the value for `order` may be an array consisting of the following strings:

- public-late-final-fields
- private-late-final-fields
- public-nullable-fields
- private-nullable-fields
- named-constructors
- factory-constructors
- getters
- setters
- public-static-methods
- private-static-methods
- protected-methods
- etc.

You can simply configure the rule to sort only by a type:

- fields
- methods
- setters
- getters (or just **getters-setters** if you don't want to separate them)
- constructors

The default config is:

- public-fields
- private-fields
- public-getters
- private-getters
- public-setters
- private-setters
- constructors
- public-methods
- private-methods

The `alphabetize` option will enforce that members within the same category should be alphabetically sorted by name.

### Config example

With the default config:

```yaml
dart_code_metrics:
  ...
  rules:
    ...
    - member-ordering
```

**OR** with a custom one:

```yaml
dart_code_metrics:
  ...
  rules:
    ...
    - member-ordering:
        alphabetize: true
        order:
          - public-fields
          - private-fields
          - constructors
```
