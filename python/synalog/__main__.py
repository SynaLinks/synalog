"""Allow ``python -m synalog`` to behave like the ``synalog`` script."""

import sys

from .cli import main

sys.exit(main())
