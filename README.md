# ctxspy

Profile the context window of your LLM agent.

[![CI](https://github.com/dfranco-projects/ctxspy/actions/workflows/ci.yml/badge.svg)](https://github.com/dfranco-projects/ctxspy/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

## The idea

Every request an agent sends to a model carries a context window: the system prompt, tool definitions, conversation history, and retrieved documents. Each part costs tokens, and that budget is limited. Teams rarely know how it is being spent.

ctxspy reads an agent trace and reports the token cost of each part of the context window. With that report you can see where the budget goes, find waste, and decide what to cut.

## Status

Early development. There is no release yet. This repository currently contains the project setup.

Planned:

- Token breakdown per request: system prompt, tools, history, retrieved documents
- Detection of repeated or overlapping retrieved chunks
- Detection of tools that are sent with every request but never called
- Input adapters for OpenTelemetry GenAI spans and raw provider payloads
- A CLI for quick reports and a Python API for automated checks

## Development

Requires [uv](https://docs.astral.sh/uv/).

```bash
make install   # set up the environment and git hooks
make check     # lint, typecheck, and test
make help      # list all targets
```

Commits follow [Conventional Commits](https://www.conventionalcommits.org/). Releases are automated: [python-semantic-release](https://python-semantic-release.readthedocs.io/) reads the commit history on `main`, sets the version, writes the changelog, and publishes to PyPI.

## License

[MIT](LICENSE)
