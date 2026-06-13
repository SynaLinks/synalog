# License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

"""Allow ``python -m synalog`` to behave like the ``synalog`` script."""

import sys

from .cli import main

sys.exit(main())
