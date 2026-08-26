import re

import ctxspy


def test_version_is_semver() -> None:
    assert re.fullmatch(r"\d+\.\d+\.\d+", ctxspy.__version__)
