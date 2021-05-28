# Exercism Wren Track

[![configlet](https://github.com/exercism/wren/workflows/configlet/badge.svg)](https://github.com/exercism/wren/actions?query=workflow%3Aconfiglet)
[![javascript / master](https://github.com/exercism/wren/workflows/wren%20/%20main/badge.svg)](https://github.com/exercism/wren/actions?query=workflow%3A%22wren+%2F+main%22)


**Exercism exercises in Wren**

This is the Wren track, one of the many tracks on [Exercism][web-exercism].
It holds all the _exercises_ that are currently implemented and available for students to complete.
The track currently consists only of _practice_ exercises at the moment (no concepts).
You can find this in the [`config.json`][file-config].


## Tools

See [CONTRIBUTING.md][file-contributing] for a list of requirements to contribute to this track.
It also has a list of tools you can use, of which the `test` tool is one of them.


## Running the test suite

This runs `testie` tests for all sample solutions.
This _does not_ use the regular way to run `jest`, because the example solution files must be renamed to be imported correctly into the test files.

```shell
./scripts/ci
```

If the a single argument is passed, only _that_ exercise is tested.
For example, if you only want to test the `hello-world.wren` sample for the practice exercise `hello-world`, you may, depending on your environment, use:

```shell
./scripts/ci hello-world
```

### The Exercism Wren Stack

- Wren Exercises (this repo)
- [Wren Test Runner](https://github.com/exercism/wren-test-runner)
- [Wren Representer](https://github.com/exercism/wren-representer)
- Wren Analyzer - *nope, not yet.*
- [Wren CodeMirror Language Support](https://github.com/exercism/codemirror-lang-wren)
- [Wren Console](https://github.com/joshgoebel/wren-console) - Wren runtime environment
- [Wren Package](https://github.com/joshgoebel/wren-package) - dependency management
- [Wren Testie](https://github.com/joshgoebel/wren-testie) - exercise test suites


[web-exercism]: https://exercism.io
[file-config]: https://github.com/exercism/wren/blob/main/config.json
[file-contributing]: https://github.com/exercism/wren/blob/main/CONTRIBUTING.md
