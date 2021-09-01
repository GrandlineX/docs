#!/usr/bin/env bash
mkdocs build
mv site/* .
rmdir site
